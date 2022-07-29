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
		var startTick      = getTickCount();
		var cfhttpResponse = makeCFHTTPRequest( req );
		var res            = new Hyper.models.HyperResponse(
			originalRequest = req,
			executionTime   = getTickCount() - startTick,
			charset         = cfhttpResponse.charset ?: "UTF-8",
			statusCode      = cfhttpResponse.responseheader.status_code ?: 504,
			statusText      = cfhttpResponse.responseheader.explanation ?: "Gateway Timeout",
			headers         = normalizeHeaders( cfhttpResponse ),
			data            = cfhttpResponse.filecontent
		);

		if ( req.getThrowOnError() && res.isError() ) {
			throw(
				type         = "HyperRequestError",
				message      = "Received a [#res.getStatus()#] response when requesting [#req.getFullUrl()#]",
				detail       = res.getData(),
				extendedinfo = serializeJSON( {
					"request"  : req.getMemento(),
					"response" : res.getMemento()
				} )
			);
		}

		return res;
	}

	/**
	 * Makes an HTTP request using CFHTTP.
	 *
	 * @req     The request to execute
	 *
	 * @returns The CFHTTP response struct.
	 */
	private struct function makeCFHTTPRequest( required HyperRequest req ) {
		local.res          = "";
		var attrCollection = {
			"result"     : "local.res",
			"timeout"    : req.getTimeout(),
			"url"        : req.getFullUrl(),
			"method"     : req.getMethod(),
			"redirect"   : false,
			"resolveURL" : req.getResolveUrls()
		};

		if ( !req.getEncodeUrl() ) {
			attrCollection[ "encodeurl" ] = false;
		}

		if ( len( req.getUsername() ) ) {
			attrCollection[ "username" ] = req.getUsername();
		}

		if ( len( req.getPassword() ) ) {
			attrCollection[ "password" ] = req.getPassword();
		}

		if ( len( req.getDomain() ) ) {
			attrCollection[ "domain" ] = req.getDomain();
		}

		if ( len( req.getWorkStation() ) ) {
			attrCollection[ "workstation" ] = req.getWorkStation();
		}

		// this is only necessarry for NTLM authType, BASIC is the default
		if ( len( req.getAuthType() ) ) {
			attrCollection[ "authType" ] = req.getAuthType();
		}

		if ( !isNull( req.getClientCert() ) ) {
			attrCollection[ "clientCert" ] = req.getClientCert();
		}

		if ( !isNull( req.getClientCertPassword() ) ) {
			attrCollection[ "clientCertPassword" ] = req.getClientCertPassword();
		}

		cfhttp( attributeCollection = attrCollection ) {
			var headers = req.getHeaders();
			for ( var name in headers ) {
				// we want to skip adding a Content-Type header when there are files
				// so that the CFML engines can add the correct boundary to the Content-Type
				if ( name == "Content-Type" && !req.getFiles().isEmpty() ) {
					continue;
				}

				cfhttpparam(
					type  = "header",
					name  = name,
					value = headers[ name ]
				);
			}

			var queryParams = req.getQueryParams();
			for ( var param in queryParams ) {
				cfhttpparam(
					type  = "url",
					name  = param.name,
					value = param.value
				);
			}

			for ( var file in req.getFiles() ) {
				var fileAttrCollection = {
					type : "file",
					name : file.name,
					file : file.path
				};
				if ( file.keyExists( "mimeType" ) && !isNull( file.mimeType ) ) {
					fileAttrCollection[ "mimeType" ] = file.mimeType;
				}
				cfhttpparam( attributeCollection = fileAttrCollection );
			}

			if ( req.hasBody() ) {
				if ( req.getBodyFormat() == "json" ) {
					cfhttpparam( type = "body", value = req.prepareBody() );
				} else if ( req.getBodyFormat() == "formFields" ) {
					var body = req.getBody();
					for ( var fieldName in body ) {
						for ( var value in arrayWrap( body[ fieldName ] ) ) {
							cfhttpparam(
								type  = "formfield",
								name  = fieldName,
								value = value
							);
						}
					}
				} else {
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
			headers[ lCase( name ) ] = value;
		} );
		return headers;
	}

	/**
	 * Ensures the return value is an array, either by returning an array
	 * or by returning the value wrapped in an array.
	 *
	 * @value        The value to ensure is an array.
	 *
	 * @doc_generic  any
	 * @return       [any]
	 */
	private array function arrayWrap( required any value ) {
		return isArray( arguments.value ) ? arguments.value : [ arguments.value ];
	}

}
