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
				if ( isBoxLang() ) {
					return skip( "File uploads work but have a bug that prevents it from passing on the first time." );
				}

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
				var json = res.json();
				expect( json.smallPhoto ).toBe( "chuck_norris.jpg" );
				expect( json.largePhoto ).toBe( "chuck_norris.jpg" );
				expect( json.description ).toBe( "Chuck Norris doesn't need two different photos." );
			} );
		} );
	}

}
