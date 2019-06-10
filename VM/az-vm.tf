provider "azuread" "k8s" {
   version = "~>0.3.0"
}

provider "azurerm" "k8s" {
   version = "~>1.28.0"
}

provider "random" "k8s" {
   version = "~>2.1.0"
}

#Create Empty Disk.
resource "azurerm_resource_group" "windows-rg" {
  name = "${var.rg-name}"
  location = "${var.location}"
}
resource "azurerm_managed_disk" "windows-vm" {
  name                 = "${var.disk-name}"
  resource_group_name  = "${azurerm_resource_group.windows-rg.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "${var.disk-size}"

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
   custom_data_type = ""

   os_profile_windows_config { // required
      provision_vm_agent = true //set to true since it automatically defaults to false
      enable_automatic_upgrades = true
      timezone = "var.timezone" 
   }
}