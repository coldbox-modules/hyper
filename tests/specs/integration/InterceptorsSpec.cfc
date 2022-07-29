component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

	variables.localEndpoint = "http://#CGI[ "server_name" ]#:#CGI[ "server_port" ]#/tests/resources/app/index.cfm/api";

	function beforeAll() {
		super.beforeAll();
		// application.cbController = getController();
		getController().getInterceptorService().registerInterceptor( interceptorObject = this );
		variables.hyper = getInstance( "HyperBuilder@Hyper" );
	}

	function run() {
		describe( "interceptors", function() {
			beforeEach( function() {
				variables.onHyperRequestCalls  = [];
				variables.onHyperResponseCalls = [];
			} );

			it( "can run an interceptor onHyperRequest", function() {
				var res = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( variables.onHyperRequestCalls ).toHaveLength( 1 );
				var interceptorReq = variables.onHyperRequestCalls[ 1 ].request;
				expect( interceptorReq ).toBeInstanceOf( "HyperRequest" );
				expect( interceptorReq.getRequestID() ).toBe( res.getRequest().getRequestID() );
			} );

			it( "can influence the request before it is sent", function() {
				var res = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( variables.onHyperRequestCalls ).toHaveLength( 1 );
				var originalParams = res.getRequest().getQueryParams();
				expect( originalParams ).toBeArray();
				expect( originalParams ).toHaveLength( 1 );
				expect( originalParams[ 1 ].name ).toBe( "added_in_interceptor" );
				expect( originalParams[ 1 ].value ).toBe( true );
			} );

			it( "can run an interceptor onHyperResponse", function() {
				var res = hyper.get( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( variables.onHyperResponseCalls ).toHaveLength( 1 );
				var interceptorRes = variables.onHyperResponseCalls[ 1 ].response;
				expect( interceptorRes ).toBeInstanceOf( "HyperResponse" );
				expect( interceptorRes.getResponseID() ).toBe( res.getResponseID() );
			} );

			it( "calls onHyperResponse for each hop in a redirect", function() {
				var res = hyper.get( localEndpoint & "/redirect" );
				expect( variables.onHyperResponseCalls ).toHaveLength( 2 );
				var interceptorResA = variables.onHyperResponseCalls[ 1 ].response;
				expect( interceptorResA ).toBeInstanceOf( "HyperResponse" );
				var interceptorResB = variables.onHyperResponseCalls[ 2 ].response;
				expect( interceptorResB ).toBeInstanceOf( "HyperResponse" );
				expect( interceptorResB.getResponseID() ).toBe( res.getResponseID() );
			} );
		} );
	}

	function onHyperRequest( event, data ) {
		arguments.data.request.withQueryParams( { "added_in_interceptor" : "true" } );
		arrayAppend( variables.onHyperRequestCalls, arguments.data );
	}

	function onHyperResponse( event, data ) {
		arrayAppend( variables.onHyperResponseCalls, arguments.data );
	}

}
