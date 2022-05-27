component extends="testbox.system.BaseSpec" {

	function run() {
		describe( "HyperResponse", function() {
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
		} );
	}

}
