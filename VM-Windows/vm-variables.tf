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
variable "timezone" {
    type = "map"
    description = "The timezone for the windows config. East US, Central US, Pacific Time, etc."
}
variable "username" {
    type = "map"
    description = "Specifies the name of the local administrator account."
}
variable "password" {
    type = "map"
  description = "must be between 6-72 characters long and must satisfy at least 3 of password complexity requirements from the following: 1. Contains an uppercase character 2. Contains a lowercase character 3. Contains a numeric digit 4. Contains a special character"
}









