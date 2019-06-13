variable "rg-name" {
  description = "the name of the resource group"
}

variable "location" {
  description = "The location of the resources"
}

variable "vm-name" {
  description = "the name for the virtual machine"
}

variable "vm-size" {
  description = "The size for the VM. Values: B, Dsv3, Dv3, DSv2, Dv2, Av2, DC"
}

variable "netword-ii" {
  description = "The Network Interface ID's which should be associated with the Virtual Machine."
}

variable "timezone" {
  description = "The timezone for the windows config. East US, Central US, Pacific Time, etc."
}

variable "username" {
  description = "Specify the name of the local administrator account."
}

variable "password" {
  description = "must be between 6-72 characters long and must satisfy at least 3 of password complexity requirements from the following: 1. Contains an uppercase character 2. Contains a lowercase character 3. Contains a numeric digit 4. Contains a special character"
}
