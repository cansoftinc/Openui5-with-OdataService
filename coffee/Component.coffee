jQuery.sap.declare "com.mitsuruog.openui5.odata.Component"

sap.ui.core.UIComponent.extend "com.mitsuruog.openui5.odata.Component",
  metadata: 
    routing:
      config:
        viewType: "JS"
        viewPath: "view"
        targetControl: "appConteiner"
        clearTarget: false
        transition: "slide"
        targetAggregation: "pages"
      routes: [{
        pattern: ""
        name: "Master"
        view: "Master"
      }, {
        pattern: "product/{id}"
        name: "Detail"
        view: "Detail"
      }, {
        pattern: ":all*:"
        name: "NotFound"
        view: "NotFound"
      }]

  init: ->
    jQuery.sap.require "sap.m.routing.RouteMatchedHandler"

    # call overriden init.
    sap.ui.core.UIComponent.prototype.init.apply @, arguments

    # set custom behavior to the router.
    router = @getRouter()

    # initialize the router
    @routeHandler = new sap.m.routing.RouteMatchedHandler router
    router.initialize()

    # ここにOdataServiceのエンドポイントを設定します
    # /V2/Northwind/Northwind.svc/
    endpoint = sap.ui.model.odata.ODataModel "/V2/Northwind/Northwind.svc/", true
    @setModel endpoint

    # バックエンドにデータ問い合わせの際のローディングイメージを表示します。
    busy = new sap.m.BusyDialog
      title: "Loading data"
    endpoint.attachRequestSent ->　busy.open()
    endpoint.attachRequestCompleted ->　busy.close()

  destroy: ->
    if @routeHandler
      @routeHandler.destroy()
    # call overriden destroy.
    sap.ui.core.UIComponent.prototype.destroy.apply @, arguments

  createContent: ->
    # create root view.
    view = sap.ui.view
      id: "app"
      viewName: "view.App"
      type: "JS"
      viewData: 
        component: @

    view