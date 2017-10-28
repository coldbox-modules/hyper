component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function run() {
        describe( "POST requests", function() {
            beforeEach( function() {
                variables.hyper = getInstance( "HyperBuilder@Hyper" );
            } );

            afterEach( function() {
                if ( variables.keyExists( "hyper" ) ) {
                    variables.delete( "hyper" );
                }
            } );

            it( "can make a POST request", function() {
                var res = hyper.post( "http://jsonplaceholder.typicode.com/posts", '{
                    "title": "Example Title",
                    "body": "This is my post body"
                }' );
                expect( res.getStatusCode() ).toBe( 201 );
                expect( res.json() ).toBe( {
                    "id" = 101, // this is always the id returned
                    "title" = "Example Title",
                    "body"  = "This is my post body"
                } );
            } );

            it( "can set the fields the long form way", function() {
                var res = hyper
                    .setUrl( "http://jsonplaceholder.typicode.com/posts" )
                    .setBody( '{
                        "title": "Example Title",
                        "body": "This is my post body"
                    }' )
                    .post();
                expect( res.getStatusCode() ).toBe( 201 );
                expect( res.json() ).toBe( {
                    "id" = 101, // this is always the id returned
                    "title" = "Example Title",
                    "body" = "This is my post body"
                } );
            } );

            it( "automatically serializes complex values", function() {
                var res = hyper.post( "http://jsonplaceholder.typicode.com/posts", {
                    "title" = "Example Title",
                    "body"  = "This is my post body"
                } );
                expect( res.getStatusCode() ).toBe( 201 );
                expect( res.json() ).toBe( {
                    "id" = 101, // this is always the id returned
                    "title" = "Example Title",
                    "body"  = "This is my post body"
                } );
            } );

            it( "can post the data as form fields", function() {
                var res = hyper
                    .asFormFields()
                    .post( "http://jsonplaceholder.typicode.com/posts", {
                        "title" = "Example Title",
                        "body"  = "This is my post body"
                    } );
                expect( res.getStatusCode() ).toBe( 201 );
                expect( res.json() ).toBe( {
                    "id" = 101, // this is always the id returned
                    "title" = "Example Title",
                    "body"  = "This is my post body"
                } );
            } );
        } );
    }

}
