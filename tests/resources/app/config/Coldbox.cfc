component {

	// Configure ColdBox Application
	function configure() {
		// coldbox directives
		coldbox = {
			// Application Setup
			appName                  : "Your app name here",
			eventName                : "event",
			// Development Settings
			reinitPassword           : "",
			handlersIndexAutoReload  : true,
			// Implicit Events
			defaultEvent             : "",
			requestStartHandler      : "Main.onRequestStart",
			requestEndHandler        : "",
			applicationStartHandler  : "Main.onAppInit",
			applicationEndHandler    : "",
			sessionStartHandler      : "",
			sessionEndHandler        : "",
			missingTemplateHandler   : "",
			// Extension Points
			applicationHelper        : "includes/helpers/ApplicationHelper.cfm",
			viewsHelper              : "",
			modulesExternalLocation  : [ "modules_app" ],
			viewsExternalLocation    : "",
			layoutsExternalLocation  : "",
			handlersExternalLocation : "",
			requestContextDecorator  : "",
			controllerDecorator      : "",
			// Error/Exception Handling
			invalidHTTPMethodHandler : "",
			exceptionHandler         : "main.onException",
			onInvalidEvent           : "",
			customErrorTemplate      : "",
			// Application Aspects
			handlerCaching           : false,
			eventCaching             : false,
			viewCaching              : false,
			customErrorTemplate      : "/coldbox/system/exceptions/BugReport.cfm"
		};

		// custom settings
		settings = {};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = { development : "localhost,^127\.0\.0\.1" };

		// Module Directives
		modules = {
			// Turn to false in production
			autoReload : false,
			// An array of modules names to load, empty means all of them
			include    : [],
			// An array of modules names to NOT load, empty means none
			exclude    : []
		};

		// LogBox DSL
		logBox = {
			// Define Appenders
			appenders : { coldboxTracer : { class : "coldbox.system.logging.appenders.ConsoleAppender" } },
			// Root Logger
			root      : { levelmax : "INFO", appenders : "*" },
			// Implicit Level Categories
			info      : [ "coldbox.system" ]
		};

		// Layout Settings
		layoutSettings = { defaultLayout : "", defaultView : "" };

		// Interceptor Settings
		interceptorSettings = {
			throwOnInvalidStates     : false,
			customInterceptionPoints : ""
		};

		// Register interceptors as an array, we need order
		interceptors = [];
	}

	/**
	 * Development environment
	 */
	function development() {
		coldbox.customErrorTemplate = "/coldbox/system/exceptions/BugReport.cfm";
	}

}
