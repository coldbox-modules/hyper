component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    variables.localEndpoint = "http://#CGI[ "server_name" ]#:#CGI[ "server_port" ]#/tests/resources/app/index.cfm/api";

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
                var res = hyper.post( "#localEndpoint#/create", '{
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
                    .setUrl( "#localEndpoint#/create" )
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
                var res = hyper.post( "#localEndpoint#/create", {
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
                    .post( "#localEndpoint#/create", {
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
