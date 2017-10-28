component accessors="true" {

    property name="statusCode";
    property name="data";

    function json() {
        return deserializeJSON( getData() );
    }

    function populateFromCFHTTP( res ) {
        setStatusCode( res.responseheader.status_code );
        setData( res.filecontent );

        return this;
    }

}
