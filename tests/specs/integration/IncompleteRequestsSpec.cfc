component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function run() {
		describe( "incomplete requests", function() {
			beforeEach( function() {
				variables.hyper = getInstance( "HyperBuilder@Hyper" );
			} );

			afterEach( function() {
				if ( structKeyExists( variables, "hyper" ) ) {
					structDelete( variables, "hyper" );
				}
			} );

			it( "returns a 504 status code for any request that cannot be completed", function() {
				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );
				expect( res.getStatusCode() ).toBe( 504 );
			} );
		} );
	}

}
