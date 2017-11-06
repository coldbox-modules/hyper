component {

    this.defaults = new Hyper.models.HyperRequest();

    function init() {
        for ( var key in arguments ) {
            invoke( this.defaults, "set#key#", { 1 = arguments[ key ] } );
        }
        return this;
    }

    function new() {
        return duplicate( this.defaults );
    }

    function onMissingMethod( missingMethodName, missingMethodArguments ) {
        return invoke( variables.new(), missingMethodName, missingMethodArguments );
    }

}
