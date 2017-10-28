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
