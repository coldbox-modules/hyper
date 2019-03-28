component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "HyperResponse", function() {
            it( "throws an exception when requesting json data but the data is not json", function() {
                var res = new Hyper.models.HyperResponse(
                    originalRequest = createStub( extends = "models.HyperRequest" ),
                    charset = "UTF-8",
                    statusCode = 200,
                    headers = {
                        "status_code" = "200"
                    },
                    data = "definitely not json"
                );
                expect( function() {
                    var json = res.json();
                } ).toThrow( "DeserializeJsonException" );
            } );

            describe( "status code detection", function() {
                it( "can tell if a request is a success", function() {
                    var res = new Hyper.models.HyperResponse(
                        originalRequest = createStub( extends = "models.HyperRequest" ),
                        statusCode = 200
                    );
                    expect( res.isSuccess() ).toBeTrue();
                    expect( res.isRedirect() ).toBeFalse();
                    expect( res.isError() ).toBeFalse();
                    expect( res.isClientError() ).toBeFalse();
                    expect( res.isServerError() ).toBeFalse();
                } );

                it( "can tell if a request is a redirect", function() {
                    var res = new Hyper.models.HyperResponse(
                        originalRequest = createStub( extends = "models.HyperRequest" ),
                        statusCode = 302
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
                        statusCode = 422
                    );
                    expect( res.isSuccess() ).toBeFalse();
                    expect( res.isRedirect() ).toBeFalse();
                    expect( res.isError() ).toBeTrue();
                    expect( res.isClientError() ).toBeTrue();
                    expect( res.isServerError() ).toBeFalse();
                } );

                it( "can tell if a request is a server error", function() {
                    var res = new Hyper.models.HyperResponse(
                        originalRequest = createStub( extends = "models.HyperRequest" ),
                        statusCode = 500
                    );
                    expect( res.isSuccess() ).toBeFalse();
                    expect( res.isRedirect() ).toBeFalse();
                    expect( res.isError() ).toBeTrue();
                    expect( res.isClientError() ).toBeFalse();
                    expect( res.isServerError() ).toBeTrue();
                } );
            } );
        } );
    }

}
