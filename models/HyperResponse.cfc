component accessors="true" setters="false" {

    property name="statusCode" default="200";
    property name="data" default="";
    property name="request";

    function init( req ) {
        variables.request = req;
        return this;
    }

    function json() {
        if ( ! isJSON( getData() ) ) {
            throw( type = "DeserializeJsonException" );
        }
        return deserializeJSON( getData() );
    }

    function populateFromCFHTTP( res ) {
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
