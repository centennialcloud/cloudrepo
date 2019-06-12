output "id" {
  value = "${list(azurerm_virtual_machine.windowsVM.id,azurerm_virtual_network.main-network.id,azurerm_subnet.private.id,azurerm_subnet.public.id)}"
}

output "name" {
  value = "${azurerm_virtual_network.main-network.name}"
}

output "address_space" {
  value = "${azurerm_virtual_network.main-network.address_space}"
}

output "subnet" {
  value = "${azurerm_virtual_network.main-network.subnet}"
}

output "ip_configurations" {
  value = "${list(azurerm_subnet.private.ip_configurations,azurerm_subnet.public.ip_configurations)}"
}

output "address_prefix" {
  value = "${list(azurerm_subnet.private.address_prefix,azurerm_subnet.public.ip_configurations)}"
}
