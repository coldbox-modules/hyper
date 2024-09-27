component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function beforeAll() {
		super.beforeAll();
		variables.hyper        = getInstance( "HyperBuilder@hyper" );
		variables.asyncManager = getInstance( "box:asyncManager" );
	}

	function run() {
		describe( "async requests", function() {
			it( "can send a request asynchronously", function() {
				if ( isBoxLang() ) {
					return skip( "Variadic parameters are not yet supported in BoxLang." );
				}

				var future = hyper.setUrl( "https://jsonplaceholder.typicode.com/posts/1" ).sendAsync();
				expect( future ).toBeInstanceOf( "Future", "A Future object should have been returned." );
				var res = future.get();
				expect( future.isDone() ).toBeTrue( "Future should be completed." );
				expect( res ).toBeInstanceOf( "HyperResponse", "A HyperResponse object should have been returned." );
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

			it( "can send requests asynchronously without joining", function() {
				var requestFinished = false;
				hyper
					.setUrl( "https://jsonplaceholder.typicode.com/posts/1" )
					.sendAsync()
					.then( function( res ) {
						requestFinished = true;
					} );

				for ( var i = 0; i <= 3000; i += 100 ) {
					if ( requestFinished ) {
						return;
					}
					sleep( 100 );
				}

				fail( "Request did not finish after 3000ms. Aborting." );
			} );

			it( "can send multiple async requests", function() {
				var allFuture = variables.asyncManager.all( [
					hyper.getAsync( "https://jsonplaceholder.typicode.com/posts/1" ),
					hyper.getAsync( "https://jsonplaceholder.typicode.com/posts/2" ),
					hyper.getAsync( "https://jsonplaceholder.typicode.com/posts/3" )
				] );

				expect( allFuture ).toBeInstanceOf( "Future", "A Future object should have been returned." );
				var responseArray = allFuture.get();
				expect( responseArray ).toBeArray();
				expect( responseArray ).toHaveLength( 3 );

				for ( var i = 1; i <= responseArray.len(); i++ ) {
					var res = responseArray[ i ];
					expect( res ).toBeInstanceOf( "HyperResponse", "A HyperResponse object should have been returned." );
					var data = res.json();
					expect( data ).toBeStruct( "Expected to deserialize JSON data from the response." );
					expect( data.id ).toBe( i );
				}
			} );
		} );
	}

}
