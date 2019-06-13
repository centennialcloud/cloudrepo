provider "azurerm" {
    version = "=1.28.0"
}

resource "azurerm_resource_group" "test" {
  name = "${var.rg-name}"
  location = "southcentralus"
}

resource "azurerm_monitor_action_group" "test" {
  name = "CriticalActionAlert"
  resource_group_name = "${azurerm_resource_group.test.name}"
  short_name = "cloudalerts"

  email_receiver {
    name = "cloudadmin"
    email_address = "${var.email}"
    }
}
