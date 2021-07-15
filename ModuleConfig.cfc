component {

	this.name      = "hyper";
	this.author    = "";
	this.webUrl    = "https://github.com/elpete/hyper";
	this.cfmapping = "hyper";

	function configure() {
		interceptorSettings = { "customInterceptionPoints" : [ "onHyperRequest", "onHyperResponse" ] };
	}

}
