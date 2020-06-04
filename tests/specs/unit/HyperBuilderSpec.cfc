component extends="testbox.system.BaseSpec" {

	function run() {
		describe( "HyperBuilder", function() {
			beforeEach( function() {
				variables.hyper = new Hyper.models.HyperBuilder();
			} );

			afterEach( function() {
				if ( structKeyExists( variables, "hyper" ) ) {
					structDelete( variables, "hyper" );
				}
			} );

			it( "can create a new request", function() {
				expect( hyper.new() ).toBeInstanceOf( "Hyper.models.HyperRequest" );
			} );

			it( "passes through all other methods to the HyperRequest", function() {
				var req = hyper.setUrl( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( req ).toBeInstanceOf(
					"Hyper.models.HyperRequest",
					"Expected a HyperRequest instance, since HyperBuilder does not have a `setUrl` method."
				);
				expect( req.getUrl() ).toBe( "https://jsonplaceholder.typicode.com/posts/1" );
			} );
		} );
	}

}
