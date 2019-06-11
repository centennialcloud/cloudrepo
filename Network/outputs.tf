output "id" {
  value = "${azurerm_virtual_network.main-network.id}"
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
  value = "${azurerm_subnet.private.ip_configurations}"
}
output "address_prefix" {
  value = "${azurerm_subnet.private.address_prefix}"
}

