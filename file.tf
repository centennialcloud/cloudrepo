provider "azurerm" {
     version = "~>1.28.0"
}

provider "random" {
  version = "=2.1.0"
}

resource "random_string" "star" {
  length = 19
  upper = false
  special = false
}


resource "azurerm_resource_group" "main" {
  name     = "${var.resource-group-name}"
  location = "${var.location-name}"
}

resource "azurerm_storage_account" "saccount" {
    name    = "${var.storage-account-name}"
    resource_group_name = "${azurerm_resource_group.main.name}"
    location = "${var.location-name}"
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_share" "testshare" {
  name = "${random_string.star.result}"
  resource_group_name  = "${azurerm_resource_group.main.name}"
  storage_account_name = "${azurerm_storage_account.saccount.name}"
  quota = 50
}

output "storagename" {
   value = "${azurerm_storage_account.saccount.primary_file_endpoint}"
 }
# output "storageconnect" {
#   value = "${azurerm_storage_account.saccount.primary_blob_endpoint}"
# }

# output "containername" {
#   value = "${azurerm_storage_container.container.name}"
# }

# output "containerconnect" {
#   value = "${azurerm_storage_container.container.id}"
# }


 output "filesharename" {
     value = "${azurerm_storage_share.testshare.name}"
 }
 output "fileshareconnect" {
     value = "${azurerm_storage_share.testshare.id}"
 }