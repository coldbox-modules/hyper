component {

	function configure() {
		if ( listFirst( getController().getColdBoxSetting( "version" ), "." ) >= 8 ) {
			setMultiDomainDiscovery( false );
			setBaseUrl( composeRoutingUrl() & "index.cfm/" );
		} else {
			setFullRewrites( false );
		}

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
