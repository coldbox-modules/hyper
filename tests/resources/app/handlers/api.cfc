component {

	function index( event, rc, prc ) {
		return event.renderData( type = "json", data = { "message" : "Hello, world!" } );
	}

	function redirect( event, rc, prc ) {
		param rc.times = 0;
		if ( rc.times == 0 ) {
			relocate( "api.index" );
		} else {
			relocate( event = "api.redirect", queryString = "times=#rc.times - 1#" );
		}
	}

	function redirectPartial( event, rc, prc ) {
		relocate( url = "/tests/resources/app/index.cfm/api/index" );
	}

	function create( event, rc, prc ) {
		var data    = { "id" : 101 };
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
			type       = "json",
			statusCode = 201,
			data       = data
		);
	}

	function photos( event, rc, prc ) {
		if ( !event.valueExists( "smallPhoto" ) ) {
			return event.renderData(
				type       = "text",
				statusCode = 422,
				data       = "A `smallPhoto` is required."
			);
		}

		if ( !event.valueExists( "largePhoto" ) ) {
			return event.renderData(
				type       = "text",
				statusCode = 422,
				data       = "A `largePhoto` is required."
			);
		}

		var smallPhoto = fileUpload(
			getTempDirectory(),
			"smallPhoto",
			"*",
			"overwrite"
		);

		var largePhoto = fileUpload(
			getTempDirectory(),
			"largePhoto",
			"*",
			"overwrite"
		);

		return event.renderData(
			type       = "json",
			statusCode = 201,
			data       = {
				"id"          : 777,
				"smallPhoto"  : smallPhoto.serverFile,
				"largePhoto"  : largePhoto.serverFile,
				"description" : rc.description
			}
		);
	}

}
