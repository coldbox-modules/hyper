component {

	function configure() {
		setMultiDomainDiscovery( false );
		setBaseUrl( composeRoutingUrl() & "index.cfm/" );
		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
