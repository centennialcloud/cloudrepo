# Resource group name - Change later
variable "resource-group-name" {
  type    = "string"
}

variable "location-name" {
  type    = "string"
  default = "southcentralus"
}

variable "asp-name" {
  type = "string"
}

variable "as-name" {
  type = "string"
}

variable "application-setting" {
  type = "map"

  default = {
    "node"   = "NODE|10.14"
    "dotnet" = "DOTNETCORE|2.2"
  }
}

variable "application-setting-str" {
  type = "string"
}
