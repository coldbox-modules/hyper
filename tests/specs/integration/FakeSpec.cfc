component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function beforeAll() {
		super.beforeAll();
		addMatchers( "hyper.models.TestBoxMatchers" );
	}

	function run() {
		describe( "fake requests", () => {
			it( "can fake all requests", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake();
				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );
				expect( res.getStatusCode() ).toBe( 200 );
				expect( res.getStatusText() ).toBe( "OK" );
			} );

			it( "can return a fake response for a pattern", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake( {
					"https://does-not-exist.also-does-not-exist" : function( createFakeResponse ) {
						return createFakeResponse( 404, "Not Found" );
					}
				} );
				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );
				expect( res.getStatusCode() ).toBe( 404 );
				expect( res.getStatusText() ).toBe( "Not Found" );
			} );

			it( "receives the request when generating fake responses", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake( {
					"https://does-not-exist.also-does-not-exist" : function( createFakeResponse, req ) {
						expect( req ).toBeInstanceOf( "hyper.models.HyperRequest" );
						return createFakeResponse( 404, "Not Found" );
					}
				} );
				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );
			} );

			it( "can return a sequence of responses", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake( {
					"https://does-not-exist.also-does-not-exist" : function( createFakeResponse ) {
						return [
							createFakeResponse( 200, "OK" ),
							createFakeResponse( 404, "Not Found" )
						];
					}
				} );

				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );
				expect( res.getStatusCode() ).toBe( 200 );
				expect( res.getStatusText() ).toBe( "OK" );

				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );
				expect( res.getStatusCode() ).toBe( 404 );
				expect( res.getStatusText() ).toBe( "Not Found" );

				expect( function() {
					hyper.get( "https://does-not-exist.also-does-not-exist" );
				} ).toThrow( type = "HyperFakeSequenceExhausted" );
			} );

			it( "can prevent stray requests from executing and throw an exception", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake( {
					"https://does-not-exist.also-does-not-exist" : function( createFakeResponse, req ) {
						expect( req ).toBeInstanceOf( "hyper.models.HyperRequest" );
						return createFakeResponse( 404, "Not Found" );
					}
				} );
				var res = hyper.get( "https://google.com" );
				expect( res.getStatusCode() ).toBe( 200 );
				expect( res.getStatusText() ).toBe( "OK" );

				hyper.preventStrayRequests();

				expect( function() {
					hyper.get( "https://google.com" );
				} ).toThrow( type = "HyperFakeStrayRequest" );
			} );

			it( "can check if a request was sent or not", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake();

				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );

				expect(
					hyper.wasRequestSent( function( req ) {
						return req.getUrl() == "https://does-not-exist.also-does-not-exist";
					} )
				).toBeTrue( "Expected the request to have been sent" );

				expect(
					hyper.wasRequestSent( function( req ) {
						return req.getUrl() == "https://google.com";
					} )
				).toBeFalse( "Expected the request not to have been sent" );
			} );

			it( "can assert a request was sent", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake();
				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );

				expect( function() {
					expect( hyper ).toHaveSentRequest( function( req ) {
						return req.getUrl() == "https://does-not-exist.also-does-not-exist";
					}, "Custom Message" );
				} ).notToThrow();

				expect( function() {
					expect( hyper ).toHaveSentRequest( function( req ) {
						return req.getUrl() == "https://google.com";
					} );
				} ).toThrow(
					type  = "TestBox.AssertionFailed",
					regex = "Expected to find a request that matched the callback parameters but did not."
				);

				expect( function() {
					expect( hyper ).toHaveSentRequest( function( req ) {
						return req.getUrl() == "https://google.com";
					}, "Custom Message" );
				} ).toThrow( type = "TestBox.AssertionFailed", regex = "Custom Message" );
			} );

			it( "can assert a request was not sent", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake();
				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );

				expect( function() {
					expect( hyper ).notToHaveSentRequest( function( req ) {
						return req.getUrl() == "https://does-not-exist.also-does-not-exist";
					} );
				} ).toThrow(
					type  = "TestBox.AssertionFailed",
					regex = "Expected to not find a request that matched the callback parameters but did."
				);

				expect( function() {
					expect( hyper ).notToHaveSentRequest( function( req ) {
						return req.getUrl() == "https://google.com";
					} );
				} ).notToThrow();
			} );

			it( "can show the sent request count from when the client was faked", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake();

				expect( hyper.getFakeRequestCount() ).toBe( 0 );
				expect( function() {
					expect( hyper ).toHaveSentCount( 0 );
				} ).notToThrow( type = "TestBox.AssertionFailed" );
				expect( function() {
					expect( hyper ).toHaveSentCount( 1 );
				} ).toThrow( type = "TestBox.AssertionFailed" );

				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );

				expect( hyper.getFakeRequestCount() ).toBe( 1 );
				expect( function() {
					expect( hyper ).toHaveSentCount( 1 );
				} ).notToThrow( type = "TestBox.AssertionFailed" );
				expect( function() {
					expect( hyper ).toHaveSentCount( 0 );
				} ).toThrow( type = "TestBox.AssertionFailed" );

				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );

				expect( hyper.getFakeRequestCount() ).toBe( 2 );
				expect( function() {
					expect( hyper ).toHaveSentCount( 2 );
				} ).notToThrow( type = "TestBox.AssertionFailed" );

				var res = hyper.get( "https://google.com" );

				expect( hyper.getFakeRequestCount() ).toBe( 3 );
				expect( function() {
					expect( hyper ).toHaveSentCount( 3 );
				} ).notToThrow( type = "TestBox.AssertionFailed" );
			} );

			it( "can assert nothing was sent", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake();

				expect( function() {
					expect( hyper ).toHaveSentNothing();
				} ).notToThrow( type = "TestBox.AssertionFailed" );

				hyper.get( "https://google.com" );

				expect( function() {
					expect( hyper ).toHaveSentNothing();
				} ).toThrow( type = "TestBox.AssertionFailed" );
			} );

			it( "can clear all fake requests to make normal requests again", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper.fake();

				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );

				expect( res.getStatusCode() ).toBe( 200 );
				expect( res.getStatusText() ).toBe( "OK" );

				hyper.clearFakes();

				var res = hyper.get( "https://does-not-exist.also-does-not-exist" );

				expect( res.getStatusCode() ).toBe( 502 );
				expect( res.getStatusText() ).toBe( "Bad Gateway" );
			} );
		} );
	}

}
