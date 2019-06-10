provider "azuread" "k8s" {
   version = "~>0.3.0"
}

provider "azurerm" "k8s" {
   version = "~>1.28.0"
}

provider "random" "k8s" {
   version = "~>2.1.0"
}

# Example Usage with Create Empty
resource "azurerm_resource_group" "windows" {
  name = "windows"
  location = "West US 2"
}
resource "azurerm_managed_disk" "test" {
  name                 = "windows-disk"
  resource_group_name  = "${azurerm_resource_group.windows.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "Windows-OS"
  }
}


resource "azurerm_virtual_machine" "windowsVM" {
   name = "${terick}-vm"  // required
   location = "${azurerm_resource_group.windowsVM.location}" // required
   resource_group_name = "${azurerm_resource_group.windowsVM.name}" // required
   network_interface_ids = "${azurerm_network_interface.windowsVM.id}" // required
   vm_size = "${vmSize}" // required

   os_profile_windows_config { // required
       provision_vm_agent = true //set to true since it automatically defaults to false

   }
}