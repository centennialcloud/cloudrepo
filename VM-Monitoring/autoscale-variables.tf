variable "rg-name" {
  description = "the name of the resource group"
}

variable "location" {
  description = "The location of the resources"
}
variable "autoscale" {
  description = "The name assigned to the autoscale settings"
}
variable "as-profile" {
  description = "Specifies the name of the profile."
}
variable "default-capacity" {
  description = "The default number of instances for this resource. Must be greater than the minumum value."
}

variable "minimum-capacity" {
  description = "The minimum number of instances for this resource. Valid values are between 0 and 1000."
}
variable "maximum-capacity" {
  description = "The maximum number of instances for this resource. Valid values are between 0 and 1000."
}
variable "email" {
  description = "Specifies a list of custom email addresses to which the email notifications will be sent."
}



resource "azurerm_resource_group" "monitor-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}