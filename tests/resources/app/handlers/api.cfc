component {

    function index( event, rc, prc ) {
        return event.renderData(
            type = "json",
            data = {
                "message" = "Hello, world!"
            }
        );
    }

    function redirect( event, rc, prc ) {
        param rc.times = 0;
        if ( rc.times == 0 ) {
            relocate( "api.index" );
        }
        else {
            relocate( event = "api.redirect", queryString = "times=#rc.times-1#" );
        }
    }

    function redirectPartial( event, rc, prc ) {
        relocate( url = "/tests/resources/app/index.cfm/api/index" );
    }

    function create( event, rc, prc ) {
        var data = { "id" = 101 };
        var content = event.getHTTPContent();
        if ( isJSON( content ) ) {
            structAppend( data, deserializeJSON( content ) );
        }
        if ( event.valueExists( "fieldNames" ) ) {
            for ( var field in listToArray( rc.fieldNames ) ) {
                data[ field ] = rc[ field ];
            }
        }
        return event.renderData(
            type = "json",
            statusCode = 201,
            data = data
        );
    }

}
