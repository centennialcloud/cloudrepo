variable "rg-name" {
    type = "map"
    description = "the name of the resource group"
}

variable "location" {
    type = "map"
    description = "The location of the resources"
}

variable "disk-name" {
    type = "map"
    description = "The disk name."
}

variable "disk-size" {
    type = "map"
    description = "The size of the disk in GB"
}
