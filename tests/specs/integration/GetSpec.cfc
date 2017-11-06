component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function run() {
        describe( "GET requests", function() {
            beforeEach( function() {
                variables.hyper = getInstance( "HyperBuilder@Hyper" );
            } );

            afterEach( function() {
                if ( variables.keyExists( "hyper" ) ) {
                    variables.delete( "hyper" );
                }
            } );

            it( "can make a GET request", function() {
                var res = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
                expect( res ).toBeInstanceOf(
                    "Hyper.models.HyperResponse",
                    "A HyperResponse object should have been returned."
                );
                var data = res.json();
                expect( data ).toBeStruct(
                    "Expected to deserialize JSON data from the response."
                );
                expect( data ).toBe( deserializeJSON( '{
                    "userId": 1,
                    "id": 1,
                    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
                }' ) );
            } );

            it( "serializes query string params in the short hand", function() {
                var res = hyper.get( "https://jsonplaceholder.typicode.com/posts", {
                    "userId" = 1
                } );
                expect( res.getRequest().getFullUrl() ).toBe( "https://jsonplaceholder.typicode.com/posts?userId=1" );
            } );

            it( "serializes query string params in the long hand", function() {
                var res = hyper
                    .setBaseUrl( "https://jsonplaceholder.typicode.com" )
                    .setUrl( "/posts" )
                    .withQueryParams( {
                        "userId" = 1
                    } )
                    .get();
                expect( res.getRequest().getFullUrl() ).toBe( "https://jsonplaceholder.typicode.com/posts?userId=1" );
            } );

            it( "has access to the original HyperRequest in the HyperResponse", function() {
                var res = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
                expect( res ).toBeInstanceOf(
                    "Hyper.models.HyperResponse",
                    "A HyperResponse object should have been returned."
                );
                var req = res.getRequest();
                expect( req ).toBeInstanceOf( "Hyper.models.HyperRequest" );
                expect( req.getUrl() ).toBe( "https://jsonplaceholder.typicode.com/posts/1" );
            } );
        } );
    }

}
