resource "azurerm_virtual_machine" "windowsVM" {
   name = "${var.vm-name}-vm"
   location = "${var.location}"
   resource_group_name = "${azurerm_resource_group.windows-rg.name}"
   network_interface_ids = "${var.netword-ii}"
   vm_size = "${var.vm-size}"
   
   storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  
  storage_os_disk {
    name              = "${var.disk-name}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "${var.disk-size}"
    os_type           = "Windows"
  }
  
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
   os_profile_windows_config { 
      provision_vm_agent = true
      enable_automatic_upgrades = true
      timezone = "${var.timezone}"
   }
}