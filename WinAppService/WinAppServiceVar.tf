
# Windows app service plan variables
variable "WinAppPlan" {
    type = "string"
}


# Windows app service variables
variable "WinAppService" {
    type = "string"
}



variable "application-setting" {
  type = "map"

  default = {
    "node"   = "node|10.6"
    "dotnet" = "aspnet|v3.5"
  }
}

variable "application-setting-str" {
    type = "string"
}

# variables for resource group
variable "resource-group-name" {
  type    = "string"
}

variable "location-name" {
  type    = "string"
  default = "southcentralus"
}
