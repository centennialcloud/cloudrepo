provider "azuread"  {
    version = "~>0.3.0"
}

provider "azurerm" {
    version = "~>1.28.0"
}

provider "random" {
    version = "~>2.1.0"
}

resource "azurerm_virtual_machine" "windowsVM" {
    name = "${terick}-vm"  // required
    location = "${azurerm_resource_group.windowsVM.location}" // required
    resource_group_name = "${azurerm_resource_group.windowsVM.name}" // required
    network_interface_ids = "${azurerm_network_interface.windowsVM.id}" // required 
    vm_size = "${vmSize}" // required 

    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "Win2016"
    version   = "latest" // (optional)

    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "Win2019"
    version   = "latest" // (optional)

    id = // need this to specify the custom image; changing forces new resource to be created
    }
    
    os_profile_windows_config { # required
        provision_vm_agent = true # (optional) set to true since it automatically defaults to false
        enable_automatic_upgrades = true // (optional) set to true since it automatically defaults to false
        timezone = "${timeZone}" // (optional)
       // winrm // (optional) windows remote management
        # Unattend config is to enable basic auth in WinRM, required for the provisioner stage.
           
    }
  }
