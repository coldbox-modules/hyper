component {

    this.defaults = new Hyper.models.HyperRequest();

    function new() {
        return duplicate( this.defaults );
    }

    function onMissingMethod( missingMethodName, missingMethodArguments ) {
        return invoke( variables.new(), missingMethodName, missingMethodArguments );
    }

}
