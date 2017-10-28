component {

    function get( url ) {
        var req = new Hyper.models.HyperRequest();
        req.setUrl( arguments.url );
        return req.get();
    }

    function onMissingMethod( missingMethodName, missingMethodArguments ) {
        var req = new Hyper.models.HyperRequest();
        invoke( req, missingMethodName, missingMethodArguments );
        return req;
    }

}
