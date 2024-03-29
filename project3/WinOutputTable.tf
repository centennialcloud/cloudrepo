output "app_service_name" {
  value = "${azurerm_app_service.main.name}" # in other files
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.main.default_site_hostname}" 
}

