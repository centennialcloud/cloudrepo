
# Windows app service plan variables
variable "WinAppPlan" {
    type = "string"
}
variable "azurerm_resource_group.WinAppPlan.location" {
    type = "string"
}
variable "azurerm_resource_group.WinAppPlan.name" {
    type = "string"
}


# Windows app service variables
variable "WinAppService" {
    type = "string"
}

variable "azurerm_resource_group.WinAppService.location" {
    type = "string"
}

variable "azurerm_resource_group.WinAppService.name" {
    type = "string"
}

variable "azurerm_app_service_plan.WinAppService.id" {
    type = "string"
}

