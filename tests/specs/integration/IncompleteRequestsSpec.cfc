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

			it( "returns a 502 status code for any request that cannot be completed", function() {
				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );
				expect( res.getStatusCode() ).toBe( 502 );
				expect( res.getStatusText() ).toBe( "Bad Gateway" );
			} );

			it( "returns a 408 status code for any request that times out", function() {
				var res = hyper.setTimeout( 1 ).get( "https://httpbin.org/delay/5" );
				expect( res.getStatusCode() ).toBe( 408 );
				expect( res.getStatusText() ).toBe( "Request Timeout" );
			} );
		} );
	}

}
