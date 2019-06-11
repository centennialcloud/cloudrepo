provider "azurerm" {
     version = "=1.28.0"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.resource-group-name}"
  location = "${var.location-name}"
}

resource "azurerm_storage_account" "saccount" {
    name    = "${var.storage-account-name}"
    location = "${var.location-name}"
    account_tier = "Standard"
    account_replication_type = "LRS"
}
resource "azurerm_storage_container" "container" {
  name                  = "${var.container-name}"
  resource_group_name   = "${var.resource-group-name}"
  storage_account_name  = "${var.storage-account-name}"
  container_access_type = "private"
}

output "storageinfo" {
  value = "${azurerm.saccount.storage_account_key}"
  value = "${azurerm.container.container_id}"
}