resource "azurerm_network_security_group" "private" {
  name                = "${var.networkname}-privatensg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.network-rg.name}"

  security_rule {
    name                       = "Inboundsr"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22,80,443,3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Outboundsr"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22,80,443,3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "public" {
  name                = "${var.networkname}-publicnsg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.network-rg.name}"

  security_rule {
    name                       = "Inboundsr"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22,80,443,3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Outboundsr"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22,80,443,3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
