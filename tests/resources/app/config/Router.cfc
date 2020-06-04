component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( false );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
