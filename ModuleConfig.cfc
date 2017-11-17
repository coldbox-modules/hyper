component {

    this.name = "hyper";
    this.author = "";
    this.webUrl = "https://github.com/elpete/hyper";
    this.autoMapModels = false;
    this.cfmapping = "hyper";

    function configure() {
        binder.map( "HyperBuilder@hyper" )
            .to( "#moduleMapping#.models.HyperBuilder" )
            .asSingleton();

        binder.map( "HyperRequest@hyper" )
            .to( "#moduleMapping#.models.HyperRequest" );

        binder.map( "HyperResponse@hyper" )
            .to( "#moduleMapping#.models.HyperResponse" );
    }
}
