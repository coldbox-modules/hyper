component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function run() {
        describe( "Builder defaults", function() {
            beforeEach( function() {
                variables.hyper = getInstance( "HyperBuilder@Hyper" );
            } );

            afterEach( function() {
                if ( variables.keyExists( "hyper" ) ) {
                    variables.delete( "hyper" );
                }
            } );

            it( "can be configured with defaults that get passed to every request", function() {
                hyper.defaults.setBaseUrl( "https://jsonplaceholder.typicode.com" );
                var req = hyper.new();
                expect( req.getBaseUrl() ).toBe( "https://jsonplaceholder.typicode.com" );
            } );
        } );
    }

}
