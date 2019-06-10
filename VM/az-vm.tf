provider "azuread" {
   version = "~>0.3.0"
}
provider "azurerm" {
   version = "~>1.28.0"
}
provider "azurestack" {
  version = "=0.5.0"
}
provider "random" {
   version = "~>2.1.0"
}

resource "azurerm_virtual_machine" "windowsVM" {
   name = "${var.vm-name}-vm"
   location = "${var.location}"
   resource_group_name = "${azurerm_resource_group.windows-rg.name}"
   network_interface_ids = "${var.netword-ii}"
   vm_size = "${var.vm-size}"
   os_profile_windows_config { 
      provision_vm_agent = true
      enable_automatic_upgrades = true
      timezone = "${var.timezone}"
   }
}