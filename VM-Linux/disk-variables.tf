variable "disk-name" {
  description = "The disk name."
}

variable "disk-size" {
  description = "The size of the disk in GB. Whole numbers only."
}

resource "azurerm_resource_group" "linux-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}
