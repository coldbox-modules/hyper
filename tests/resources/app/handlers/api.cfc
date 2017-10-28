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
            setNextEvent( "api.index" );
        }
        else {
            setNextEvent( event = "api.redirect", queryString = "times=#rc.times-1#" );
        }

    }

}
