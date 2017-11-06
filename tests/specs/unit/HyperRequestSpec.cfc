component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "HyperRequest", function() {
            beforeEach( function() {
                variables.req = new Hyper.models.HyperRequest();
            } );

            afterEach( function() {
                if ( variables.keyExists( "req" ) ) {
                    variables.delete( "req" );
                }
            } );

            it( "can set multiple values at once from a struct", function() {
                expect( req.getUrl() ).toBe( "" );
                expect( req.getMethod() ).toBe( "GET" );
                req.setProperties( {
                    "url" = "https://jsonplaceholder.typicode.com/posts/1",
                    "method" = "PATCH"
                } );
                expect( req.getUrl() ).toBe( "https://jsonplaceholder.typicode.com/posts/1" );
                expect( req.getMethod() ).toBe( "PATCH" );
            } );

            it( "can set multiple headers at once", function() {
                expect( req.getHeader( "Accept" ) ).toBe( "" );
                expect( req.getHeader( "X-Requested-With" ) ).toBe( "" );
                req.withHeaders( {
                    "Accept" = "application/xml",
                    "X-Requested-With" = "XMLHTTPRequest"
                } );
                expect( req.getHeader( "Accept" ) ).toBe( "application/xml" );
                expect( req.getHeader( "X-Requested-With" ) ).toBe( "XMLHTTPRequest" );
            } );

            it( "throws an exception if the url is empty when trying to make a request", function() {
                expect( function() {
                    req.get();
                } ).toThrow( "NoUrlException" );
            } );
        } );
    }

}
