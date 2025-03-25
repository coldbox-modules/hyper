/**
 * Creates new requests with optional defaults.
 */
component singleton {

	property name="interceptorService" inject="box:interceptorService";
	property name="wirebox"            inject="wirebox";
	property name="asyncManager"; // use wirebox to inject this until CommandBox supports `box:asyncManager`

	/**
	 * Create a new HyperBuilder.
	 * Any arguments passed are set on the default request.
	 *
	 * @returns The new HyperBuilder instance.
	 */
	public HyperBuilder function init( defaults = new Hyper.models.HyperRequest() ) {
		this.defaults = arguments.defaults;
		for ( var key in arguments ) {
			if ( key == "defaults" ) {
				continue;
			}

			invoke(
				this.defaults,
				"set#key#",
				[ arguments[ key ] ]
			);
		}
		return this;
	}

	public void function onDIComplete() {
		if ( structKeyExists( variables, "interceptorService" ) ) {
			this.defaults.setInterceptorService( variables.interceptorService );
		}

		if ( structKeyExists( variables, "wirebox" ) ) {
			variables.asyncManager = variables.wirebox.getAsyncManager();
		}

		if ( structKeyExists( variables, "asyncManager" ) ) {
			this.defaults.setAsyncManager( variables.asyncManager );
		}
	}

	/**
	 * Registers a new custom Hyper client with the given request.
	 *
	 * @alias    The WireBox mapping for the custom client.
	 * @defaults The request to use as the defaults for the custom client.
	 *
	 * @throws   HyperNonColdBoxContext
	 * @returns  The HyperRequest instance being used as the defaults.
	 */
	public HyperRequest function registerAs( required string alias, required HyperRequest defaults ) {
		if ( !structKeyExists( variables, "wirebox" ) ) {
			throw(
				type    = "HyperNonColdBoxContext",
				message = "No wirebox instance available to register custom client. Are you sure you are running in a ColdBox context?"
			);
		}

		variables.wirebox
			.getBinder()
			.forceMap( alias )
			.to( "hyper.models.HyperBuilder" )
			.asSingleton()
			.initWith( defaults = arguments.defaults );

		return arguments.defaults;
	}

	/**
	 * Create a new request from the default request.
	 *
	 * @returns A new HyperRequest instance from the default request.
	 */
	public HyperRequest function new() {
		var req = this.defaults.duplicate();
		req.setBuilder( this );
		if ( !isNull( variables.fakeConfiguration ) ) {
			req.setFakeConfiguration( variables.fakeConfiguration );
		}
		if ( !isNull( variables.prevent ) ) {
			req.setPreventStrayRequests( variables.prevent );
		}
		return req;
	}

	/**
	 * Sets this HyperBuilder to fake HTTP requests. Used primarily for testing.
	 * Accepts an optional configuration struct of patterns to response generator functions.
	 * Usually called in a `beforeAll` block.
	 *
	 * @configuration An optional configuration struct of patterns to response generator functions.
	 *
	 * @returns       The HyperBuilder instance.
	 */
	public HyperBuilder function fake( struct configuration = {} ) {
		variables.fakeConfiguration = arguments.configuration;
		return this;
	}

	/**
	 * Sets the HyperBuilder to prevent stray requests.
	 * Must be called after setting the builder to `fake()`.
	 *
	 * @prevent Whether to prevent stray requests. Defaults: `true`.
	 *
	 * @throws  HyperFakeNotEnabled
	 *
	 * @returns The HyperBuilder instance.
	 */
	public HyperBuilder function preventStrayRequests( boolean prevent = true ) {
		if ( !structKeyExists( variables, "fakeConfiguration" ) ) {
			throw( type = "HyperFakeNotEnabled", message = "Call `fake()` before calling `preventStrayRequests()`." );
		}
		variables.prevent = arguments.prevent;
		return this;
	}

	/**
	 * Records a request and fake response for later assertions.
	 *
	 * @req The HyperRequest being made.
	 * @res The FakeHyperResponse being returned.
	 *
	 * @returns The FakeHyperResponse being recorded.
	 */
	public FakeHyperResponse function record( required HyperRequest req, required FakeHyperResponse res ) {
		param variables.requests = [];
		variables.requests.append( {
			req : arguments.req,
			res : arguments.res
		} );
		return arguments.res;
	}

	/**
	 * Registers a sequence of responses for a given pattern.
	 * Called when returning an array from the response generator function.
	 *
	 * @pattern  The pattern the sequence is registered against.
	 * @sequence The array of FakeHyperResponse instances to return in order.
	 *
	 * @returns  The HyperBuilder instance.
	 */
	public HyperBuilder function registerSequence( required string pattern, required array sequence ) {
		param variables.sequences                = {};
		variables.sequences[ arguments.pattern ] = arguments.sequence;
		return this;
	}

	/**
	 * Returns whether a sequence has been registered for a given pattern.
	 *
	 * @pattern The pattern to check for a registered sequence.
	 *
	 * @returns boolean
	 */
	public boolean function hasSequenceForPattern( required string pattern ) {
		param variables.sequences = {};
		return structKeyExists( variables.sequences, arguments.pattern );
	}

	/**
	 * Returns the next response in the sequence for a given pattern.
	 *
	 * @pattern The pattern to return the next response for.
	 *
	 * @throws  HyperFakeSequenceMissing
	 * @throws  HyperFakeSequenceExhausted
	 *
	 * @returns The next FakeHyperResponse in the sequence.
	 */
	public FakeHyperResponse function popResponseForSequence( required string pattern ) {
		param variables.sequences = {};
		if ( !structKeyExists( variables.sequences, arguments.pattern ) ) {
			throw(
				type    = "HyperFakeSequenceMissing",
				message = "No sequence registered for pattern #arguments.pattern#",
				detail  = "Registered patterns are: [#variables.sequences.keyArray().toList( ", " )#]"
			);
		}
		var sequence                    = variables.sequences[ arguments.pattern ];
		param variables.sequenceIndexes = {};
		if ( !variables.sequenceIndexes.keyExists( arguments.pattern ) ) {
			variables.sequenceIndexes[ arguments.pattern ] = 1;
		}
		var sequenceIndex = variables.sequenceIndexes[ arguments.pattern ];
		if ( sequenceIndex > sequence.len() ) {
			throw(
				type    = "HyperFakeSequenceExhausted",
				message = "Sequence for pattern #arguments.pattern# is out of responses."
			);
		}
		var nextRes                                    = sequence[ sequenceIndex ];
		variables.sequenceIndexes[ arguments.pattern ] = sequenceIndex + 1;
		return nextRes;
	}

	/**
	 * Returns the number of fake requests that have been made.
	 *
	 * @returns numeric
	 */
	public numeric function getFakeRequestCount() {
		param variables.requests = [];
		return variables.requests.len();
	}

	/**
	 * Returns whether a request has been made that matches the callback.
	 * Each request that has been made is passed to the predicate.
	 * If the predicate returns true, the request is considered a match and true is returned.
	 * If no request passed the predicate, false is returned.
	 *
	 * @predicate  A callback function that returns true if the request matches the criteria and returns false otherwise.
	 *
	 * @returns	   boolean
	 */
	public boolean function wasRequestSent( required function predicate ) {
		for ( var record in variables.requests ) {
			var matched = arguments.predicate( record.req );
			if ( matched ) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Clears the fake configuration from this HyperBuilder.
	 * Usually called in an `afterAll` block.
	 *
	 * @returns The HyperBuilder instance.
	 */
	public HyperBuilder function clearFakes() {
		structDelete( variables, "sequences" );
		structDelete( variables, "sequenceIndexes" );
		structDelete( variables, "originalSequences" );
		structDelete( variables, "requests" );
		structDelete( variables, "prevent" );
		structDelete( variables, "fakeConfiguration" );
		return this;
	}

	/**
	 * Resets the requests made and fake responses received for the HyperBuilder.
	 * The configuration remains intact and sequences are reset.
	 * Usually called in an `afterEach` block.
	 *
	 * @returns The HyperBuilder instance.
	 */
	public HyperBuilder function resetFakes() {
		structDelete( variables, "requests" );
		structDelete( variables, "sequenceIndexes" );
		return this;
	}

	/**
	 * Forward on other calls to a new request instance.
	 */
	function onMissingMethod( missingMethodName, missingMethodArguments ) {
		return invoke(
			variables.new(),
			missingMethodName,
			missingMethodArguments
		);
	}

}
