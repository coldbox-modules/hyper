component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function run() {
		describe( "Builder pass through requests", function() {
			beforeEach( function() {
				variables.hyper = getInstance( "HyperBuilder@Hyper" );
			} );

			afterEach( function() {
				if ( structKeyExists( variables, "hyper" ) ) {
					structDelete( variables, "hyper" );
				}
			} );

			it( "passes through all other methods to the HyperRequest", function() {
				var res = hyper.setUrl( "https://jsonplaceholder.typicode.com/posts/1" ).get();
				expect( res ).toBeInstanceOf( "HyperResponse", "A HyperResponse object should have been returned." );
				var data = res.json();
				expect( data ).toBeStruct( "Expected to deserialize JSON data from the response." );
				expect( data ).toBe(
					deserializeJSON(
						"{
                            ""userId"": 1,
                            ""id"": 1,
                            ""title"": ""sunt aut facere repellat provident occaecati excepturi optio reprehenderit"",
                            ""body"": ""quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto""
                        }"
					)
				);
			} );
		} );
	}

}
