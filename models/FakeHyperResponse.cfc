/**
 * A fake HyperResponse where the properties can be set.
 */
component accessors="true" extends="HyperResponse" {

	/**
	 * Unique response ID representing this response.
	 */
	property name="responseID";

	/**
	 * The status code for the response.
	 */
	property name="statusCode" default="200";

	/**
	 * The status text for the response.
	 */
	property name="statusText" default="OK";

	/**
	 * The data for the response.
	 */
	property name="data" default="";

	/**
	 * The HyperRequest instance associated with this response.
	 */
	property name="request";

	/**
	 * The charset value for the response.
	 */
	property name="charset" default="UTF-8";

	/**
	 * The charset value for the response.
	 */
	property
		name="headers"
		type="struct"

		/**
		 * The timestamp for when this response was received.
		 */
		property
		name="timestamp";

	/**
	 * The execution time of the request, in milliseconds.
	 */
	property name="executionTime";

	/**
	 * Create a new FakeHyperResponse.
	 *
	 * @originalRequest The HyperRequest associated with this response.
	 * @executionTime   The execution time of the request, in milliseconds.
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
		numeric executionTime = 0,
		string charset        = "UTF-8",
		numeric statusCode    = 200,
		string statusText     = "OK",
		struct headers        = {},
		any data              = "",
		timestamp             = now()
	) {
		variables.responseID    = createUUID();
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

}
