component accessors="true" {

    property name="url" default="";
    property name="method" default="GET";
    property name="maximumRedirects" default="*";
    property name="baseUrl" default="";
    property name="body" default="";
    property name="bodyFormat" default="json";
    property name="referrer";
    property name="headers";
    property name="queryParams";

    function init() {
        variables.queryParams = {};
        variables.headers = {
            "content-type" = "application/json"
        };
        return this;
    }

    function get( url, queryParams ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }
        if ( ! isNull( arguments.queryParams ) ) {
            setQueryParams( arguments.queryParams );
        }
        setMethod( "GET" );
        return makeRequest();
    }

    function post( url, body ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }

        if ( ! isNull( arguments.body ) ) {
            setBody( arguments.body );
        }

        setMethod( "POST" );
        return makeRequest();
    }

    function withQueryParams( queryParams = {} ) {
        structEach( queryParams, setQueryParam );
        return this;
    }

    function setQueryParam( name, value ) {
        variables.queryParams[ lcase( name ) ] = value;
        return this;
    }

    function getQueryParams() {
        return variables.queryParams;
    }

    function hasQueryParam( name ) {
        return variables.queryParams.keyExists( lcase( name ) );
    }

    function getQueryParam( name ) {
        return hasQueryParam( name ) ?
            variables.queryParams[ lcase( name ) ] :
            "";
    }

    function withHeaders( headers = {} ) {
        structEach( headers, setHeader );
        return this;
    }

    function setHeader( name, value ) {
        variables.headers[ lcase( name ) ] = value;
        return this;
    }

    function getHeaders() {
        return variables.headers;
    }

    function getHeader( name ) {
        return hasHeader( name ) ?
            variables.headers[ lcase( name ) ] :
            "";
    }

    function hasHeader( name ) {
        return variables.headers.keyExists( lcase( name ) );
    }

    function setProperties( properties = {} ) {
        properties.each( function( key, value ) {
            invoke( this, "set#key#", { 1 = value } );
        } );
        return this;
    }

    function withoutRedirecting() {
        setMaximumRedirects( 0 );
        return this;
    }

    function asJson() {
        setBodyFormat( "json" );
        setContentType( "application/json" );
        return this;
    }

    function asFormFields() {
        setBodyFormat( "formFields" );
        setContentType( "application/x-www-form-urlencoded" );
        return this;
    }

    function setContentType( type ) {
        setHeader( "Content-Type", type );
        return this;
    }

    function setAccept( type ) {
        setHeader( "Accept", type );
        return this;
    }

    function getFullUrl() {
        return getBaseUrl() & getUrl() & serializeQueryParams();
    }

    function makeRequest() {
        if ( getUrl() == "" ) {
            throw( type = "NoUrlException" );
        }

        var res = new Hyper.models.HyperResponse( this, makeCFHTTPRequest() );

        if ( res.isRedirect() ) {
            if ( shouldFollowRedirect() ) {
                return followRedirect( res );
            }
        }

        return res;
    }

    private function serializeQueryParams() {
        if ( variables.queryParams.isEmpty() ) {
            return "";
        }
        return "?" & variables.queryParams.reduce( function( pairs, name, value ) {
            pairs.append( "#encodeForURL( name )#=#encodeForURL( value )#" );
            return pairs;
        }, [] ).toList( "&" );
    }

    private function shouldFollowRedirect() {
        return getMaximumRedirects() == "*" ||
            getMaximumRedirects() > 0;
    }

    private function followRedirect( res ) {
        var redirectReq = new Hyper.models.HyperRequest();
        redirectReq.setReferrer( res );
        redirectReq.setUrl( res.getHeader( "Location" ) );
        redirectReq.setMaximumRedirects( decrementRedirects() );
        return redirectReq.makeRequest();
    }

    private function decrementRedirects() {
        if ( getMaximumRedirects() == "*" ) {
            return getMaximumRedirects();
        }
        return getMaximumRedirects() - 1;
    }

    private function makeCFHTTPRequest() {
        local.res = "";
        cfhttp(
            result = "local.res",
            url = getFullUrl(),
            method = getMethod(),
            redirect = false
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
                if ( getBodyFormat() == "formFields" ) {
                    var body = getBody();
                    for ( var fieldName in body ) {
                        cfhttpparam(
                            type  = "formfield",
                            name  = fieldName,
                            value = body[ fieldName ]
                        );
                    }
                }
            }
        }
        return local.res;
    }

    private function hasBody() {
        return ! isSimpleValue( getBody() ) || getBody() != "";
    }

    private function prepareBody() {
        if ( isSimpleValue( getBody() ) ) {
            return getBody();
        }
        return serializeJSON( getBody() );
    }

}
