variable "rg-name" {
    type = "map"
    description = "the name of the resource group"
}

variable "location" {
    type = "map"
    description = "The location of the resources"
}

variable "vm-name" {
    type = "map"
    description = "the name for the virtual machine"
}

variable "vm-size" {
    type = "map"
    description = "The size for the VM. Values: B, Dsv3, Dv3, DSv2, Dv2, Av2, DC"
}

variable "netword-ii" {
    type = "map"
    description = "The Network Interface ID's which should be associated with the Virtual Machine."
  
}






