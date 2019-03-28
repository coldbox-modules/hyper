/**
* A fluent interface around HTTP requests.
*/
component accessors="true" {

    /**
     * The httpClient to use for the request
     */
    property name="httpClient";

    /**
    * The baseURL for the request.
    * e.g. https://api.github.com/
    */
    property name="baseUrl" default="";

    /**
    * The URL for the request.
    * It can either be a full url
    * or a URI resource for use with the baseURL.
    * e.g. /repos
    */
    property name="url" default="";

    /**
    * The HTTP method for the request.
    */
    property name="method" default="GET";

    /**
    * The username for the request for basic auth.
    */
    property name="username" default="";

    /**
    * The password for the request for basic auth.
    */
    property name="password" default="";

    /**
    * Timeout, in seconds, for the request.
    */
    property name="timeout" default="10";

    /**
    * The maximum number of redirects to follow.
    * A value of `*` will follow redirects infinitely.
    */
    property name="maximumRedirects" default="*";

    /**
    * The body to send with the request.
    * How the body is serialized is
    * determined by the bodyFormat.
    */
    property name="body" default="";

    /**
    * The format to serialize the body.
    * e.g. `json` or `formFields`
    */
    property name="bodyFormat" default="json";

    /**
    * The referring response in the case of redirects.
    */
    property name="referrer";

    /**
    * A struct of headers for the request.
    */
    property name="headers";

    /**
    * A struct of query parameters for the request.
    */
    property name="queryParams";

    /**
    * Flag to throw on a cfhttp error.
    */
    property name="throwOnError" default="false";

    /**
    * Initialize a new HyperRequest.
    *
    * @returns The HyperRequest instance.
    */
    function init( httpClient = new CfhttpHttpClient() ) {
        variables.httpClient = arguments.httpClient;
        variables.queryParams = createObject( "java", "java.util.LinkedHashMap" ).init();
        variables.headers = createObject( "java", "java.util.LinkedHashMap" ).init();
        variables.headers.put( "Content-Type", "application/json" );
        return this;
    }

    /**
    * Execute a GET request.
    *
    * @url         An optional url to set for the request.
    * @queryParams An optional struct of query parameters to set for the request.
    *
    * @returns     A HyperResponse instance for the request.
    */
    function get( url, queryParams ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }
        if ( ! isNull( arguments.queryParams ) ) {
            setQueryParams( arguments.queryParams );
        }
        setMethod( "GET" );
        return send();
    }

    /**
    * Execute a POST request.
    *
    * @url     An optional url to set for the request.
    * @body    An optional body to set for the request.
    *
    * @returns A HyperResponse instance for the request.
    */
    function post( url, body ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }

        if ( ! isNull( arguments.body ) ) {
            setBody( arguments.body );
        }

        setMethod( "POST" );
        return send();
    }

    /**
    * Execute a PUT request.
    *
    * @url     An optional url to set for the request.
    * @body    An optional body to set for the request.
    *
    * @returns A HyperResponse instance for the request.
    */
    function put( url, body ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }

        if ( ! isNull( arguments.body ) ) {
            setBody( arguments.body );
        }

        setMethod( "PUT" );
        return send();
    }

    /**
    * Execute a PATCH request.
    *
    * @url     An optional url to set for the request.
    * @body    An optional body to set for the request.
    *
    * @returns A HyperResponse instance for the request.
    */
    function patch( url, body ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }

        if ( ! isNull( arguments.body ) ) {
            setBody( arguments.body );
        }

        setMethod( "PATCH" );
        return send();
    }

    /**
    * Execute a DELETE request.
    *
    * @url     An optional url to set for the request.
    * @body    An optional body to set for the request.
    *
    * @returns A HyperResponse instance for the request.
    */
    function delete( url, body ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }

        if ( ! isNull( arguments.body ) ) {
            setBody( arguments.body );
        }

        setMethod( "DELETE" );
        return send();
    }

    /**
    * Add additional query parameters to the request.
    *
    * @queryParams A struct of query parameters to add to the request.
    *
    * @returns     The HyperRequest instance.
    */
    function withQueryParams( queryParams = {} ) {
        for ( var name in arguments.queryParams ) {
            setQueryParam( name, arguments.queryParams[ name ] );
        }
        return this;
    }

    /**
    * Set a query parameter for the request.
    *
    * @name    The name of the query parameter.
    * @value   The value of the query parameter.
    *
    * @returns The HyperRequest instance.
    */
    function setQueryParam( name, value ) {
        variables.queryParams.put( name, value );
        return this;
    }

    /**
    * Check if the request has a query parameter with the given name.
    *
    * @name    The name of the query parameter to check.
    *
    * @returns True if the query parameter exists.
    */
    function hasQueryParam( name ) {
        return variables.queryParams.containsKey( name );
    }

    /**
    * Get the value for a certian query parameter.
    *
    * @name    The name of the query parameter to retrieve its value.
    *
    * @returns The value of the query parameter.
    *          Returns an empty string if the query parameter does not exist.
    */
    function getQueryParam( name ) {
        return hasQueryParam( name ) ?
            variables.queryParams.get( name ) :
            "";
    }

    /**
    * Add additional headers to the request.
    *
    * @headers A struct of headers to add to the request.
    *
    * @returns The HyperRequest instance.
    */
    function withHeaders( headers = {} ) {
        for ( var name in arguments.headers ) {
            setHeader( name, arguments.headers[ name ] );
        }
        return this;
    }

    /**
    * Set a header for the request.
    *
    * @name    The name of the header.
    * @value   The value of the header.
    *
    * @returns The HyperRequest instance.
    */
    function setHeader( name, value ) {
        variables.headers.put( name, value );
        return this;
    }

    /**
    * Check if the request has a header with the given name.
    *
    * @name    The name of the header to check.
    *
    * @returns True if the header exists.
    */
    function hasHeader( name ) {
        return variables.headers.containsKey( name );
    }

    /**
    * Get the value for a certian header.
    *
    * @name    The name of the header to retrieve its value.
    *
    * @returns The value of the header.
    *          Returns an empty string if the header does not exist.
    */
    function getHeader( name ) {
        return hasHeader( name ) ?
            variables.headers.get( name ) :
            "";
    }

    /**
    * Sets the username and password for HTTP Basic Auth.
    *
    * @username The username for the basic auth.
    * @password The password for the basic auth.
    *
    * @returns  The HyperRequest instance.
    */
    function withBasicAuth( username, password ) {
        setUsername( username );
        setPassword( password );
        return this;
    }

    /**
    * Quickly set many request properties using a struct.
    * The key should be the name of one of the properties on the request.
    * e.g. `url`, `headers`, `method`, `body`
    *
    * @properties A struct of properties to set.  Each property
    *             name will be set on the request. Properties that don't
    *             exist on the request will throw an error.
    *
    * @returns    The HyperRequest instance.
    */
    function setProperties( properties = {} ) {
        properties.each( function( key, value ) {
            invoke( this, "set#key#", { 1 = value } );
        } );
        return this;
    }

    /**
    * A convenience method to not follow any redirects.
    *
    * @returns The HyperRequest instance.
    */
    function withoutRedirecting() {
        setMaximumRedirects( 0 );
        return this;
    }

    /**
    * A convenience method to not throw on errors.
    *
    * @returns The HyperRequest instance.
    */
    function allowErrors() {
        setThrowOnError( false );
        return this;
    }

    /**
    * A convenience method to throw on errors.
    *
    * @returns The HyperRequest instance.
    */
    function throwErrors() {
        setThrowOnError( true );
        return this;
    }

    /**
    * A convenience method to set the body format and Content-Type to json.
    *
    * @returns The HyperRequest instance.
    */
    function asJson() {
        setBodyFormat( "json" );
        setContentType( "application/json" );
        return this;
    }

    /**
    * A convenience method to set the body format and Content-Type to form fields.
    *
    * @returns The HyperRequest instance.
    */
    function asFormFields() {
        setBodyFormat( "formFields" );
        setContentType( "application/x-www-form-urlencoded" );
        return this;
    }

    /**
    * A convenience method to set the Content-Type header.
    *
    * @type    The Content-Type value for the request.
    *
    * @returns The HyperRequest instance.
    */
    function setContentType( type ) {
        setHeader( "Content-Type", type );
        return this;
    }

    /**
    * A convenience method to set the Accept header.
    *
    * @type    The Accept value for the request.
    *
    * @returns The HyperRequest instance.
    */
    function setAccept( type ) {
        setHeader( "Accept", type );
        return this;
    }

    /**
     * Sets the URL for the request.
     * Also parses out the query string (if any).
     *
     * @url The url for the request.
     *
     * @returns The HyperRequest instance.
     */
    function setUrl( url ) {
        variables.url = parseOutQueryString( arguments.url );
        return this;
    }

    /**
    * Returns the full url for the request.
    * Combines the baseURL, the URL, and the serialized queryParams.
    *
    * @returns The full url for the request.
    */
    function getFullUrl( withQueryString = false) {
        return getBaseUrl() & getUrl() &
            ( arguments.withQueryString ? serializeQueryParams() : "" );
    }

    /**
    * Send the HTTP request and return a HyperResponse.
    *
    * @returns The HyperResponse for the sent request.
    */
    function send() {
        if ( getFullUrl() == "" ) {
            throw( type = "NoUrlException" );
        }

        var res = httpClient.send( this );

        if ( res.isRedirect() && shouldFollowRedirect() ) {
            return followRedirect( res );
        }

        return res;
    }

    /**
     * Clears the request of any set values, including
     * defaults passed by the builder.
     *
     * @returns The HyperRequest instance.
     */
    function clear() {
        setBaseUrl( "" );
        setUrl( "" );
        setMethod( "GET" );
        setUsername( "" );
        setPassword( "" );
        setTimeout( 10 );
        setMaximumRedirects( "*" );
        setBody( "" );
        setBodyFormat( "json" );
        setReferrer( javacast( "null", "" ) );
        variables.queryParams = createObject( "java", "java.util.LinkedHashMap" ).init();
        variables.headers = createObject( "java", "java.util.LinkedHashMap" ).init();
        variables.headers.put( "Content-Type", "application/json" );
        return this;
    }

    /**
     * Helper to conditionally execute a callback for the HyperRequest.
     * This method lets you use conditionals without breaking chaining.
     *
     * @condition       The condition to check
     * @successCallback The callback to execute if the condition is true.
     *                  The callback is passed the HyperRequest instance.
     * @failureCallback The callback to execute if the condition is false.
     *                  The callback is passed the HyperRequest instance.
     *
     * @returns         The HyperRequest instance.
     */
    function when( condition, successCallback, failureCallback ) {
        if ( condition ) {
            successCallback( this );
            return this;
        }

        if ( ! isNull( failureCallback ) ) {
            failureCallback( this );
        }
        return this;
    }

    /**
     * Adds any query params to the HyperRequest and
     * returns the url without the query string.
     *
     * @url The url with or without a query string.
     *
     * @returns The url without a query string.
     */
    private function parseOutQueryString( url ) {
        var queryString = listRest( arguments.url, "?" );
        var queryParams = listToArray( queryString, "&" );
        for ( var paramString in queryParams ) {
            var name = decodeFromUrl( listFirst( paramString, "=" ) );
            var value = decodeFromUrl( listRest( paramString, "=" ) );
            setQueryParam( name, value );
        }
        return listFirst( arguments.url, "?" );
    }

    /**
    * Serialize the query parameters.
    *
    * @returns A serialized string of the query parameters.
    */
    private function serializeQueryParams() {
        if ( variables.queryParams.isEmpty() ) {
            return "";
        }
        var queryParamNames = [];
        for ( var name in variables.queryParams ) {
            queryParamNames.append( name );
        }
        queryParamNames.sort( "textnocase" );
        return "?" & queryParamNames.map( function( name ) {
            return len( variables.queryParams[ name ] ) ?
                "#encodeForURL( name )#=#encodeForURL( variables.queryParams[ name ] )#" :
                "#encodeForURL( name )#";
        } ).toList( "&" );
    }

    /**
    * Returns true if the redirect should be followed.
    *
    * @returns True if the redirect should be followed.
    */
    private function shouldFollowRedirect() {
        return getMaximumRedirects() == "*" ||
            getMaximumRedirects() > 0;
    }

    /**
    * Send a new request based on the redirect response recieved.
    *
    * @res The HyperResponse specifying a redirect.
    *
    * @returns The HyperResponse corresponding to the redirect request.
    */
    private function followRedirect( res ) {
        var redirectReq = new Hyper.models.HyperRequest();
        redirectReq.setReferrer( res );
        redirectReq.setUrl( res.getHeader( "Location" ) );
        redirectReq.setMaximumRedirects( decrementRedirects() );
        return redirectReq.send();
    }

    /**
    * Decrement the redirects count.
    * Ignores the special `*` maximumRedirects value.
    *
    * @returns The next maximumRedirects value.
    */
    private function decrementRedirects() {
        if ( getMaximumRedirects() == "*" ) {
            return getMaximumRedirects();
        }
        return getMaximumRedirects() - 1;
    }

    /**
    * Checks if the request has a body.
    *
    * @returns True if the request has a body.
    */
    public boolean function hasBody() {
        return ! isSimpleValue( getBody() ) || getBody() != "";
    }

    /**
    * Ensures the body value is a simple value by serializing complex values.
    *
    * @returns A simple value representing the body.
    */
    public string function prepareBody() {
        if ( isSimpleValue( getBody() ) ) {
            return getBody();
        }
        return serializeJSON( getBody() );
    }

}
