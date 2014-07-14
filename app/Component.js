(function() {
  jQuery.sap.declare("com.mitsuruog.openui5.odata.Component");

  sap.ui.core.UIComponent.extend("com.mitsuruog.openui5.odata.Component", {
    metadata: {
      routing: {
        config: {
          viewType: "JS",
          viewPath: "view",
          targetControl: "appConteiner",
          clearTarget: false,
          transition: "slide",
          targetAggregation: "pages"
        },
        routes: [
          {
            pattern: "",
            name: "Master",
            view: "Master"
          }, {
            pattern: "product/{id}",
            name: "Detail",
            view: "Detail"
          }, {
            pattern: ":all*:",
            name: "NotFound",
            view: "NotFound"
          }
        ]
      }
    },
    init: function() {
      var router;
      jQuery.sap.require("sap.m.routing.RouteMatchedHandler");
      sap.ui.core.UIComponent.prototype.init.apply(this, arguments);
      router = this.getRouter();
      this.routeHandler = new sap.m.routing.RouteMatchedHandler(router);
      return router.initialize();
    },
    destroy: function() {
      if (this.routeHandler) {
        this.routeHandler.destroy();
      }
      return sap.ui.core.UIComponent.prototype.destroy.apply(this, arguments);
    },
    createContent: function() {
      var view;
      view = sap.ui.view({
        id: "app",
        viewName: "view.App",
        type: "JS",
        viewData: {
          component: this
        }
      });
      return view;
    }
  });

}).call(this);
