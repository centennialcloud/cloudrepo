
# Windows app service plan variables
variable "WinAppPlan" {
    type = "string"
}


# Windows app service variables
variable "WinAppService" {
    type = "string"
}




variable "application-setting-str" {
    type = "string"
}

variable "application-setting" {
  type = "map"

  default = {
    "node"   = "NODE|10.14"
    "dotnet" = "DOTNETCORE|2.2"
  }
}


# variables for resource group
variable "resource-group-name" {
  type    = "string"
}

variable "location-name" {
  type    = "string"
  default = "southcentralus"
}
