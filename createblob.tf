provider "azurerm" {
  version = "=1.28.0"
}

resource "azurerm_resource_group" "practic" {
  name = "resogroup1"
  location = "southcentralus"

}

resource "azurerm_storage_account" "practic" {
  name = "stoooorage12"
  location = "${azurerm_resource_group.practic.location}"
  account_tier = "Standard"
  resource_group_name = "${azurerm_resource_group.practic.name}"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "practic" {
  name = "contain1"
  resource_group_name = "${azurerm_resource_group.practic.name}"
  storage_account_name = "${azurerm_storage_account.practic.name}"

  
}

resource "azurerm_storage_blob" "practic" {
  name = "blobby1"
  resource_group_name = "${azurerm_resource_group.practic.name}"
  storage_account_name = "${azurerm_storage_account.practic.name}"
  storage_container_name = "${azurerm_storage_container.practic.name}" 
  type = "block"
  
}

output "test" {
  value = "azure_storage_blob.name"

}

