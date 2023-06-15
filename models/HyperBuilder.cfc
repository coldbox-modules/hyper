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
				{ 1 : arguments[ key ] }
			);
		}
		return this;
	}

	function onDIComplete() {
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
	function new() {
		var req = this.defaults.clone();
		req.setBuilder( this );
		return req;
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
