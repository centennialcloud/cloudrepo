provider "azurerm" {
  version = "=1.28.0"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.resource-group-name}"
  location = "${var.location-name}"
}

# Create VNet
# TODO: Make VNET without hardcoding it
resource "azurerm_virtual_network" "main" {
  name                = "my-network"
  address_space       = ["10.0.0.0/24"]
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
}

#Create Subnet
# TODO: Make Subnet without hardcoding it
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.0.0.0/24"
}

# Create NIC
# TODO: Make NIC without hardcoding it
resource "azurerm_network_interface" "main" {
  name                = "vm-nic"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.main.id}"
  }
}

resource "azurerm_public_ip" "main" {
  name                = "acceptanceTestPublicIp1"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  allocation_method   = "Static"
}

# Create virtual machine
# TODO: Convert hardcoded items into variables
resource "azurerm_virtual_machine" "main" {
  name                  = "myVirtualMachine"                        # TODO: Convert to variable
  location              = "${azurerm_resource_group.main.location}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  network_interface_ids = ["${azurerm_network_interface.main.id}"]
  vm_size               = "${var.vm-size[var.vm-size-str]}"         # TODO: Convert to variable

  # TODO: Convert to variable
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "${var.vm-image[var.vm-image-str]}"
    version   = "latest"
  }

  # TODO: Convert to variable
  os_profile {
    computer_name  = "hostname"
    admin_username = "${var.admin-username}"
    admin_password = "${var.admin-password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name              = "diskName"
    caching           = "ReadWrite"                           # TODO: Convert to variable
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = "10"
    caching           = "ReadWrite"
    disk_size_gb      = "${var.disk-size[var.disk-size-str]}" # TODO: Convert to variable
  }

  provisioner "file" {
    connection {
      type     = "ssh"
      user     = "${var.admin-username}"
      password = "${var.admin-password}"
    }

    source      = "./scripts/script.sh"
    destination = "script.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "${var.admin-username}"
      password = "${var.admin-password}"
    }

    inline = [
      "chmod 777 ./script.sh",
      "./script.sh",
    ]
  }
}
