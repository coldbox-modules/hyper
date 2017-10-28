component accessors="true" {

    property name="url" default="";
    property name="method" default="GET";
    property name="maximumRedirects" default="*";
    property name="referrer";

    function get( url ) {
        if ( ! isNull( arguments.url ) ) {
            setUrl( arguments.url );
        }
        setMethod( "GET" );
        return makeRequest();
    }

    function setProperties( properties = {} ) {
        properties.each( function( key, value ) {
            invoke( this, "set#key#", { 1 = value } );
        } );
        return this;
    }

    function setFollowRedirects( shouldFollow ) {
        if ( shouldFollow ) {
            setMaximumRedirects( "*" );
        }
        else {
            setMaximumRedirects( 0 );
        }
        return this;
    }

    function makeRequest() {
        if ( getUrl() == "" ) {
            throw( type = "NoUrlException" );
        }

        var res = new Hyper.models.HyperResponse( this );
        res.populateFromCFHTTP( makeCFHTTPRequest() );

        if ( res.isRedirect() ) {
            if ( shouldFollowRedirect() ) {
                return followRedirect( res );
            }
        }

        return res;
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
            result = "local.res"
            url = getUrl(),
            method = getMethod(),
            redirect = false
        ) {

        }
        return local.res;
    }

}
