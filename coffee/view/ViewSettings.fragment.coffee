sap.ui.jsfragment "view.ViewSettings",

  createContent: (oController) ->
    new sap.m.ViewSettingsDialog
      title: "ソート&フィルタ"
      confirm: [oController.onChangeViewSettings, oController]
      # ここにソート条件を書きます
      sortItems: [
        new sap.m.ViewSettingsItem
          text: "ProductName"
          key: "ProductName"
          selected: true
        new sap.m.ViewSettingsItem
          text: "Category"
          key: "Category/CategoryName"
        new sap.m.ViewSettingsItem
          text: "Supplier"
          key: "Supplier/CompanyName"
        new sap.m.ViewSettingsItem
          text: "Order"
          key: "UnitsOnOrder"
        new sap.m.ViewSettingsItem
          text: "Stock"
          key: "UnitsInStock"
        new sap.m.ViewSettingsItem
          text: "Price"
          key: "UnitPrice"
      ]
      # ここにフィルタ条件を書きます
      filterItems: [
        new sap.m.ViewSettingsFilterItem
          text: "Order"
          key: "UnitsOnOrder"
          multiSelect: false
          items: [
            new sap.m.ViewSettingsItem
              text: "less than 10"
              key: "UnitsOnOrder___LE___10___X"
            new sap.m.ViewSettingsItem
              text: "between 10 and 20"
              key: "UnitsOnOrder___BT___10___20"
            new sap.m.ViewSettingsItem
              text: "greater than 20"
              key: "UnitsOnOrder___GT___20___X"
          ]
        new sap.m.ViewSettingsFilterItem
          text: "Stock"
          key: "UnitsInStock"
          multiSelect: false
          items: [
            new sap.m.ViewSettingsItem
              text: "less than 10"
              key: "UnitsInStock___LE___10___X"
            new sap.m.ViewSettingsItem
              text: "between 10 and 20"
              key: "UnitsInStock___BT___10___20"
            new sap.m.ViewSettingsItem
              text: "greater than 20"
              key: "UnitsInStock___GT___20___X"
          ]
      ]