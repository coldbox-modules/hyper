/**
 * A convienent wrapper for HTTP responses.
 */
component accessors="true" {

    /**
     * The status code for the response.
     */
    property name="statusCode" default="200" setter="false";

    /**
     * The data returned by the request.
     */
    property name="data" default="" setter="false";

    /**
     * The HyperRequest instance associated with this response.
     */
    property name="request" setter="false";

    /**
     * The charset value for the response.
     */
    property name="charset" setter="false";

    /**
     * The timestamp for when this response was received.
     */
    property name="timestamp" setter="false";

    /**
     * Create a new HyperResponse.
     *
     * @req            The HyperRequest associated with this response.
     * @cfhttpResponse The CFHTTP response struct.
     * @timestamp      The timestamp for when this response was received.
     *                 Default: `now()`.
     *
     * @returns        A new HyperResponse instance.
     */
    function init( req, cfhttpResponse, timestamp = now() ) {
        variables.request = req;
        populateFromCFHTTP( cfhttpResponse );
        variables.timestamp = arguments.timestamp;
        return this;
    }

    /**
     * Returns the data of the request as deserialized JSON.
     *
     * @returns A deserialized version of the data.
     */
    function json() {
        if ( ! isJSON( getData() ) ) {
            throw( type = "DeserializeJsonException", message = "The response is not json." );
        }
        return deserializeJSON( getData() );
    }

    /**
     * Returns true if the request status code is considered successful.
     */
    function isSuccess() {
        return left( getStatusCode(), 1 ) == "2";
    }

    /**
     * Returns true if the request status code is considered a redirect.
     */
    function isRedirect() {
        return left( getStatusCode(), 1 ) == "3";
    }

    /**
     * Returns true if the request status code is considered
     * either a client error or a server error.
     */
    function isError() {
        return left( getStatusCode(), 1 ) == "4" ||
            left( getStatusCode(), 1 ) == "5";
    }

    /**
     * Returns true if the request status code is
     * considered a client error.
     */
    function isClientError() {
        return left( getStatusCode(), 1 ) == "4";
    }

    /**
     * Returns true if the request status code is
     * considered a server error.
     */
    function isServerError() {
        return left( getStatusCode(), 1 ) == "5";
    }

    /**
     * Populates the HyperResponse values from a CFHTTP struct.
     *
     * @res The CFHTTP struct.
     */
    private function populateFromCFHTTP( res ) {
        variables.charset = res.charset;
        variables.statusCode = res.responseheader.status_code;
        res.responseheader.each( function( name, value ) {
            variables.headers[ lcase( name ) ] = value;
        } );
        variables.data = res.filecontent;

        return this;
    }

    /**
     * Gets the value of a header from the response.
     */
    function getHeader( name ) {
        return variables.headers[ lcase( name ) ];
    }

}
