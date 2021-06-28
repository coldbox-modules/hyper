component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function run() {
		describe( "GET requests", function() {
			beforeEach( function() {
				variables.hyper = getInstance( "HyperBuilder@Hyper" );
			} );

			afterEach( function() {
				if ( structKeyExists( variables, "hyper" ) ) {
					structDelete( variables, "hyper" );
				}
			} );

			it( "can make a GET request", function() {
				var res = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( res ).toBeInstanceOf(
					"Hyper.models.HyperResponse",
					"A HyperResponse object should have been returned."
				);
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

			it( "serializes query string params in the short hand", function() {
				var res = hyper.get( "https://jsonplaceholder.typicode.com/posts", { "userId" : 1 } );
				expect( res.getRequest().getFullUrl( withQueryString = true ) ).toBeWithCase(
					"https://jsonplaceholder.typicode.com/posts?userId=1"
				);
			} );

			it( "serializes query string params in the long hand", function() {
				var res = hyper
					.setBaseUrl( "https://jsonplaceholder.typicode.com" )
					.setUrl( "/posts" )
					.withQueryParams( { "userId" : 1 } )
					.get();
				expect( res.getRequest().getFullUrl( withQueryString = true ) ).toBeWithCase(
					"https://jsonplaceholder.typicode.com/posts?userId=1"
				);
			} );

			it( "deserializes query string parameters in the url (to reserialize later)", function() {
				var res = hyper
					.setBaseUrl( "https://jsonplaceholder.typicode.com" )
					.setUrl( "/posts?param=with+spaces" )
					.get();
				expect( res.getRequest().getFullUrl( withQueryString = true ) ).toBeWithCase(
					"https://jsonplaceholder.typicode.com/posts?param=with+spaces"
				);
			} );

			it( "can handle params with no value in the url", function() {
				var res = hyper
					.setBaseUrl( "https://jsonplaceholder.typicode.com" )
					.setUrl( "/posts?flag" )
					.get();
				expect( res.getRequest().getFullUrl( withQueryString = true ) ).toBeWithCase(
					"https://jsonplaceholder.typicode.com/posts?flag"
				);
			} );

			it( "combines both query params and the query string in the url", function() {
				var res = hyper
					.setBaseUrl( "https://jsonplaceholder.typicode.com" )
					.setUrl( "/posts?userId=1&fwreinit=true" )
					.withQueryParams( { "force" : "true" } )
					.get();
				expect( res.getRequest().getFullUrl( withQueryString = true ) ).toBeWithCase(
					"https://jsonplaceholder.typicode.com/posts?force=true&fwreinit=true&userId=1"
				);
			} );

			it( "has access to the original HyperRequest in the HyperResponse", function() {
				var res = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( res ).toBeInstanceOf(
					"Hyper.models.HyperResponse",
					"A HyperResponse object should have been returned."
				);
				var req = res.getRequest();
				expect( req ).toBeInstanceOf( "Hyper.models.HyperRequest" );
				expect( req.getUrl() ).toBeWithCase( "https://jsonplaceholder.typicode.com/posts/1" );
			} );

			it( "records the execution time of a request", function() {
				var startTick   = getTickCount();
				var res         = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
				var elapsedTime = getTickCount() - startTick;
				expect( res.getExecutionTime() ).toBeNumeric();
				expect( res.getExecutionTime() ).toBeGTE( 0, "Execution time should be positive." );
				expect( res.getExecutionTime() ).toBeLTE(
					elapsedTime,
					"Execution time should be less than the total test execution time."
				);
			} );
		} );
	}

}
