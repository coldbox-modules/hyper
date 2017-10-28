component {

    function get( url ) {
        var req = new Hyper.models.HyperRequest();
        req.setUrl( arguments.url );
        return req.get();
    }

}
