component extends="coldbox.system.testing.BaseTestCase" {

	this.unloadColdBox = true;

	function beforeAll() {
		super.beforeAll();

		getController().getModuleService().registerAndActivateModule( "hyper", "testingModuleRoot" );
	}

	/**
	 * @beforeEach
	 */
	function setupIntegrationTest() {
		setup();
	}

	private boolean function isBoxLang() {
		return isDefined( "server" ) && structKeyExists( server, "boxlang" );
	}

}
