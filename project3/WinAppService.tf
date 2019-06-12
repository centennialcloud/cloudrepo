provider "azuread"  {
    version = "~>0.3.0"
}

provider "azurerm" {
  version = "=1.28.0"
}

provider "random" {
    version = "~>2.1.0"
}



resource "azurerm_resource_group" "main" {
    name = "${var.resource-group-name}"
    location = "${var.location-name}"
 }


resource "azurerm_app_service_plan" "main" {
  name                = "${var.WinAppPlan}"  // (required)
  location            = "${azurerm_resource_group.main.location}" // (required)
  resource_group_name = "${azurerm_resource_group.main.name}" // (required)

  sku {   // (required)
    tier = "Standard" // (required)
    size = "S1" // (required)
  }
}
resource "azurerm_app_service" "main" {
  name                = "${var.WinAppService}" // (required)
  location            = "${azurerm_resource_group.main.location}" // (required)
  resource_group_name = "${azurerm_resource_group.main.name}" // (required)
  app_service_plan_id = "${azurerm_app_service_plan.main.id}" // (required)

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
