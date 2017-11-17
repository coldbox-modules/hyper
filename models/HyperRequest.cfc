/**
* A fluent interface around HTTP requests.
*/
component accessors="true" {

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
    * Initialize a new HyperRequest.
    *
    * @returns The HyperRequest instance.
    */
    function init() {
        variables.queryParams = {};
        variables.headers = {
            "content-type" = "application/json"
        };
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
        variables.queryParams[ lcase( name ) ] = value;
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
        return variables.queryParams.keyExists( lcase( name ) );
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
            variables.queryParams[ lcase( name ) ] :
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
        variables.headers[ lcase( name ) ] = value;
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
        return variables.headers.keyExists( lcase( name ) );
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
            variables.headers[ lcase( name ) ] :
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
    * Returns the full url for the request.
    * Combines the baseURL, the URL, and the serialized queryParams.
    *
    * @returns The full url for the request.
    */
    function getFullUrl() {
        return getBaseUrl() & getUrl() & serializeQueryParams();
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

        var res = new Hyper.models.HyperResponse( this, makeCFHTTPRequest() );

        if ( res.isRedirect() && shouldFollowRedirect() ) {
            return followRedirect( res );
        }

        return res;
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
        return "?" & variables.queryParams.reduce( function( pairs, name, value ) {
            pairs.append( "#encodeForURL( name )#=#encodeForURL( value )#" );
            return pairs;
        }, [] ).toList( "&" );
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
    * Wrapper around CFHTTP for actually sending the requests.
    *
    * @returns The CFHTTP response struct.
    */
    private function makeCFHTTPRequest() {
        local.res = "";
        cfhttp(
            result = "local.res",
            timeout = getTimeout(),
            url = getFullUrl(),
            method = getMethod(),
            redirect = false,
            username = getUsername(),
            password = getPassword()
        ) {
            for ( var name in variables.headers ) {
                cfhttpparam(
                    type = "header",
                    name = name,
                    value = variables.headers[ name ]
                );
            }

            if ( hasBody() ) {
                if ( getBodyFormat() == "json" ) {
                    cfhttpparam( type = "body", value = prepareBody() );
                }
                else if ( getBodyFormat() == "formFields" ) {
                    var body = getBody();
                    for ( var fieldName in body ) {
                        cfhttpparam(
                            type  = "formfield",
                            name  = fieldName,
                            value = body[ fieldName ]
                        );
                    }
                }
                else {
                    cfhttpparam( type = "body", value = prepareBody() );
                }
            }
        }
        return local.res;
    }

    /**
    * Checks if the request has a body.
    *
    * @returns True if the request has a body.
    */
    private function hasBody() {
        return ! isSimpleValue( getBody() ) || getBody() != "";
    }

    /**
    * Ensures the body value is a simple value by serializing complex values.
    *
    * @returns A simple value representing the body.
    */
    private function prepareBody() {
        if ( isSimpleValue( getBody() ) ) {
            return getBody();
        }
        return serializeJSON( getBody() );
    }

}
