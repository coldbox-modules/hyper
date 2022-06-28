/**
 * Creates new requests with optional defaults.
 */
component singleton {

	property name="interceptorService" inject="box:interceptorService";
	property name="asyncManager"       inject="box:asyncManager";

	/**
	 * Create a new HyperBuilder.
	 * Any arguments passed are set on the default request.
	 *
	 * @returns The new HyperBuilder instance.
	 */
	function init() {
		this.defaults = new Hyper.models.HyperRequest();
		for ( var key in arguments ) {
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

		if ( structKeyExists( variables, "asyncManager" ) ) {
			this.defaults.setAsyncManager( variables.asyncManager );
		}
	}

	/**
	 * Create a new request from the default request.
	 *
	 * @returns A new HyperRequest instance from the default request.
	 */
	function new() {
		return this.defaults.clone();
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
