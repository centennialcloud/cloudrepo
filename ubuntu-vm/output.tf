output "public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = "${azurerm_public_ip.main.ip_address}"
}
