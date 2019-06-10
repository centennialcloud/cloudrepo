variable "disk-name" {
    type = "map"
    description = "The disk name."
}

variable "disk-size" {
    type = "map"
    description = "The size of the disk in GB. Whole numbers only."
}

resource "azurerm_resource_group" "linux-rg" {
  name = "${var.rg-name}"
  location = "${var.location}"
}