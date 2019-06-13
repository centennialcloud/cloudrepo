variable "ssname" {
  description = "Specifies the name of the virtual machine scale set resource."
}

variable "cnp" {
  description = "Specifies the computer name prefix for all of the virtual machines in the scale set. Computer name prefixes must be 1 to 9 characters long for windows images and 1 - 58 for linux. "
}

variable "ss-username" {
  description = "Specifies the administrator account name to use for all the instances of virtual machines in the scale set."
}

variable "ss-password" {
  description = "Specifies the administrator password to use for all the instances of virtual machines in a scale set."
}

variable "ss-network" {
  description = "Specifies the name of the network interface configuration."
}

variable "ss-ip" {
  description = "Specifies name of the IP configuration."
}

resource "azurerm_virtual_network" "monitor" {
  name                = "${var.ss-network}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.monitor-rg.location}"
  resource_group_name = "${azurerm_resource_group.monitor-rg.name}"
}

resource "azurerm_subnet" "monitor" {
  name                 = "${var.ss-network}-subnet"
  resource_group_name  = "${azurerm_resource_group.monitor-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.monitor.name}"
  address_prefix       = "10.0.2.0/24"
}
