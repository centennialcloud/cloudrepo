resource "azurerm_virtual_network" "main" {
  name                = "${var.networkname}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.windows-rg.name}"
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.subname}-subnet"
  resource_group_name  = "${azurerm_resource_group.windows-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.netword-ii}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.windows-rg.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.internal.name}"
    private_ip_address_allocation = "Dynamic"
  }
}