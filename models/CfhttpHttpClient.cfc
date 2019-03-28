/**
 * Uses CFHTTP to execute HyperRequests.
 */
component implements="HyperHttpClientInterface" {

    /**
     * Execute the HyperRequest and map it to a HyperResponse.
     *
     * @req     The HyperRequest to execute.
     *
     * @returns A HyperResponse of the executed request.
     */
    public HyperResponse function send( required HyperRequest req ) {
        var cfhttpResponse = makeCFHTTPRequest( req );
        return new Hyper.models.HyperResponse(
            originalRequest = req,
            charset = cfhttpResponse.charset ?: "UTF-8",
            statusCode = cfhttpResponse.responseheader.status_code ?: 504,
            headers = normalizeHeaders( cfhttpResponse ),
            data = cfhttpResponse.filecontent
        );
    }

    /**
     * Makes an HTTP request using CFHTTP.
     *
     * @req     The request to execute
     *
     * @returns The CFHTTP response struct.
     */
    private struct function makeCFHTTPRequest( required HyperRequest req ) {
        local.res = "";
        var attrCollection = {
            result = "local.res",
            timeout = req.getTimeout(),
            url = req.getFullUrl(),
            method = req.getMethod(),
            redirect = false,
            throwonerror = req.getThrowOnError()
        };

        if ( len( req.getUsername() ) ) {
            attrCollection[ "username" ] = req.getUsername();
        }
        if ( len( req.getPassword() ) ) {
            attrCollection[ "password" ] = req.getPassword();
        }

        cfhttp( attributeCollection = attrCollection ) {
            var headers = req.getHeaders();
            for ( var name in headers ) {
                cfhttpparam(
                    type = "header",
                    name = name,
                    value = headers[ name ]
                );
            }

            var queryParams = req.getQueryParams();
            for ( var name in queryParams ) {
                cfhttpparam(
                    type = "url",
                    name = name,
                    value = queryParams[ name ]
                );
            }

            if ( req.hasBody() ) {
                if ( req.getBodyFormat() == "json" ) {
                    cfhttpparam( type = "body", value = req.prepareBody() );
                }
                else if ( req.getBodyFormat() == "formFields" ) {
                    var body = req.getBody();
                    for ( var fieldName in body ) {
                        cfhttpparam(
                            type  = "formfield",
                            name  = fieldName,
                            value = body[ fieldName ]
                        );
                    }
                }
                else {
                    cfhttpparam( type = "body", value = req.prepareBody() );
                }
            }
        }
        return local.res;
    }

    /**
     * Normalizes the headers from a CFHTTP response into a normalized struct.
     *
     * @cfhttpResponse The cfhttp response struct.
     *
     * @returns        A struct of normalized headers.
     */
    private struct function normalizeHeaders( required struct cfhttpResponse ) {
        var headers = {};
        cfhttpResponse.responseheader.each( function( name, value ) {
            headers[ lcase( name ) ] = value;
        } );
        return headers;
    }

}
