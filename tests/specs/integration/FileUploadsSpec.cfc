component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	variables.localEndpoint = "http://#CGI[ "server_name" ]#:#CGI[ "server_port" ]#/tests/resources/app/index.cfm/api";

	function run() {
		describe( "File Uploads requests", function() {
			beforeEach( function() {
				variables.hyper = getInstance( "HyperBuilder@Hyper" );
			} );

			afterEach( function() {
				if ( structKeyExists( variables, "hyper" ) ) {
					structDelete( variables, "hyper" );
				}
			} );

			it( "can attach files", function() {
				var res = hyper
					.attach(
						"smallPhoto",
						expandPath( "/tests/resources/chuck_norris.jpg" ),
						"image/jpeg"
					)
					.attach( "largePhoto", expandPath( "/tests/resources/chuck_norris.jpg" ) )
					.post(
						"#localEndpoint#/photos",
						{ "description" : "Chuck Norris doesn't need two different photos." }
					);
				expect( res.getStatusCode() ).toBe( 201, res.getData() );
				expect( res.json() ).toBe( {
					"id"          : 777, // this is always the id returned
					"smallPhoto"  : "chuck_norris.jpg",
					"largePhoto"  : "chuck_norris.jpg",
					"description" : "Chuck Norris doesn't need two different photos."
				} );
			} );
		} );
	}

}
