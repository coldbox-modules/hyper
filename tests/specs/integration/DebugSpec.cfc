component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function beforeAll() {
		super.beforeAll();
		variables.hyper = getInstance( "HyperBuilder@hyper" );
	}

	function run() {
		describe( "debug spec", function() {
			it( "can print out information about the cfhttp call that will be made", function() {
				var binaryBody = charsetDecode( "some binary body", "utf-8" );
				var debugReq   = hyper
					.withHeaders( {
						"Accept"        : "application/json;odata=verbose",
						"Authorization" : "Bearer token",
						"Content-Type"  : "application/octet-stream"
					} )
					.setBody( binaryBody )
					.setBodyFormat( "other|binary" )
					.setMethod( "POST" )
					.setUrl( "https://example.com" )
					.debug();

				debug( debugReq );

				expect( debugReq ).toBeStruct();

				expect( debugReq ).toHaveKey( "attributes" );
				expect( debugReq.attributes ).toHaveKey( "url" );
				expect( debugReq.attributes.url ).toBe( "https://example.com" );
				expect( debugReq.attributes ).toHaveKey( "method" );
				expect( debugReq.attributes.method ).toBe( "POST" );

				expect( debugReq ).toHaveKey( "body" );
				expect( debugReq.body ).toHaveKey( "body" );
				expect( debugReq.body.body ).toBeArray();
				expect( debugReq.body.body ).toHaveLength( 1 );
				expect( debugReq.body.body[ 1 ] ).toBe( { "type": "body", "value": binaryBody } );
				expect( debugReq.body ).toHaveKey( "files" );
				expect( debugReq.body.files ).toBeEmpty();

				expect( debugReq.body ).toHaveKey( "headers" );
				var headers = debugReq.body.headers;
				arraySort( headers, function( a, b ) {
					return compare( a.name, b.name );
				} );
				expect( headers ).toBeArray();
				expect( headers ).toHaveLength( 3 );

				expect( headers[ 1 ] ).toBeStruct();
				expect( headers[ 1 ] ).toHaveKey( "name" );
				expect( headers[ 1 ].name ).toBe( "Accept" );
				expect( headers[ 1 ] ).toHaveKey( "value" );
				expect( headers[ 1 ].value ).toBe( "application/json;odata=verbose" );

				expect( headers[ 2 ] ).toBeStruct();
				expect( headers[ 2 ] ).toHaveKey( "name" );
				expect( headers[ 2 ].name ).toBe( "Authorization" );
				expect( headers[ 2 ] ).toHaveKey( "value" );
				expect( headers[ 2 ].value ).toBe( "Bearer token" );

				expect( headers[ 3 ] ).toBeStruct();
				expect( headers[ 3 ] ).toHaveKey( "name" );
				expect( headers[ 3 ].name ).toBe( "Content-Type" );
				expect( headers[ 3 ] ).toHaveKey( "value" );
				expect( headers[ 3 ].value ).toBe( "application/octet-stream" );
			} );
		} );
	}

}
