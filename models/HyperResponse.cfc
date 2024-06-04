/**
 * A convenient wrapper for HTTP responses.
 */
component accessors="true" {

	/**
	 * Unique response ID representing this response.
	 */
	property name="responseID";

	/**
	 * The status code for the response.
	 */
	property
		name   ="statusCode"
		default="200"
		setter ="false";

	/**
	 * The status text for the response.
	 */
	property
		name   ="statusText"
		default="OK"
		setter ="false";

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
	property
		name   ="charset"
		default="UTF-8"
		setter ="false";

	/**
	 * The charset value for the response.
	 */
	property
		name  ="headers"
		type  ="struct"
		setter="false";

	/**
	 * The timestamp for when this response was received.
	 */
	property name="timestamp" setter="false";

	/**
	 * The execution time of the request, in milliseconds.
	 */
	property name="executionTime" setter="false";

	/**
	 * Create a new HyperResponse.
	 *
	 * @originalRequest The HyperRequest associated with this response.
	 * @executionTime   The execution time of the request, in milliseconds.
	 * @charset         The response charset. Default: UTF-8
	 * @statusCode      The response status code. Default: 200.
	 * @statusText      The response status text. Default: OK.
	 * @headers         The response headers. Default: {}.
	 * @data            The response data. Default: "".
	 * @timestamp       The timestamp for when this response was received. Default: `now()`.
	 * @responseID      Unique response ID representing this response. Default: `createUUID()`.
	 *
	 * @returns         A new HyperResponse instance.
	 */
	public HyperResponse function init(
		required HyperRequest originalRequest,
		required numeric executionTime,
		string charset     = "UTF-8",
		numeric statusCode = 200,
		string statusText  = "OK",
		struct headers     = {},
		any data           = "",
		timestamp          = now(),
		any responseID     = createUUID()
	) {
		variables.responseID    = arguments.responseID;
		variables.request       = arguments.originalRequest;
		variables.charset       = arguments.charset;
		variables.statusCode    = arguments.statusCode;
		variables.statusText    = arguments.statusText;
		variables.headers       = arguments.headers;
		variables.data          = arguments.data;
		variables.timestamp     = arguments.timestamp;
		variables.executionTime = arguments.executionTime;
		return this;
	}

	/**
	 * Returns the status code and status text as a single string.
	 *
	 * @returns The status code and status text
	 */
	function getStatus() {
		return "#getStatusCode()# #getStatusText()#";
	}

	/**
	 * Returns the id of the request to which this response is related.
	 *
	 * @returns The request id
	 */
	function getRequestID() {
		return getRequest().getRequestID();
	}

	/**
	 * Returns the data of the request as deserialized JSON.
	 *
	 * @returns A deserialized version of the data.
	 */
	function json() {
		if ( !isJSON( getData() ) ) {
			throw(
				type    = "DeserializeJsonException",
				message = "The response is not json.",
				detail  = getData()
			);
		}
		return deserializeJSON( getData() );
	}

	/**
	 * Returns true if the request status code is considered successful (2xx status code).
	 *
	 * @returns boolean
	 */
	function isSuccess() {
		return left( getStatusCode(), 1 ) == "2";
	}

	/**
	 * Returns true if the request status code is 200 OK.
	 *
	 * @returns boolean
	 */
	function isOK() {
		return getStatusCode() == "200";
	}

	/**
	 * Returns true if the request status code is 201 Created.
	 *
	 * @returns boolean
	 */
	function isCreated() {
		return getStatusCode() == "201";
	}

	/**
	 * Returns true if the request status code is considered a redirect (3xx status code).
	 *
	 * @returns boolean
	 */
	function isRedirect() {
		return left( getStatusCode(), 1 ) == "3";
	}

	/**
	 * Returns true if the request status code is considered either a
	 * client error (4xx status code) or a server error (5xx status code).
	 *
	 * @returns boolean
	 */
	function isError() {
		return left( getStatusCode(), 1 ) == "4" ||
		left( getStatusCode(), 1 ) == "5";
	}

	/**
	 * Returns true if the request status code is considered a client error (4xx status code).
	 *
	 * @returns boolean
	 */
	function isClientError() {
		return left( getStatusCode(), 1 ) == "4";
	}

	/**
	 * Returns true if the request status code is 401 Unauthorized.
	 *
	 * @returns boolean
	 */
	function isUnauthorized() {
		return getStatusCode() == "401";
	}

	/**
	 * Returns true if the request status code is 403 Forbidden.
	 *
	 * @returns boolean
	 */
	function isForbidden() {
		return getStatusCode() == "403";
	}

	/**
	 * Returns true if the request status code is 404 Not Found.
	 *
	 * @returns boolean
	 */
	function isNotFound() {
		return getStatusCode() == "404";
	}

	/**
	 * Returns true if the request status code is considered a server error (5xx status code).
	 *
	 * @returns boolean
	 */
	function isServerError() {
		return left( getStatusCode(), 1 ) == "5";
	}

	/**
	 * Checks if a header exists in the response.
	 *
	 * @name    The name of the header to check.
	 *
	 * @returns boolean
	 */
	public boolean function hasHeader( required string name ) {
		return variables.headers.keyExists( lCase( arguments.name ) );
	}

	/**
	 * Gets the value of a header from the response.
	 *
	 * @name         The name of the header to retrieve.
	 * @defaultValue The value to return if the header does not exist.
	 *
	 * @returns any
	 */
	public any function getHeader( required string name, any defaultValue = "" ) {
		return hasHeader( arguments.name ) ? variables.headers[ lCase( arguments.name ) ] : arguments.defaultValue;
	}

	/**
	 * Caches the result of parsing the `Set-Cookie` header and returns it.
	 *
	 * @returns struct<name, cookieStruct>
	 */
	public struct function getCookies() {
		param variables.cookies = parseCookies();
		return variables.cookies;
	}

	/**
	 * Parses and saves the cookies to the cookie scope.
	 *
	 * @returns The HyperResponse instance.
	 */
	public HyperResponse function persistCookies() {
		var cookies = getCookies().each( function( name, cookieStruct ) {
			cookieStruct[ "name" ]         = name;
			cookieStruct[ "preservecase" ] = true;
			if ( !cookieStruct.keyExists( "domain" ) ) {
				cookieStruct[ "domain" ] = CGI.HTTP_HOST;
			}
			cfcookie( attributeCollection = cookieStruct );
		} );
		return this;
	}

	/**
	 * Parses the `Set-Cookie` header and returns a struct of cookies for the response.
	 *
	 * @returns struct<name, cookieStruct>
	 */
	private struct function parseCookies() {
		return arrayWrap( getHeader( "Set-Cookie", [] ) ).reduce( function( acc, cookieString ) {
			var parts = listToArray( cookieString, ";" );

			// the first item is always the name/value pair
			var nameValuePair = parts[ 1 ];

			// grab the name from the name/value pair and set it in our return struct
			var name    = listFirst( nameValuePair, "=" );
			acc[ name ] = {};

			// parse out the value, if one exists
			acc[ name ][ "value" ] = "";
			if ( listLen( nameValuePair, "=" ) > 1 ) {
				acc[ name ][ "value" ] = listRest( nameValuePair, "=" );
			}

			// grab the rest of the parts and parse them out
			var rest = arrayLen( parts ) > 1 ? arraySlice( parts, 2 ) : [];
			for ( var segment in rest ) {
				var segmentParts = listToArray( segment, "=" );
				var segmentName  = segmentParts[ 1 ];
				var segmentValue = arrayLen( segmentParts ) > 1 ? segmentParts[ 2 ] : true;

				// CFML doesn't support passing Max-Age so we'll
				// convert to days instead and pass as the Expires key
				if ( segmentName == "max-age" ) {
					segmentName  = "expires";
					segmentValue = segmentValue / 60 / 60 / 24;
				}

				acc[ name ][ segmentName ] = segmentValue;
			}

			return acc;
		}, {} );
	}

	/**
	 * Gets a serializable representation of the response
	 *
	 * @returns struct
	 */
	public struct function getMemento( array excludes = [] ) {
		return structFilter(
			{
				"responseID"    : getResponseID(),
				"requestID"     : getRequestID(),
				"statusCode"    : getStatusCode(),
				"statusText"    : getStatusText(),
				"status"        : getStatus(),
				"data"          : getData(),
				"charset"       : getCharset(),
				"headers"       : getHeaders(),
				"timestamp"     : getTimestamp(),
				"executionTime" : getExecutionTime(),
				"cookies"       : getCookies()
			},
			function( key ) {
				return !arrayContainsNoCase( excludes, key );
			}
		);
	}

	/**
	 * Ensures the passed in value is an array
	 *
	 * @value A single value or an array.
	 *
	 * @returns An array
	 */
	private array function arrayWrap( required any value ) {
		if ( isArray( arguments.value ) ) {
			return arguments.value;
		}
		return [ arguments.value ];
	}

}
