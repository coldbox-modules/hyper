component {

    this.name = "ColdBoxTestingSuite" & hash(getCurrentTemplatePath());
    this.sessionManagement  = true;
    this.setClientCookies   = true;
    this.sessionTimeout     = createTimeSpan( 0, 0, 15, 0 );
    this.applicationTimeout = createTimeSpan( 0, 0, 15, 0 );

    testsPath = getDirectoryFromPath( getCurrentTemplatePath() );
    this.mappings[ "/tests" ] = testsPath;
    rootPath = REReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
    this.mappings[ "/root" ] = rootPath;
    this.mappings[ "/hyper" ] = rootPath;
    this.mappings[ "/globber" ] = rootPath & "modules/globber";
    testingModuleRootMapping = listDeleteAt( rootPath, listLen( rootPath, '\/' ), "\/" );
    if ( left( testingModuleRootMapping, 1 ) != "/" ) {
        testingModuleRootMapping = "/" & testingModuleRootMapping;
    }
    this.mappings[ "/testingModuleRoot" ] = testingModuleRootMapping;
    this.mappings[ "/app" ] = testsPath & "resources/app";
    this.mappings[ "/coldbox" ] = testsPath & "resources/app/coldbox";
    this.mappings[ "/testbox" ] = rootPath & "/testbox";

    // function onRequestStart() {
    //     applicationStop();
    //     abort;
    // }

}
