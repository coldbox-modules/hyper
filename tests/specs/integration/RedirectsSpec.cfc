component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    variables.localEndpoint = "http://#CGI[ "server_name" ]#:#CGI[ "server_port" ]#/tests/resources/app/index.cfm/api";

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

            it( "follows redirects by default", function() {
                var res = hyper.get( localEndpoint & "/redirect" );
                expect( res.getStatusCode() ).toBe( 200 );
                expect( res.json() ).toBe( { "message" = "Hello, world!" } );
                var referrer = res.getRequest().getReferrer();
                expect( referrer ).notToBeNull();
                expect( referrer.getStatusCode() ).toBe( 302 );
                expect( referrer.getRequest().getUrl() ).toBe( localEndpoint & "/redirect" );
            } );

            it( "can set the maximum number of redirects to follow", function() {
                var res = hyper
                    .setMaximumRedirects( 2 )
                    .get( localEndpoint & "/redirect?times=3" );
                expect( res.getStatusCode() ).toBe( 302 );
            } );

            it( "can turn off following redirects by setting max redirects to zero", function() {
                var res = hyper
                    .setMaximumRedirects( 0 )
                    .get( localEndpoint & "/redirect" );
                expect( res.getStatusCode() ).toBe( 302 );
            } );

            it( "has a helper method to not follow redirects", function() {
                var res = hyper
                    .withoutRedirecting()
                    .get( localEndpoint & "/redirect" );
                expect( res.getStatusCode() ).toBe( 302 );
            } );
        } );
    }

}
