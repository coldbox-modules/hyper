/**
 * Responsible for executing the HyperRequest and mapping it to a HyperResponse
 */
interface displayname="HyperHttpClientInterface" {

	/**
	 * Execute the HyperRequest and map it to a HyperResponse.
	 *
	 * @req     The HyperRequest to execute.
	 *
	 * @returns A HyperResponse of the executed request.
	 */
	public HyperResponse function send( required HyperRequest req );

}
