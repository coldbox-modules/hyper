component {

    function onMissingMethod( missingMethodName, missingMethodArguments ) {
        var req = new Hyper.models.HyperRequest();
        return invoke( req, missingMethodName, missingMethodArguments );
    }

}
