component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	function beforeAll() {
		super.beforeAll();
		addMatchers( "hyper.models.TestBoxMatchers" );
	}

	function run() {
		describe( "retry requests", () => {
			it( "can retry requests", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper
					.fake( {
						"https://needs-retry.dev/" : function( createFakeResponse ) {
							return [
								createFakeResponse( 500, "Internal Server Error" ),
								createFakeResponse( 200, "OK" )
							];
						}
					} )
					.preventStrayRequests();

				var retryDelays          = [];
				var onHyperRequestCalls  = [];
				var onHyperResponseCalls = [];

				var res = hyper
					.retry( 3, 100 )
					.withRequestCallback( ( req ) => retryDelays.append( req.getRetries()[ req.getCurrentRequestCount() ] ) )
					.withRequestCallback( ( req ) => onHyperRequestCalls.append( req.getMemento() ) )
					.withResponseCallback( ( res ) => onHyperResponseCalls.append( res.getMemento() ) )
					.get( "https://needs-retry.dev/" );

				expect( res.getStatusCode() ).toBe( 200 );
				expect( res.getStatusText() ).toBe( "OK" );

				expect( retryDelays ).toBe( [ 100, 100 ] );
				expect( onHyperRequestCalls ).toHaveLength( 2 );
				expect( onHyperResponseCalls ).toHaveLength( 2 );
			} );

			it( "can provide a custom array of retry delays", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper
					.fake( {
						"https://needs-retry.dev/" : function( createFakeResponse ) {
							return [
								createFakeResponse( 500, "Internal Server Error" ),
								createFakeResponse( 500, "Internal Server Error" ),
								createFakeResponse( 200, "OK" )
							];
						}
					} )
					.preventStrayRequests();

				var retryDelays          = [];
				var onHyperRequestCalls  = [];
				var onHyperResponseCalls = [];

				var res = hyper
					.retry( [ 100, 200, 300 ] )
					.withRequestCallback( ( req ) => retryDelays.append( req.getRetries()[ req.getCurrentRequestCount() ] ) )
					.withRequestCallback( ( req ) => onHyperRequestCalls.append( req.getMemento() ) )
					.withResponseCallback( ( res ) => onHyperResponseCalls.append( res.getMemento() ) )
					.get( "https://needs-retry.dev/" );

				expect( res.getStatusCode() ).toBe( 200 );
				expect( res.getStatusText() ).toBe( "OK" );

				expect( retryDelays ).toBe( [ 100, 200, 300 ] );
				expect( onHyperRequestCalls ).toHaveLength( 3 );
				expect( onHyperResponseCalls ).toHaveLength( 3 );
			} );

			it( "can provide a predicate function to determine if a request should be retried", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper
					.fake( {
						"https://needs-retry.dev/" : function( createFakeResponse ) {
							return [
								createFakeResponse( 500, "Internal Server Error" ),
								createFakeResponse( 429, "Too Many Requests" ),
								createFakeResponse( 200, "OK" )
							];
						}
					} )
					.preventStrayRequests();

				var onHyperRequestCalls  = [];
				var onHyperResponseCalls = [];

				var res = hyper
					.retry(
						3,
						100,
						function( res, req ) {
							return res.isServerError();
						}
					)
					.withRequestCallback( ( req ) => onHyperRequestCalls.append( req.getMemento() ) )
					.withResponseCallback( ( res ) => onHyperResponseCalls.append( res.getMemento() ) )
					.get( "https://needs-retry.dev/" );

				expect( res.getStatusCode() ).toBe( 429 );
				expect( res.getStatusText() ).toBe( "Too Many Requests" );

				expect( onHyperRequestCalls ).toHaveLength( 2 );
				expect( onHyperResponseCalls ).toHaveLength( 2 );
			} );

			it( "can modify the next request from the predicate function", () => {
				var hyper = new hyper.models.HyperBuilder();
				hyper
					.fake( {
						"https://needs-retry.dev/failure" : function( createFakeResponse ) {
							return createFakeResponse( 500, "Internal Server Error" );
						},
						"https://needs-retry.dev/success" : function( createFakeResponse ) {
							return createFakeResponse( 200, "OK" );
						}
					} )
					.preventStrayRequests();

				var onHyperRequestCalls  = [];
				var onHyperResponseCalls = [];

				var res = hyper
					.setBaseUrl( "https://needs-retry.dev" )
					.retry(
						3,
						100,
						function( res, req ) {
							req.setUrl( "/success" );
							return res.isError();
						}
					)
					.withRequestCallback( ( req ) => onHyperRequestCalls.append( req.getMemento() ) )
					.withResponseCallback( ( res ) => onHyperResponseCalls.append( res.getMemento() ) )
					.get( "/failure" );

				expect( res.getStatusCode() ).toBe( 200 );
				expect( res.getStatusText() ).toBe( "OK" );

				expect( onHyperRequestCalls ).toHaveLength( 2 );
				expect( onHyperResponseCalls ).toHaveLength( 2 );
			} );
		} );
	}

}
