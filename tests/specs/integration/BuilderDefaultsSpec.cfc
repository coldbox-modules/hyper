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
                    headers = {
                        "X-Requested-With" = "XMLHTTPRequest"
                    }
                );
                var req = hyper.new();
                expect( req.getBaseUrl() ).toBe( "https://jsonplaceholder.typicode.com" );
                expect( req.getHeader( "X-Requested-With" ) ).toBe( "XMLHTTPRequest" );
            } );
        } );
    }

}
