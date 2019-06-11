provider "azuread"  {
    version = "~>0.3.0"
}

provider "azurerm" {
    version = "(any version)"
}

provider "random" {
    version = "~>2.1.0"
}

// create app service plan then create the app service
// we can also import the app service plan with..
// terraform import azurerm_app_service.instance1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Web/sites/instance1
// for a windows container we have below that..

resource "azurerm_app_service_plan" "plan3" {
  name                = "api-appserviceplan-pro"  // (required)
  location            = "${azurerm_resource_group.test.location}" // (required)
  resource_group_name = "${azurerm_resource_group.test.name}" // (required)
  kind                = "xenon" // (optional)
  is_xenon            = true

  sku {   // (required)
    tier = "PremiumContainer" // (required)
    size = "PC2" // (required)
    capacity = // (optional)
  }
}