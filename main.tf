provider "azurerm" {
  version = "=1.28.0"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.resource-group-name}"
  location = "${var.location-name}"
}

resource "azurerm_managed_disk" "main" {
  name                 = "diskName"                                # TODO: Convert to variable
  location             = "${azurerm_resource_group.main.location}"
  resource_group_name  = "${azurerm_resource_group.main.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"                                      # TODO: Convert to variable
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
  }
}
