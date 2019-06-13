provider "azurerm" {
  version = "=1.28.0"
}

module "vm" {
  source              = "./ubuntu-vm"
  vm-name             = "myvirtualmachine3"
  vm-size-str         = "B1"
  vm-image-str        = "18"
  disk-size-str       = "small"
  resource-group-name = "somegroupss"
  location-name       = "southcentralus"
  admin-username      = "testadmin"
  admin-password      = "Password1234!"
}
