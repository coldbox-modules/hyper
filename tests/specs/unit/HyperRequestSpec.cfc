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

			it( "can serialize to a memento", function() {
				expect( variables.req.getMemento() ).toBe( {
					"requestID"           : variables.req.getRequestID(),
					"baseUrl"             : variables.req.getBaseUrl(),
					"url"                 : variables.req.getUrl(),
					"fullUrl"             : variables.req.getFullUrl(),
					"method"              : variables.req.getMethod(),
					"queryParams"         : variables.req.getQueryParams(),
					"headers"             : variables.req.getHeaders(),
					"cookies"             : variables.req.getCookies(),
					"files"               : variables.req.getFiles(),
					"bodyFormat"          : variables.req.getBodyFormat(),
					"body"                : variables.req.getBody(),
					"referrerId"          : "",
					"throwOnError"        : variables.req.getThrowOnError(),
					"timeout"             : variables.req.getTimeout(),
					"maximumRedirects"    : variables.req.getMaximumRedirects(),
					"authType"            : variables.req.getAuthType(),
					"username"            : variables.req.getUsername(),
					"password"            : variables.req.getPassword(),
					"clientCert"          : "",
					"clientCertPassword"  : "",
					"domain"              : variables.req.getDomain(),
					"workstation"         : variables.req.getWorkstation(),
					"resolveUrls"         : variables.req.getResolveUrls(),
					"encodeUrl"           : variables.req.getEncodeUrl(),
					"retries"             : variables.req.getRetries(),
					"currentRequestCount" : variables.req.getCurrentRequestCount()
				} );
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

			it( "can set multiple cookies at once", function() {
				expect( req.getCookie( "foo" ) ).toBe( "" );
				expect( req.getCookie( "baz" ) ).toBe( "" );
				req.withCookies( { "foo" : "bar", "baz" : "qux" } );
				expect( req.getCookie( "foo" ) ).toBe( "bar" );
				expect( req.getCookie( "baz" ) ).toBe( "qux" );
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

			it( "can set the client certificate path", function() {
				expect( req.getClientCert() ).toBeNull();
				req.withCertificateAuth( "/some/absolute/path" );
				expect( req.getClientCert() ).toBe( "/some/absolute/path" );
			} );

			it( "can include a password when setting the certificate authentication", function() {
				expect( req.getClientCert() ).toBeNull();
				expect( req.getClientCertPassword() ).toBeNull();
				req.withCertificateAuth( "/some/absolute/path", "mypassword" );
				expect( req.getClientCert() ).toBe( "/some/absolute/path" );
				expect( req.getClientCertPassword() ).toBe( "mypassword" );
			} );

			it( "can define onRequest callback hooks", function() {
				var method  = "not set yet";
				var headers = {};
				req.setRequestCallbacks( [
					function( req ) {
						method = req.getMethod();
					}
				] );
				req.withRequestCallback( function( req ) {
					headers = req.getHeaders();
				} );

				req.withHeaders( { "Accept" : "application/xml" } )
					.asJSON()
					.patch( "https://jsonplaceholder.typicode.com/posts/1" );
				expect( method ).toBe( "PATCH" );
				expect( headers ).toBe( {
					"Accept"       : "application/xml",
					"Content-Type" : "application/json",
					"User-Agent"   : "HyperCFML/#req.getHyperVersion()#"
				} );
			} );

			it( "can define onResponse callback hooks", function() {
				var responseId = "not set yet";
				var statusCode = 0;
				req.setResponseCallbacks( [
					function( res ) {
						responseId = res.getResponseId();
					}
				] );
				req.withResponseCallback( function( res ) {
					statusCode = res.getStatusCode();
				} );

				var res = req.post(
					"https://jsonplaceholder.typicode.com/posts",
					{
						title  : "New title",
						body   : "New body",
						userId : 1
					}
				);
				expect( responseId ).notToBe( "not set yet" );
				expect( responseId ).toBe( res.getResponseId() );
				expect( statusCode ).toBe( 201 );
			} );

			it( "can forward on headers if they exist", function() {
				expect( req.hasHeader( "X-Requested-With" ) ).toBeFalse();
				expect( req.hasHeader( "X-Forwarded-For" ) ).toBeFalse();
				req.forwardHeaders(
					[
						"X-Forwarded-For",
						"X-Requested-With"
					],
					{ "X-Forwarded-For" : "1.1.1.1" }
				);
				expect( req.hasHeader( "X-Requested-With" ) ).toBeFalse();
				expect( req.hasHeader( "X-Forwarded-For" ) ).toBeTrue();
				expect( req.getHeader( "X-Forwarded-For" ) ).toBe( "1.1.1.1" );
			} );

			it( "can handle a JSON body format with a body as a string", function() {
				req.setBodyFormat( "json" );
				req.setBody( '{"query":{},"size":0,"from":0}' );
				expect( req.prepareBody() ).toBe( '{"query":{},"size":0,"from":0}' );
			} );

			it( "can handle a JSON body format with a body as an struct", function() {
				req.setBodyFormat( "json" );
				req.setBody( { "query" : {}, "size" : 0, "from" : 0 } );
				expect( req.prepareBody() ).toBe( '{"query":{},"size":0,"from":0}' );
			} );

			it( "defaults to no Content-Type", function() {
				expect( req.getHeader( "Content-Type" ) ).toBeEmpty();
			} );

			it( "defaults to the Hyper User-Agent", () => {
				expect( req.getHeader( "User-Agent" ) ).toBe( "HyperCFML/#req.getHyperVersion()#" );
			} );
		} );
	}

}
