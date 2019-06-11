resource "azurerm_resource_group" "network-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "main-network" {
  name                = "${var.networkname}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.network-rg.name}"

  subnet {
    name           = "${var.networkname}-sub"
    address_prefix = "10.0.0.0/18"
  }
}

resource "azurerm_subnet" "private" {
  name                 = "${var.networkname}-privatesub"
  resource_group_name  = "${azurerm_resource_group.network-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.main-network.name}"
  address_prefix       = "10.0.1.0/22"

  delegation {
    name = "windowsdelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "public" {
  name                 = "${var.networkname}-publicsub"
  resource_group_name  = "${azurerm_resource_group.network-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.main-network.name}"
  address_prefix       = "10.0.1.0/24"

  delegation {
    name = "windowsdelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = "${azurerm_subnet.public.id}"
  network_security_group_id = "${azurerm_network_security_group.public.id}"
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = "${azurerm_subnet.private.id}"
  network_security_group_id = "${azurerm_network_security_group.private.id}"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.netword-ii}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.network-rg.name}"

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = "${azurerm_subnet.private.id}"
    private_ip_address_allocation = "Dynamic"
  }
}
