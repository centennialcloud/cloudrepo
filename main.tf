provider "azurerm" {
  version = "=1.28.0"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.resource-group-name}"
  location = "${var.location-name}"
}

resource "azurerm_managed_disk" "main" {
  name                 = "diskName"                                # TODO: Convert to variable
  location             = "${azurerm_resource_group.main.location}"
  resource_group_name  = "${azurerm_resource_group.main.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"                                      # TODO: Convert to variable
}