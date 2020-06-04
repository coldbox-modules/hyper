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
					"url"    : "https://jsonplaceholder.typicode.com/posts/1",
					"method" : "PATCH"
				} );
				expect( req.getUrl() ).toBe( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( req.getMethod() ).toBe( "PATCH" );
			} );

			it( "can set multiple headers at once", function() {
				expect( req.getHeader( "Accept" ) ).toBe( "" );
				expect( req.getHeader( "X-Requested-With" ) ).toBe( "" );
				req.withHeaders( {
					"Accept"           : "application/xml",
					"X-Requested-With" : "XMLHTTPRequest"
				} );
				expect( req.getHeader( "Accept" ) ).toBe( "application/xml" );
				expect( req.getHeader( "X-Requested-With" ) ).toBe( "XMLHTTPRequest" );
			} );

			it( "preserves case in header names", function() {
				expect( req.getHeader( "Accept" ) ).toBe( "" );
				req.withHeaders( { "accept" : "application/xml" } );
				expect( req.getHeader( "Accept" ) ).toBe( "" );
				expect( req.getHeader( "accept" ) ).toBe( "application/xml" );
				req.withHeaders( { "Accept" : "application/xml" } );
				expect( req.getHeader( "Accept" ) ).toBe( "application/xml" );
			} );

			it( "throws an exception if the url is empty when trying to make a request", function() {
				expect( function() {
					req.get();
				} ).toThrow( "NoUrlException" );
			} );

			it( "can clear out all values", function() {
				req.setUrl( "https://jsonplaceholder.typicode.com/posts/1" )
					.setMethod( "PATCH" )
					.withHeaders( { "Accept" : "application/xml" } );

				expect( req.getUrl() ).toBe( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( req.getMethod() ).toBe( "PATCH" );
				expect( req.getHeader( "Accept" ) ).toBe( "application/xml" );

				req.clear();

				expect( req.getUrl() ).toBe( "" );
				expect( req.getMethod() ).toBe( "GET" );
				expect( req.getHeader( "Accept" ) ).toBe( "" );
			} );

			it( "can chain conditional request methods with when", function() {
				req.when(
					true,
					function( r ) {
						r.withHeaders( { "Accept" : "application/xml" } );
					},
					function( r ) {
						r.withHeaders( { "Accept" : "application/json" } );
					}
				);

				expect( req.getHeader( "Accept" ) ).toBe( "application/xml" );

				req.clear();

				req.when(
					false,
					function( r ) {
						r.withHeaders( { "Accept" : "application/xml" } );
					},
					function( r ) {
						r.withHeaders( { "Accept" : "application/json" } );
					}
				);

				expect( req.getHeader( "Accept" ) ).toBe( "application/json" );

				req.clear();

				req.when( false, function( r ) {
					r.withHeaders( { "Accept" : "application/xml" } );
				} );

				expect( req.getHeader( "Accept" ) ).toBe( "" );
			} );

			it( "can set the resolvesUrls functionality of cfhttp", function() {
				expect( req.getResolveUrls() ).toBeFalse();
				req.resolveUrls();
				expect( req.getResolveUrls() ).toBeTrue();
			} );
		} );
	}

}
