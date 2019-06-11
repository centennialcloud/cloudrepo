provider "azurerm" {
  version = "=1.28.0"
}

module "vm" {
  source = "./vm"
  vm-size-str = "B1"
  vm-image-str = "18"
  disk-size-str = "small"
  resource-group-name = "somegroup"
  location-name = "southcentralus"
  admin-username = "testadmin"
  admin-password = "Password1234!"
}
