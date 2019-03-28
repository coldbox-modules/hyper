/**
* Creates new requests with optional defaults.
*/
component singleton {

    /**
    * The default request object.
    * This object is duplicated for each new request.
    */
    this.defaults = new Hyper.models.HyperRequest();

    /**
    * Create a new HyperBuilder.
    * Any arguments passed are set on the default request.
    *
    * @returns The new HyperBuilder instance.
    */
    function init() {
        for ( var key in arguments ) {
            invoke( this.defaults, "set#key#", { 1 = arguments[ key ] } );
        }
        return this;
    }

    /**
    * Create a new request from the default request.
    *
    * @returns A new HyperRequest instance from the default request.
    */
    function new() {
        return duplicate( this.defaults );
    }

    /**
    * Forward on other calls to a new request instance.
    */
    function onMissingMethod( missingMethodName, missingMethodArguments ) {
        return invoke( variables.new(), missingMethodName, missingMethodArguments );
    }

}
