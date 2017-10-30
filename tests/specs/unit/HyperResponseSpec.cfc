component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "HyperResponse", function() {
            it( "throws an exception when requesting json data but the data is not json", function() {
                var res = new Hyper.models.HyperResponse( createStub(), {
                    "charset" = "UTF-8",
                    "responseheader" = {
                        "status_code" = "200"
                    },
                    "filecontent" = "definitely not json"
                } );
                expect( function() {
                    var json = res.json();
                } ).toThrow( "DeserializeJsonException" );
            } );

            describe( "status code detection", function() {
                it( "can tell if a request is a success", function() {
                    var res = new Hyper.models.HyperResponse( createStub(), {
                        "charset" = "UTF-8",
                        "responseheader" = {
                            "status_code" = "200"
                        },
                        "filecontent" = ""
                    } );
                    expect( res.isSuccess() ).toBeTrue();
                    expect( res.isRedirect() ).toBeFalse();
                    expect( res.isError() ).toBeFalse();
                    expect( res.isClientError() ).toBeFalse();
                    expect( res.isServerError() ).toBeFalse();
                } );

                it( "can tell if a request is a redirect", function() {
                    var res = new Hyper.models.HyperResponse( createStub(), {
                        "charset" = "UTF-8",
                        "responseheader" = {
                            "status_code" = "302"
                        },
                        "filecontent" = ""
                    } );
                    expect( res.isSuccess() ).toBeFalse();
                    expect( res.isRedirect() ).toBeTrue();
                    expect( res.isError() ).toBeFalse();
                    expect( res.isClientError() ).toBeFalse();
                    expect( res.isServerError() ).toBeFalse();
                } );

                it( "can tell if a request is a client error", function() {
                    var res = new Hyper.models.HyperResponse( createStub(), {
                        "charset" = "UTF-8",
                        "responseheader" = {
                            "status_code" = "422"
                        },
                        "filecontent" = ""
                    } );
                    expect( res.isSuccess() ).toBeFalse();
                    expect( res.isRedirect() ).toBeFalse();
                    expect( res.isError() ).toBeTrue();
                    expect( res.isClientError() ).toBeTrue();
                    expect( res.isServerError() ).toBeFalse();
                } );

                it( "can tell if a request is a server error", function() {
                    var res = new Hyper.models.HyperResponse( createStub(), {
                        "charset" = "UTF-8",
                        "responseheader" = {
                            "status_code" = "500"
                        },
                        "filecontent" = ""
                    } );
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
