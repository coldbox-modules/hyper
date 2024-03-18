/**
 * A fluent interface around HTTP requests.
 */
component accessors="true" {

	/**
	 * Unique request ID representing this request.
	 */
	property name="requestID";

	/**
	 * ColdBox Interceptor Service to announce request and response interception points.
	 */
	property name="interceptorService";

	/**
	 * ColdBox Interceptor Service to announce request and response interception points.
	 */
	property name="asyncManager";

	/**
	 * The httpClient to use for the request.
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
	 * Setting this to true will change all relative urls in the document to absolute.
	 */
	property name="resolveUrls" default="false";

	/**
	 * Setting this to false will not automatically encode the url passed.
	 * WARNING: Setting this to false is not supported on Adobe engines.
	 */
	property name="encodeUrl" default="true";

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
	 * An array describing how to retry failed requests.
	 * Defaults to an empty array meaning no retries will be attempted.
	 */
	property name="retries";

	/**
	 * The current request count.
	 * Used for determining if a retry should happen and for how long.
	 */
	property name="currentRequestCount" default="1";

	/**
	 * A predicate function to determine if the retry should be attempted.
	 * The next request can also be modified in this predicate function.
	 * Defaults to retrying if the response has an error status code,
	 * as determined by `HyperResponse#isError`
	 */
	property name="retryPredicate";

	/**
	 * The body to send with the request.
	 * How the body is serialized is
	 * determined by the bodyFormat.
	 */
	property name="body" default="";

	/**
	 * The format to serialize the body.
	 * e.g. `json`, `formFields`, or `xml`
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
	 * A struct of headers for the request.
	 */
	property name="cookies";

	/**
	 * A struct of query parameters for the request.
	 */
	property name="queryParams";

	/**
	 * An array of files to upload for the request.
	 */
	property name="files" type="array";

	/**
	 * Flag to throw on a cfhttp error.
	 */
	property name="throwOnError" default="false";

	/**
	 * The full path to a PKCS12 format file that contains the client certificate for the request.
	 */
	property name="clientCert";

	/**
	 * 	Password used to decrypt the client certificate.
	 */
	property name="clientCertPassword";

	/**
	 * The domain for the request for NTLM auth.
	 */
	property name="domain" default="";

	/**
	 * The workstation for the request for NTLM auth.
	 */
	property name="workstation" default="";

	/**
	 * The authType for the request
	 */
	property name="authType" default="BASIC";

	/**
	 * An array of callback functions to call
	 * before firing off a request.
	 */
	property name="requestCallbacks" type="array";

	/**
	 * An array of callback functions to call
	 * after receiving a response.
	 */
	property name="responseCallbacks" type="array";

	/**
	 * A struct of patterns to fake response generator functions.
	 * If this value exists, it means the request should be faked.
	 */
	property name="fakeConfiguration" type="struct";

	/**
	 * A boolean flag to prevent requests from being made that don't match a pattern in the fakeConfiguration.
	 * Only applies when faking requests.
	 */
	property name="preventStrayRequests" type="boolean";

	/**
	 * A reference to the HyperBuilder that created this request, if any.
	 */
	property name="builder" type="HyperBuilder";

	/**
	 * Initialize a new HyperRequest.
	 *
	 * @returns The HyperRequest instance.
	 */
	function init( httpClient = new CfhttpHttpClient() ) {
		variables.requestID         = createUUID();
		variables.httpClient        = arguments.httpClient;
		variables.queryParams       = [];
		variables.headers           = createObject( "java", "java.util.LinkedHashMap" ).init();
		variables.cookies           = structNew( "ordered" );
		variables.files             = [];
		variables.requestCallbacks  = [];
		variables.responseCallbacks = [];
		variables.retries           = [];
		variables.retryPredicate    = function( res, req, exception ) {
			return res.isError();
		};

		setUserAgent( "HyperCFML/#getHyperVersion()#" );

		// This is overwritten by the HyperBuilder if WireBox exists.
		variables.interceptorService = {
			"processState" : function() {
			}
		};

		// This is overwritten by the HyperBuilder if WireBox exists.
		variables.asyncManager = {
			"newFuture" : function() {
				throw( "No asyncManager set!" );
			}
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
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}
		if ( !isNull( arguments.queryParams ) ) {
			setQueryParams( [] );
			withQueryParams( arguments.queryParams );
		}
		setMethod( "GET" );
		return send();
	}

	/**
	 * Execute a GET request asynchronously.
	 *
	 * @url         An optional url to set for the request.
	 * @queryParams An optional struct of query parameters to set for the request.
	 *
	 * @returns     A ColdBox Future instance.
	 */
	function getAsync( url, queryParams ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}
		if ( !isNull( arguments.queryParams ) ) {
			setQueryParams( [] );
			withQueryParams( arguments.queryParams );
		}
		setMethod( "GET" );
		return sendAsync();
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
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "POST" );
		return send();
	}

	/**
	 * Execute a POST request asynchronously.
	 *
	 * @url     An optional url to set for the request.
	 * @body    An optional body to set for the request.
	 *
	 * @returns A ColdBox Future instance.
	 */
	function postAsync( url, body ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "POST" );
		return sendAsync();
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
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "PUT" );
		return send();
	}

	/**
	 * Execute a PUT request asynchronously.
	 *
	 * @url     An optional url to set for the request.
	 * @body    An optional body to set for the request.
	 *
	 * @returns A ColdBox Future instance.
	 */
	function putAsync( url, body ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "PUT" );
		return sendAsync();
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
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "PATCH" );
		return send();
	}

	/**
	 * Execute a PATCH request asynchronously.
	 *
	 * @url     An optional url to set for the request.
	 * @body    An optional body to set for the request.
	 *
	 * @returns A ColdBox Future instance.
	 */
	function patchAsync( url, body ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "PATCH" );
		return sendAsync();
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
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "DELETE" );
		return send();
	}

	/**
	 * Execute a DELETE request asynchronously.
	 *
	 * @url     An optional url to set for the request.
	 * @body    An optional body to set for the request.
	 *
	 * @returns A ColdBox Future instance.
	 */
	function deleteAsync( url, body ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}

		if ( !isNull( arguments.body ) ) {
			setBody( arguments.body );
		}

		setMethod( "DELETE" );
		return sendAsync();
	}

	/**
	 * Execute a HEAD request.
	 *
	 * @url         An optional url to set for the request.
	 * @queryParams An optional struct of query parameters to set for the request.
	 *
	 * @returns     A HyperResponse instance for the request.
	 */
	function head( url, queryParams ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}
		if ( !isNull( arguments.queryParams ) ) {
			setQueryParams( [] );
			withQueryParams( arguments.queryParams );
		}
		setMethod( "HEAD" );
		return send();
	}

	/**
	 * Execute a HEAD request asynchronously.
	 *
	 * @url         An optional url to set for the request.
	 * @queryParams An optional struct of query parameters to set for the request.
	 *
	 * @returns     A ColdBox Future instance.
	 */
	function headAsync( url, queryParams ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}
		if ( !isNull( arguments.queryParams ) ) {
			setQueryParams( [] );
			withQueryParams( arguments.queryParams );
		}
		setMethod( "HEAD" );
		return sendAsync();
	}

	/**
	 * Execute an OPTIONS request.
	 *
	 * @url         An optional url to set for the request.
	 * @queryParams An optional struct of query parameters to set for the request.
	 *
	 * @returns     A HyperResponse instance for the request.
	 */
	function options( url, queryParams ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}
		if ( !isNull( arguments.queryParams ) ) {
			setQueryParams( [] );
			withQueryParams( arguments.queryParams );
		}
		setMethod( "OPTIONS" );
		return send();
	}

	/**
	 * Execute an OPTIONS request asynchronously.
	 *
	 * @url         An optional url to set for the request.
	 * @queryParams An optional struct of query parameters to set for the request.
	 *
	 * @returns     A ColdBox Future instance.
	 */
	function optionsAsync( url, queryParams ) {
		if ( !isNull( arguments.url ) ) {
			setUrl( arguments.url );
		}
		if ( !isNull( arguments.queryParams ) ) {
			setQueryParams( [] );
			withQueryParams( arguments.queryParams );
		}
		setMethod( "OPTIONS" );
		return sendAsync();
	}

	/**
	 * Add additional query parameters to the request.
	 * Note: This will remove any values with duplicate keys prior to adding the new struct of params.
	 *
	 * @queryParams A struct of query parameters to set for the request.
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
	 * Appends additional query parameters to the request.
	 *
	 * @queryParams A struct of query parameters to append to the request.
	 *
	 * @returns     The HyperRequest instance.
	 */
	function appendQueryParams( queryParams = {} ) {
		for ( var name in arguments.queryParams ) {
			appendQueryParam( name, arguments.queryParams[ name ] );
		}
		return this;
	}

	/**
	 * Set a query parameter for the request.
	 * Note: This removes all other query params with the same name.
	 *
	 * @name    The name of the query parameter.
	 * @value   The value of the query parameter.
	 *
	 * @returns The HyperRequest instance.
	 */
	function setQueryParam( name, value ) {
		for ( var i = 1; i <= variables.queryParams.len(); i++ ) {
			var param = variables.queryParams[ i ];
			if ( param.name == arguments.name ) {
				variables.queryParams.deleteAt( i );
			}
		}
		appendQueryParam( arguments.name, arguments.value );
		return this;
	}

	/**
	 * Append a query parameter for the request.
	 *
	 * @name    The name of the query parameter.
	 * @value   The value of the query parameter.
	 *
	 * @returns The HyperRequest instance.
	 */
	function appendQueryParam( name, value ) {
		variables.queryParams.append( {
			"name"  : arguments.name,
			"value" : arguments.value
		} );
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
		for ( var i = 1; i <= variables.queryParams.len(); i++ ) {
			var param = variables.queryParams[ i ];
			if ( param.name == arguments.name ) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Gets the first value for a certian query parameter.
	 * @deprecated Use `getQueryParamByName`
	 *
	 * @name    The name of the query parameter to retrieve its value.
	 *
	 * @returns The value of the query parameter to retrieve the first value.
	 *          Returns an empty string if the query parameter does not exist.
	 */
	function getQueryParam( name ) {
		return getQueryParamByName( arguments.name );
	}

	/**
	 * Gets the first value for a certian query parameter.
	 *
	 * @name    The name of the query parameter to retrieve its value.
	 *
	 * @returns The value of the query parameter to retrieve the first value.
	 *          Returns an empty string if the query parameter does not exist.
	 */
	function getQueryParamByName( name ) {
		for ( var i = 1; i <= variables.queryParams.len(); i++ ) {
			var param = variables.queryParams[ i ];
			if ( param.name == arguments.name ) {
				return param.value;
			}
		}
		return "";
	}

	/**
	 * Get all the values for a certian query parameter.
	 *
	 * @name    The name of the query parameter to retrieve all of its values.
	 *
	 * @returns An array of values for the query parameter.
	 *          Returns an empty array if the query parameter does not exist.
	 */
	function getAllQueryParamsByName( name ) {
		return variables.queryParams.filter( function( param ) {
			return param.name == name;
		} );
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
		variables.headers[ name ] = value;
		return this;
	}

	/**
	 * Adds specified headers to the request if they exist.
	 * Usually used in conjunction with the current CFML request headers.
	 *
	 * @names   An array of header names to add to the request, if they exist in the `headers` struct.
	 * @headers A struct of headers to inspect. Default: `getHTTPRequestData( false ).headers`
	 *
	 * @returns The HyperRequest instance.
	 */
	function forwardHeaders( required array names, struct headers = getHTTPRequestData( false ).headers ) {
		for ( var name in arguments.names ) {
			if ( arguments.headers.keyExists( name ) ) {
				setHeader( name, arguments.headers[ name ] );
			}
		}
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
	 * Get the value for a certain header.
	 *
	 * @name    The name of the header to retrieve its value.
	 *
	 * @returns The value of the header.
	 *          Returns an empty string if the header does not exist.
	 */
	function getHeader( name ) {
		return hasHeader( name ) ? variables.headers.get( name ) : "";
	}

	/**
	 * Add additional cookies to the request.
	 *
	 * @headers A struct of cookies to add to the request.
	 *
	 * @returns The HyperRequest instance.
	 */
	public HyperRequest function withCookies( struct cookies = {} ) {
		for ( var name in arguments.cookies ) {
			setCookie( name, arguments.cookies[ name ] );
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
	public HyperRequest function setCookie( required string name, required any value ) {
		variables.cookies[ name ] = value;
		return this;
	}

	/**
	 * Sends all current cookies along with the request.

	 * @returns The HyperRequest instance.
	 */
	public HyperRequest function withCredentials() {
		for ( var name in cookie ) {
			setCookie( name, cookie[ name ] );
		}
		return this;
	}

	/**
	 * Check if the request has a cookie with the given name.
	 *
	 * @name    The name of the cookie to check.
	 *
	 * @returns True if the cookie exists.
	 */
	public boolean function hasCookie( required string name ) {
		return variables.cookies.keyExists( arguments.name );
	}

	/**
	 * Get the value for a certain cookie.
	 *
	 * @name    The name of the cookie to retrieve its value.
	 *
	 * @returns The value of the cookie.
	 *          Returns an empty string if the cookie does not exist.
	 */
	public any function getCookie( required string name ) {
		return hasCookie( arguments.name ) ? variables.cookies.get( arguments.name ) : "";
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
	 * Sets the certificate path and optional decrypting password for the request.
	 *
	 * @certificatePath The mapped path to the certificate used to authenticate.
	 * @password        The optional password used to decrypt the certificate.
	 *
	 * @returns         The HyperRequest instance.
	 */
	function withCertificateAuth( required string certificatePath, string password ) {
		setClientCert( arguments.certificatePath );
		if ( !isNull( arguments.password ) ) {
			setClientCertPassword( arguments.password );
		}
		return this;
	}

	/**
	 * Sets the username, password, domain and workstation for NTLM Auth.
	 *
	 * @username The username for the NTLM auth.
	 * @password The password for the NTLM auth.
	 * @domain The domain for the NTLM auth.
	 * @workstation The workstation for the NTLM auth.
	 *
	 * @returns  The HyperRequest instance.
	 */
	function withNTLMAuth(
		required string username,
		required string password,
		required string domain,
		required string workstation
	) {
		setAuthType( "NTLM" );
		setUsername( arguments.username );
		setPassword( arguments.password );
		setDomain( arguments.domain );
		setWorkstation( arguments.workstation );
		return this;
	}

	/**
	 * Schedules a callback to be ran when executing the request.
	 *
	 * @callback The callback to run when executing the request.
	 *
	 * @returns  The HyperRequest instance.
	 */
	public HyperRequest function withRequestCallback( required function callback ) {
		arrayAppend( variables.requestCallbacks, arguments.callback );
		return this;
	}

	/**
	 * Schedules a callback to be ran when receiving the response.
	 *
	 * @callback The callback to run when receiving the response.
	 *
	 * @returns  The HyperRequest instance.
	 */
	public HyperRequest function withResponseCallback( required function callback ) {
		arrayAppend( variables.responseCallbacks, arguments.callback );
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
			invoke( this, "set#key#", { 1 : value } );
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
	 * A convenience method to not encode the url.
	 *
	 * @returns The HyperRequest instance.
	 */
	function withoutEncodingUrl() {
		setEncodeUrl( false );
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
	 * A convenience method to set the body format and Content-Type to xml.
	 *
	 * @returns The HyperRequest instance.
	 */
	function asXML() {
		setBodyFormat( "xml" );
		setContentType( "application/xml" );
		return this;
	}

	/**
	 * A convenience method to set the body format and Content-Type to xml.
	 *
	 * @returns The HyperRequest instance.
	 */
	function asBinary() {
		setBodyFormat( "binary" );
		setContentType( "application/octet-stream" );
		return this;
	}

	/**
	 * Attaches a file to the Hyper request.
	 * Also sets the Content-Type as `multipart/form-data`.
	 * Multiple files can be attached by calling `attach` multiple times before calling a send method.
	 *
	 * @name      The name of the file being uploaded.
	 * @path      The absolute path to the file to be uploaded.
	 * @mimeType  An optional mime type to associate with the file.
	 *
	 * @returns   The HyperRequest instance.
	 */
	function attach(
		required string name,
		required string path,
		string mimeType
	) {
		setBodyFormat( "formFields" );
		setContentType( "multipart/form-data" );
		var fileInfo = {
			name : arguments.name,
			path : arguments.path
		};
		if ( !isNull( arguments.mimeType ) ) {
			fileInfo[ "mimeType" ] = arguments.mimeType;
		}
		variables.files.append( fileInfo );
		return this;
	}

	/**
	 * A convenience method to set the User-Agent header.
	 *
	 * @type    The User-Agent value for the request.
	 *
	 * @returns The HyperRequest instance.
	 */
	public HyperRequest function setUserAgent( required string userAgent ) {
		setHeader( "User-Agent", arguments.userAgent );
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
	function getFullUrl( withQueryString = false ) {
		var base = isValid( "url", getUrl() ) ? getUrl() : getBaseUrl() & getUrl();
		return base & ( arguments.withQueryString ? serializeQueryParams() : "" );
	}

	/**
	 * Sets the cfhttp call to resolve urls.
	 *
	 * @returns The HyperRequest instance.
	 */
	function resolveUrls() {
		setResolveUrls( true );
		return this;
	}

	/**
	 * Send the HTTP request asynchronously and return a ColdBox Future that resolves to a HyperResponse
	 *
	 * @throws MissingAsyncManager
	 * @returns Future< HyperResponse >
	 */
	function sendAsync() {
		if ( isNull( variables.asyncManager ) ) {
			throw( type = "MissingAsyncManager", message = "No asyncManager set!" );
		}

		return variables.asyncManager.newFuture( function() {
			return this.send();
		} );
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

		for ( var callback in variables.requestCallbacks ) {
			callback( this );
		}
		variables.interceptorService.processState( "onHyperRequest", { "request" : this } );

		try {
			var res = shouldFake() ? generateFakeRequest() : variables.httpClient.send( this );

			for ( var callback in variables.responseCallbacks ) {
				callback( res );
			}
			variables.interceptorService.processState(
				"onHyperResponse",
				{
					"response" : res,
					"request"  : res.getRequest()
				}
			);

			if (
				variables.currentRequestCount <= variables.retries.len() &&
				variables.retryPredicate( res, this )
			) {
				sleep( variables.retries[ variables.currentRequestCount ] );
				variables.currentRequestCount++;
				return variables.send();
			}

			if ( res.isRedirect() && shouldFollowRedirect() ) {
				return followRedirect( res );
			}

			return res;
		} catch ( HyperRequestError e ) {
			var resMemento = deserializeJSON( e.extendedinfo ).response;
			var res        = new Hyper.models.HyperResponse(
				originalRequest = this,
				executionTime   = resMemento.executionTime,
				charset         = resMemento.charset,
				statusCode      = resMemento.statusCode,
				statusText      = resMemento.statusText,
				headers         = resMemento.headers,
				data            = resMemento.data,
				timestamp       = resMemento.timestamp,
				responseID      = resMemento.responseID
			);

			if (
				variables.currentRequestCount <= variables.retries.len() &&
				variables.retryPredicate( res, this, e )
			) {
				sleep( variables.retries[ variables.currentRequestCount ] );
				variables.currentRequestCount++;
				return variables.send();
			}

			rethrow;
		}
	}

	/**
	 * Creates a debug representation of the HTTP request for the current HTTP client.
	 *
	 * @returns A struct with debug information about the request.
	 */
	public struct function debug() {
		if ( getFullUrl() == "" ) {
			throw( type = "NoUrlException" );
		}

		for ( var callback in variables.requestCallbacks ) {
			callback( this );
		}
		variables.interceptorService.processState( "onHyperRequest", { "request" : this } );

		return httpClient.debug( this );
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
		variables.queryParams       = [];
		variables.headers           = createObject( "java", "java.util.LinkedHashMap" ).init();
		variables.files             = [];
		variables.requestCallbacks  = [];
		variables.responseCallbacks = [];
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
	function when(
		condition,
		successCallback,
		failureCallback
	) {
		if ( condition ) {
			successCallback( this );
			return this;
		}

		if ( !isNull( failureCallback ) ) {
			failureCallback( this );
		}
		return this;
	}

	public HyperRequest function retry(
		required any attempts,
		numeric delay,
		function predicate
	) {
		// convert attempt counts into an array of identical backoff delays
		if ( isSimpleValue( arguments.attempts ) ) {
			if ( isNull( arguments.delay ) || !isNumeric( arguments.delay ) ) {
				throw(
					type    = "HyperRetryMissingParameter",
					message = "The `delay` parameter is required when using a numeric attempt count."
				);
			}
			var attemptCount   = arguments.attempts;
			arguments.attempts = [];
			for ( var i = 1; i <= attemptCount; i++ ) {
				arguments.attempts.append( arguments.delay );
			}
		}

		variables.retries = arguments.attempts;
		if ( !isNull( arguments.predicate ) ) {
			variables.retryPredicate = arguments.predicate;
		}

		return this;
	}

	/**
	 * Clones the current request into a new HyperRequest.
	 *
	 * @returns A new HyperRequest instance cloned from this one.
	 */
	public HyperRequest function clone() {
		var req = new HyperRequest();
		req.setInterceptorService( variables.interceptorService );
		req.setAsyncManager( variables.asyncManager );
		req.setHttpClient( variables.httpClient );
		req.setBaseUrl( variables.baseUrl );
		req.setUrl( variables.url );
		req.setResolveUrls( variables.resolveUrls );
		req.setEncodeUrl( variables.encodeUrl );
		req.setMethod( variables.method );
		req.setUsername( variables.username );
		req.setPassword( variables.password );
		req.setTimeout( variables.timeout );
		req.setMaximumRedirects( variables.maximumRedirects );
		req.setBody( duplicate( variables.body ) );
		req.setBodyFormat( variables.bodyFormat );
		req.setReferrer( isNull( variables.referrer ) ? javacast( "null", "" ) : variables.referrer );
		req.setHeaders( variables.headers.clone() );
		req.setQueryParams( duplicate( variables.queryParams ) );
		req.setFiles( duplicate( variables.files ) );
		req.setThrowOnError( variables.throwOnError );
		req.setClientCert( isNull( variables.clientCert ) ? javacast( "null", "" ) : variables.clientCert );
		req.setClientCertPassword(
			isNull( variables.clientCertPassword ) ? javacast( "null", "" ) : variables.clientCertPassword
		);
		req.setDomain( variables.domain );
		req.setWorkstation( variables.workstation );
		req.setAuthType( variables.authType );
		req.setRequestCallbacks( duplicate( variables.requestCallbacks ) );
		req.setResponseCallbacks( duplicate( variables.responseCallbacks ) );
		req.setRetries( duplicate( getRetries() ) );
		req.setRetryPredicate( getRetryPredicate() );
		return req;
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
			var name  = decodeFromURL( listFirst( paramString, "=" ) );
			var value = decodeFromURL( listRest( paramString, "=" ) );
			appendQueryParam( name, value );
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

		variables.queryParams.sort( function( paramA, paramB ) {
			return compare( paramA.name, paramB.name );
		} );

		return "?" & variables.queryParams
			.map( function( param ) {
				return len( param.value ) ? "#encodeForURL( param.name )#=#encodeForURL( param.value )#" : "#encodeForURL( param.name )#";
			} )
			.toList( "&" );
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
		var redirectReq = this.clone();
		redirectReq.setReferrer( res );
		redirectReq.setUrl(
			createObject( "java", "java.net.URI" )
				.init( res.getRequest().getFullUrl() )
				.resolve( res.getHeader( "Location" ) )
		);
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
		return !isSimpleValue( getBody() ) || getBody() != "";
	}

	/**
	 * Ensures the body value is a simple value by serializing complex values.
	 *
	 * @returns A simple value representing the body.
	 */
	public any function prepareBody() {
		if ( isSimpleValue( getBody() ) ) {
			return getBody();
		}
		return getBodyFormat() == "json" ? serializeJSON( getBody() ) : getBody();
	}

	/**
	 * Returns a struct representing this HyperRequest.
	 *
	 * @return struct
	 */
	public struct function getMemento() {
		return {
			"requestID"           : getRequestID(),
			"baseUrl"             : getBaseUrl(),
			"url"                 : getUrl(),
			"fullUrl"             : getFullUrl(),
			"method"              : getMethod(),
			"queryParams"         : getQueryParams(),
			"headers"             : getHeaders(),
			"cookies"             : getCookies(),
			"files"               : getFiles(),
			"bodyFormat"          : getBodyFormat(),
			"body"                : getBody(),
			"referrerId"          : isNull( variables.referrer ) ? "" : variables.referrer.getResponseID(),
			"throwOnError"        : getThrowOnError(),
			"timeout"             : getTimeout(),
			"maximumRedirects"    : getMaximumRedirects(),
			"authType"            : getAuthType(),
			"username"            : getUsername(),
			"password"            : getPassword(),
			"clientCert"          : isNull( variables.clientCert ) ? "" : variables.clientCert,
			"clientCertPassword"  : isNull( variables.clientCertPassword ) ? "" : variables.clientCertPassword,
			"domain"              : getDomain(),
			"workstation"         : getWorkstation(),
			"resolveUrls"         : getResolveUrls(),
			"encodeUrl"           : getEncodeUrl(),
			"retries"             : getRetries(),
			"currentRequestCount" : getCurrentRequestCount()
		};
	}

	/**
	 * Registers this configured HyperRequest as the defaults for a named HyperBuilder in WireBox.
	 *
	 * @alias  The name to register the custom HyperBuilder.
	 *
	 * @returns The HyperRequest instance.
	 */
	public HyperRequest function registerAs( required string alias ) {
		return variables.builder.registerAs( alias, this );
	}

	/**
	 * Returns true if the request should be faked.
	 *
	 * @returns boolean
	 */
	private boolean function shouldFake() {
		return !isNull( variables.fakeConfiguration );
	}

	/**
	 * Generates a FakeHyperResponse for this request.
	 *
	 * First, it checks against any registered patterns.
	 * Second, it checks if stray requests should be prevented. If so, it throws an HyperFakeStrayRequest exception.
	 * Finally, it returns a default 200 OK fake response.
	 *
	 * @throws HyperFakeStrayRequest
	 *
	 * @returns FakeHyperResponse
	 */
	private FakeHyperResponse function generateFakeRequest() {
		for ( var pattern in variables.fakeConfiguration ) {
			if ( getPathPatternMatcher().matchPattern( pattern, getFullUrl() ) ) {
				if ( variables.builder.hasSequenceForPattern( pattern ) ) {
					return variables.builder.record( this, variables.builder.popResponseForSequence( pattern ) );
				}

				var callback = variables.fakeConfiguration[ pattern ];
				var res      = callback( function(
					numeric statusCode    = 200,
					string statusText     = "OK",
					any data              = "",
					struct headers        = {},
					numeric executionTime = 0,
					string charset        = "UTF-8",
					timestamp             = now()
				) {
					arguments.originalRequest = this;
					return createFakeResponse( argumentCollection = arguments );
				}, this );

				if ( !isArray( res ) ) {
					return variables.builder.record( this, res );
				}

				variables.builder.registerSequence( pattern, res );
				return variables.builder.record( this, variables.builder.popResponseForSequence( pattern ) );
			}
		}

		if ( !isNull( variables.preventStrayRequests ) && variables.preventStrayRequests ) {
			throw(
				type         = "HyperFakeStrayRequest",
				message      = "Request sent to #getFullUrl()# but no fake response was configured.",
				detail       = "To prevent this exception, don't call `preventStrayRequests()` in your tests.",
				extendedInfo = serializeJSON( variables.fakeConfiguration )
			);
		}

		return variables.builder.record( this, createFakeResponse( originalRequest = this ) );
	}

	/**
	 * Creates a FakeHyperResponse passing in the arguments provided.
	 *
	 * @returns A new FakeHyperResponse instance.
	 */
	private FakeHyperResponse function createFakeResponse() {
		return new hyper.models.FakeHyperResponse( argumentCollection = arguments );
	}

	/**
	 * Returns a PathPatternMatcher instance.
	 * Used for matching paths when faking requests.
	 *
	 * @returns PathPatternMatcher
	 */
	private PathPatternMatcher function getPathPatternMatcher() {
		param variables.pathPatternMatcher = new globber.models.PathPatternMatcher();
		return variables.pathPatternMatcher;
	}

	public string function getHyperVersion() {
		if ( !structKeyExists( application, "hyperVersion" ) ) {
			application.hyperVersion = deserializeJSON( fileRead( expandPath( "/hyper/box.json" ) ) ).version;
		}
		return application.hyperVersion;
	}

}
