
provider "azurerm" {
  version = "=1.28.0"
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
    windows_fx_version = "${var.application-setting[var.application-setting-str]}"

  }
  }


