provider "azuread"  {
    version = "~>0.3.0"
}

provider "azurerm" {
  version = "=1.28.0"
}

provider "random" {
    version = "~>2.1.0"
}

// create app service plan then create the app service
// we can also import the app service plan with..
// terraform import azurerm_app_service.instance1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Web/sites/instance1
// for a windows container we have below that..

resource "azurerm_resource_group" "main" {
    name = "${var.resource-group-name}"
    location = "${var.location-name}"
 }


resource "azurerm_app_service_plan" "WinAppPlan" {
  name                = "${var.WinAppPlan}"  // (required)
  location            = "${azurerm_resource_group.main.location}" // (required)
  resource_group_name = "${azurerm_resource_group.main.name}" // (required)

  sku {   // (required)
    tier = "Standard" // (required)
    size = "S1" // (required)
  }
}
resource "azurerm_app_service" "WinAppService" {
  name                = "${var.WinAppService}" // (required)
  location            = "${azurerm_resource_group.main.location}" // (required)
  resource_group_name = "${azurerm_resource_group.main.name}" // (required)
  app_service_plan_id = "${azurerm_app_service_plan.WinAppPlan.id}" // (required)

  site_config {
    windows_version = "${var.application-setting[var.application-setting-str]}"
    dotnet_framework_version = "dotFrameWork"
 //   scm_type                 = "LocalGit"
  }
  }

#   connection_string { // (optional)
#     name  = "${Database}" // (required)
#     type  = "${SQLServer}" // (required)
#     value = "Server=some-server.mydomain.com;Integrated Security=SSPI" // (required)
#   }
# }
