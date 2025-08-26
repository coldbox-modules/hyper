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
				var hyper = getInstance( "JSONPlaceholderClient" );
				var res   = hyper.get( "/posts/1" );
				expect( res.isOK() ).toBeTrue();
				var data = res.json();
				expect( data ).toBeStruct( "Expected to deserialize JSON data from the response." );
				expect( data ).toBe(
					deserializeJSON(
						"{
                        ""userId"": 1,
                        ""id""    : 1,
                        ""title"" : ""sunt aut facere repellat provident occaecati excepturi optio reprehenderit"",
                        ""body""  : ""quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto""
                    }"
					)
				);
			} );

			it( "can configure builders using a registerAs syntax", () => {
				getInstance( "HyperBuilder@hyper" )
					.setBaseUrl( "https://jsonplaceholder.typicode.com" )
					.withRequestCallback( function( req ) {
						req.withHeaders( { "X-Custom-Header" : "foobar" } );
					} )
					.registerAs( "JSONPlaceholderClient2" );

				var hyper = getInstance( "JSONPlaceholderClient2" );
				var res   = hyper.get( "/posts/1" );
				expect( res.isOK() ).toBeTrue();
				var data = res.json();
				expect( data ).toBeStruct( "Expected to deserialize JSON data from the response." );
				expect( data ).toBe(
					deserializeJSON(
						"{
                        ""userId"": 1,
                        ""id""    : 1,
                        ""title"" : ""sunt aut facere repellat provident occaecati excepturi optio reprehenderit"",
                        ""body""  : ""quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto""
                    }"
					)
				);
			} );
		} );
	}

}
