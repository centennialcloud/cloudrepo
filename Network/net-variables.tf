variable "rg-name" {
    description = "the name of the resource group"
}
variable "location" {
    description = "The location of the resources"
}
variable "networkname" {
  description = "The name of the network"
}
variable "subpublic" {
  description = "The name of the public subnetwork"
}
variable "subprivate" {
  description = "The name of the private subnetwork"
}
variable "netword-ii" {
    description = "The Network Interface ID's which should be associated with the Virtual Machine."
}
