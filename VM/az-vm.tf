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
resource "azurerm_virtual_machine_data_disk_attachment" "vm-disk" {
  managed_disk_id    = "${azurerm_managed_disk.windows-disk.name}"
  virtual_machine_id = "${azurerm_virtual_machine.windowsVM.name}"
  lun                = "10"
  caching            = "ReadWrite"
}