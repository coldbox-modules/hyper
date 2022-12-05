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

	/**
	 * Return a struct of information showing how the client will execute the HyperRequest.
	 * This will be used by a developer to debug any differences between the generated
	 * request values and the expected request values.
	 *
	 * @req     The HyperRequest to debug.
	 *
	 * @returns A struct of information detailing how the client would execute the HyperRequest.
	 */
	public struct function debug( required HyperRequest req );

}
