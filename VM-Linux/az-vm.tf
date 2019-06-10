resource "azurerm_virtual_network" "main" {
  name                = "${var.networkname}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.linux-rg.name}"
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.subname}-subnet"
  resource_group_name  = "${azurerm_resource_group.linux-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.netword-ii}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.linux-rg.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.internal.name}"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_virtual_machine" "LinuxVM" {
   name = "${var.vm-name}-vm"
   location = "${var.location}"
   resource_group_name = "${azurerm_resource_group.linux-rg.name}"
   network_interface_ids = "${azurerm_network_interface.main.name}"
   vm_size = "${var.vm-size}"
   
   storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  
  storage_os_disk {
    name              = "${var.disk-name}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "${var.disk-size}"
    os_type           = "Linux"
  }
  
  os_profile {
    computer_name  = "${var.vm-name}"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
    custom_data = ""
  }
   os_profile_linux_config {
     disable_password_authentication = false
   }
}