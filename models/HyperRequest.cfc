component accessors="true" {

    property name="url";
    property name="method";

    function get() {
        setMethod( "GET" );
        return makeRequest();
    }

    function makeRequest() {
        var res = new Hyper.models.HyperResponse();
        return res.populateFromCFHTTP(
            makeCFHTTPRequest()
        );
    }

    private function makeCFHTTPRequest() {
        local.res = "";
        cfhttp(
            result = "local.res"
            url = getUrl(),
            method = getMethod()
        ) {

        }
        return local.res;
    }

}
