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
        } );
    }

}
