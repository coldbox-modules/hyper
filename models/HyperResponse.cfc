component accessors="true" {

    property name="statusCode" default="200" setter="false";
    property name="data" default="" setter="false";
    property name="request" setter="false";
    property name="charset" setter="false";
    property name="timestamp" setter="false";

    function init( req, cfhttpResponse, timestamp = now() ) {
        variables.request = req;
        populateFromCFHTTP( cfhttpResponse );
        variables.timestamp = arguments.timestamp;
        return this;
    }

    function json() {
        if ( ! isJSON( getData() ) ) {
            throw( type = "DeserializeJsonException" );
        }
        return deserializeJSON( getData() );
    }

    private function populateFromCFHTTP( res ) {
        variables.charset = res.charset;
        variables.statusCode = res.responseheader.status_code;
        res.responseheader.each( function( name, value ) {
            variables.headers[ lcase( name ) ] = value;
        } );
        variables.data = res.filecontent;

        return this;
    }

    function getHeader( name ) {
        return variables.headers[ lcase( name ) ];
    }

    function isRedirect() {
        return left( getStatusCode(), 1 ) == "3";
    }

}
