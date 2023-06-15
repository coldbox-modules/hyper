component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function run() {
		describe( "Builder defaults", function() {
			beforeEach( function() {
				variables.hyper = getInstance( "HyperBuilder@Hyper" );
			} );

			afterEach( function() {
				if ( structKeyExists( variables, "hyper" ) ) {
					structDelete( variables, "hyper" );
				}
			} );

			it( "can be configured with defaults that get passed to every request", function() {
				hyper.defaults.setBaseUrl( "https://jsonplaceholder.typicode.com" );
				var req = hyper.new();
				expect( req.getBaseUrl() ).toBe( "https://jsonplaceholder.typicode.com" );
			} );

			it( "configures the defaults with any passed in parameters that exist on the request", function() {
				variables.hyper = new Hyper.models.HyperBuilder(
					baseUrl = "https://jsonplaceholder.typicode.com",
					headers = { "X-Requested-With" : "XMLHTTPRequest" }
				);
				var req = hyper.new();
				expect( req.getBaseUrl() ).toBe( "https://jsonplaceholder.typicode.com" );
				expect( req.getHeader( "X-Requested-With" ) ).toBe( "XMLHTTPRequest" );
			} );

			it( "can configure builders in the WireBox config file", () => {
				var hyper = getInstance( "SWAPIClient" );
				var res   = hyper.get( "/people/1" );
				expect( res.isOK() ).toBeTrue();
				var data = res.json();
				expect( data ).toHaveKey( "name" );
				expect( data.name ).toBe( "Luke Skywalker" );
			} );

			it( "can configure builders using a registerAs syntax", () => {
				getInstance( "HyperBuilder@hyper" )
					.setBaseUrl( "https://swapi.dev/api" )
					.withRequestCallback( function( req ) {
						req.withHeaders( { "X-Custom-Header" : "foobar" } );
					} )
					.registerAs( "SWAPIClient2" );

				var hyper = getInstance( "SWAPIClient2" );
				var res   = hyper.get( "/people/1" );
				expect( res.isOK() ).toBeTrue();
				var data = res.json();
				expect( data ).toHaveKey( "name" );
				expect( data.name ).toBe( "Luke Skywalker" );
				expect( res.getRequest().getHeaders() ).toHaveKey( "X-Custom-Header" );
				expect( res.getRequest().getHeaders()[ "X-Custom-Header" ] ).toBe( "foobar" );
			} );
		} );
	}

}
