component extends="testbox.system.BaseSpec" {

	function run() {
		describe( "HyperResponse", function() {
			it( "can serialize to a memento", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ).$( "getRequestID", createUUID() ),
					statusCode      = 200,
					executionTime   = 100,
					headers         = { "Content-Type" : "text/html; charset=utf-8" }
				);

				expect( res.getMemento() ).toBe( {
					"responseID"    : res.getResponseID(),
					"requestID"     : res.getRequestID(),
					"statusCode"    : res.getStatusCode(),
					"statusText"    : res.getStatusText(),
					"status"        : res.getStatus(),
					"data"          : res.getData(),
					"charset"       : res.getCharset(),
					"headers"       : res.getHeaders(),
					"timestamp"     : res.getTimestamp(),
					"executionTime" : res.getExecutionTime(),
					"cookies"       : res.getCookies()
				} );
			} );

			it( "can exclude keys from the memento", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ).$( "getRequestID", createUUID() ),
					statusCode      = 200,
					executionTime   = 100,
					headers         = { "Content-Type" : "text/html; charset=utf-8" }
				);

				var memento = res.getMemento( excludes = [ "cookies" ] );
				expect( memento ).notToHaveKey( "cookies" );
			} );

			it( "throws an exception when requesting json data but the data is not json", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ),
					charset         = "UTF-8",
					statusCode      = 200,
					headers         = { "status_code" : "200" },
					data            = "definitely not json",
					executionTime   = 100
				);
				expect( function() {
					var json = res.json();
				} ).toThrow( "DeserializeJsonException" );
			} );

			describe( "status code detection", function() {
				it( "can tell if a request is a success", function() {
					var res = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 200,
						statusText      = "OK",
						executionTime   = 100
					);
					expect( res.isSuccess() ).toBeTrue();
					expect( res.isRedirect() ).toBeFalse();
					expect( res.isError() ).toBeFalse();
					expect( res.isClientError() ).toBeFalse();
					expect( res.isServerError() ).toBeFalse();
				} );

				it( "can tell if a request is an OK response", function() {
					var resA = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 200,
						statusText      = "OK",
						executionTime   = 100
					);
					expect( resA.isOK() ).toBeTrue();

					var resB = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 204,
						executionTime   = 100
					);
					expect( resB.isOK() ).toBeFalse();
				} );

				it( "can tell if a request is a redirect", function() {
					var res = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 302,
						statusText      = "Found",
						executionTime   = 100
					);
					expect( res.isSuccess() ).toBeFalse();
					expect( res.isRedirect() ).toBeTrue();
					expect( res.isError() ).toBeFalse();
					expect( res.isClientError() ).toBeFalse();
					expect( res.isServerError() ).toBeFalse();
				} );

				it( "can tell if a request is a client error", function() {
					var res = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 422,
						statusText      = "Unprocessable Entity",
						executionTime   = 100
					);
					expect( res.isSuccess() ).toBeFalse();
					expect( res.isRedirect() ).toBeFalse();
					expect( res.isError() ).toBeTrue();
					expect( res.isClientError() ).toBeTrue();
					expect( res.isServerError() ).toBeFalse();
				} );

				it( "can tell if a request is an unauthorized error", function() {
					var resA = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 401,
						statusText      = "Unauthorized",
						executionTime   = 100
					);
					expect( resA.isUnauthorized() ).toBeTrue();

					var resB = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 400,
						executionTime   = 100
					);
					expect( resB.isUnauthorized() ).toBeFalse();
				} );

				it( "can tell if a request is a forbidden error", function() {
					var resA = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 403,
						statusText      = "Forbidden",
						executionTime   = 100
					);
					expect( resA.isForbidden() ).toBeTrue();

					var resB = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 400,
						executionTime   = 100
					);
					expect( resB.isForbidden() ).toBeFalse();
				} );

				it( "can tell if a request is a not found error", function() {
					var resA = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 404,
						statusText      = "Not Found",
						executionTime   = 100
					);
					expect( resA.isNotFound() ).toBeTrue();

					var resB = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 401,
						executionTime   = 100
					);
					expect( resB.isNotFound() ).toBeFalse();
				} );

				it( "can tell if a request is a server error", function() {
					var res = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 500,
						statusText      = "Internal Server Error",
						executionTime   = 100
					);
					expect( res.isSuccess() ).toBeFalse();
					expect( res.isRedirect() ).toBeFalse();
					expect( res.isError() ).toBeTrue();
					expect( res.isClientError() ).toBeFalse();
					expect( res.isServerError() ).toBeTrue();
				} );

				it( "can accept a customer status text", function() {
					var res = new Hyper.models.HyperResponse(
						originalRequest = createStub( extends = "models.HyperRequest" ),
						statusCode      = 500,
						statusText      = "Boom",
						executionTime   = 100
					);
					expect( res.getStatusCode() ).toBe( 500 );
					expect( res.getStatusText() ).toBe( "Boom" );
					expect( res.getStatus() ).toBe( "500 Boom" );
				} );
			} );

			it( "can check if a response header exists", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ),
					statusCode      = 200,
					executionTime   = 100,
					headers         = { "Content-Type" : "text/html; charset=utf-8" }
				);
				expect( res.hasHeader( "Etag" ) ).toBeFalse();
				expect( res.hasHeader( "Content-Type" ) ).toBeTrue();
			} );

			it( "can get the value of a response header", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ),
					statusCode      = 200,
					executionTime   = 100,
					headers         = { "Content-Type" : "text/html; charset=utf-8" }
				);
				expect( res.getHeader( "Content-Type" ) ).toBe( "text/html; charset=utf-8" );
			} );

			it( "can provide a default value for a response header", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ),
					statusCode      = 200,
					executionTime   = 100,
					headers         = {}
				);
				expect( res.getHeader( "Content-Type", "text/html; charset=utf-8" ) ).toBe( "text/html; charset=utf-8" );
			} );

			it( "can get the returned cookies as a struct", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ),
					statusCode      = 200,
					executionTime   = 100,
					headers         = {
						"Set-Cookie" : [
							"foo=bar;path=/;secure;samesite=none;httponly",
							"baz=qux;path=/;expires=Mon, 31 Dec 2038 23:59:59 GMT",
							"one=two;max-age=2592000;domain=example.com"
						]
					}
				);
				expect( res.getCookies() ).toBe( {
					"foo" : {
						"value"    : "bar",
						"path"     : "/",
						"secure"   : true,
						"samesite" : "none",
						"httponly" : true
					},
					"baz" : {
						"value"   : "qux",
						"path"    : "/",
						"expires" : "Mon, 31 Dec 2038 23:59:59 GMT"
					},
					"one" : {
						"value"   : "two",
						"domain"  : "example.com",
						"expires" : 2592000 / 60 / 60 / 24 // seconds to days
					}
				} );
			} );

			it( "can save cookies to the cookie scope", function() {
				var res = new Hyper.models.HyperResponse(
					originalRequest = createStub( extends = "models.HyperRequest" ),
					statusCode      = 200,
					executionTime   = 100,
					headers         = {
						"Set-Cookie" : [
							"foo=bar;path=/;secure;samesite=none;httponly",
							"baz=qux;path=/;expires=Mon, 31 Dec 2038 23:59:59 GMT",
							"one=two;max-age=2592000;domain=example.com"
						]
					}
				);
				for ( var key in cookie ) {
					cfcookie(
						name    = key,
						value   = "",
						expires = "now"
					);
				}
				expect( cookie ).notToHaveKey( "foo" );
				expect( cookie ).notToHaveKey( "baz" );
				expect( cookie ).notToHaveKey( "one" );

				res.persistCookies();

				expect( cookie ).toHaveKey( "foo" );
				expect( cookie.foo ).toBe( "bar" );
				expect( cookie ).toHaveKey( "baz" );
				expect( cookie.baz ).toBe( "qux" );
				expect( cookie ).toHaveKey( "one" );
				expect( cookie.one ).toBe( "two" );
			} );
		} );
	}

}
