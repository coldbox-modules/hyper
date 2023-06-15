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
			statusCode      = normalizeStatusCode( cfhttpResponse ),
			statusText      = normalizeStatusText( cfhttpResponse ),
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
	 * Return a struct of information showing how the client will execute the HyperRequest.
	 * This will be used by a developer to debug any differences between the generated
	 * request values and the expected request values.
	 *
	 * @req     The HyperRequest to debug.
	 *
	 * @returns A struct of information detailing how the client would execute the HyperRequest.
	 */
	public struct function debug( required HyperRequest req ) {
		var attrCollection = {
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
		if ( len( req.getAuthType() ) && len( req.getUsername() ) ) {
			attrCollection[ "authType" ] = req.getAuthType();
		}

		if ( !isNull( req.getClientCert() ) ) {
			attrCollection[ "clientCert" ] = req.getClientCert();
		}

		if ( !isNull( req.getClientCertPassword() ) ) {
			attrCollection[ "clientCertPassword" ] = req.getClientCertPassword();
		}

		var cfhttpHeaders = [];
		var headers       = req.getHeaders();
		for ( var name in headers ) {
			// we want to skip adding a Content-Type header when there are files
			// so that the CFML engines can add the correct boundary to the Content-Type
			if ( name == "Content-Type" && !req.getFiles().isEmpty() ) {
				continue;
			}

			cfhttpHeaders.append( {
				"name"  : name,
				"value" : headers[ name ]
			} );
		}

		var cfhttpParams = [];
		var queryParams  = req.getQueryParams();
		for ( var param in queryParams ) {
			cfhttpParams.append( {
				"name"  : param.name,
				"value" : param.value
			} );
		}

		var cfhttpFiles = [];
		for ( var file in req.getFiles() ) {
			var fileAttrCollection = { name : file.name, file : file.path };
			if ( file.keyExists( "mimeType" ) && !isNull( file.mimeType ) ) {
				fileAttrCollection[ "mimeType" ] = file.mimeType;
			}
			cfhttpFiles.append( fileAttrCollection );
		}

		var cfhttpBody = [];
		if ( req.hasBody() ) {
			switch ( req.getBodyFormat() ) {
				case "json":
					// this is here for backwards compatibility
					if ( !headers.keyExists( "Content-Type" ) ) {
						cfhttpHeaders.append( {
							"name"  : "Content-Type",
							"value" : "application/json"
						} );
					}

					cfhttpBody.append( {
						"type"  : "body",
						"value" : req.prepareBody()
					} );
					break;
				case "formFields":
					var body = req.getBody();
					for ( var fieldName in body ) {
						for ( var value in arrayWrap( body[ fieldName ] ) ) {
							cfhttpBody.append( {
								"type"  : "formfield",
								"name"  : fieldName,
								"value" : value
							} );
						}
					}
					break;
				case "xml":
					cfhttpBody.append( {
						"type"  : "xml",
						"value" : req.prepareBody()
					} );
					break;
				default:
					cfhttpBody.append( {
						"type"  : "body",
						"value" : req.prepareBody()
					} );
			}
		}

		return {
			"attributes" : attrCollection,
			"body"       : {
				"headers" : cfhttpHeaders,
				"params"  : cfhttpParams,
				"files"   : cfhttpFiles,
				"body"    : cfhttpBody
			}
		};
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
		if ( len( req.getAuthType() ) && len( req.getUsername() ) ) {
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
				switch ( req.getBodyFormat() ) {
					case "json":
						// this is here for backwards compatibility
						if ( !headers.keyExists( "Content-Type" ) ) {
							cfhttpparam(
								type  = "header",
								name  = "Content-Type",
								value = "application/json"
							);
						}

						cfhttpparam( type = "body", value = req.prepareBody() );
						break;
					case "formFields":
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
						break;
					case "xml":
						cfhttpparam( type = "xml", value = req.prepareBody() );
						break;
					default:
						cfhttpparam( type = "body", value = req.prepareBody() );
				}
			}
		}
		return local.res;
	}

	private numeric function normalizeStatusCode( required struct cfhttpResponse ) {
		if ( cfhttpResponse.keyExists( "responseheader" ) && cfhttpResponse.responseheader.keyExists( "status_code" ) ) {
			return cfhttpResponse.responseheader.status_code;
		}

		if ( cfhttpResponse.keyExists( "status_code" ) ) {
			return cfhttpResponse.status_code != 0 ? cfhttpResponse.status_code : 502;
		}

		if ( cfhttpResponse.keyExists( "statuscode" ) ) {
			var code = listFirst( cfhttpResponse.statuscode, " " );
			return isNumeric( code ) ? code : 502;
		}

		return 504;
	}

	private string function normalizeStatusText( required struct cfhttpResponse ) {
		if ( cfhttpResponse.keyExists( "responseheader" ) && cfhttpResponse.responseheader.keyExists( "explanation" ) ) {
			return cfhttpResponse.responseheader.explanation;
		}

		if ( cfhttpResponse.keyExists( "status_text" ) ) {
			return cfhttpResponse.status_text;
		}

		if ( cfhttpResponse.keyExists( "statuscode" ) ) {
			var code = listFirst( cfhttpResponse.statuscode, " " );
			if ( !isNumeric( code ) ) {
				return "Bad Gateway";
			}
			var text = listRest( cfhttpResponse.statuscode, " " );
			return text == "Request Time-out" ? "Request Timeout" : text;
		}

		return "Gateway Timeout";
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
