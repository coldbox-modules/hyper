/**
 * A convienent wrapper for HTTP responses.
 */
component accessors="true" {

    /**
     * The status code for the response.
     */
    property name="statusCode" default="200" setter="false";

    /**
     * The data for the response.
     */
    property name="data" default="" setter="false";

    /**
     * The HyperRequest instance associated with this response.
     */
    property name="request" setter="false";

    /**
     * The charset value for the response.
     */
    property name="charset" default="UTF-8" setter="false";

    /**
     * The charset value for the response.
     */
    property name="headers" type="struct" setter="false";

    /**
     * The timestamp for when this response was received.
     */
    property name="timestamp" setter="false";

    /**
     * The timestamp for when this response was received.
     */
    property name="logger" inject="logbox:logger:{this}";

    /**
     * Create a new HyperResponse.
     *
     * @originalRequest The HyperRequest associated with this response.
     * @charset         The response charset. Default: UTF-8
     * @statusCode      The response status code. Default: 200.
     * @headers         The response headers. Default: {}.
     * @data            The response data. Default: "".
     * @timestamp       The timestamp for when this response was received. Default: `now()`.
     *
     * @returns         A new HyperResponse instance.
     */
    public HyperResponse function init(
        required HyperRequest originalRequest,
        string charset = "UTF-8",
        any statusCode = 200,
        struct headers = {},
        any data = "",
        timestamp = now()
    ) {
        variables.request = arguments.originalRequest;
        variables.charset = arguments.charset;
        variables.statusCode = arguments.statusCode;
        variables.headers = arguments.headers;
        variables.data = arguments.data;
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
     * Gets the value of a header from the response.
     */
    function getHeader( name ) {
        return variables.headers[ lcase( name ) ];
    }

}
