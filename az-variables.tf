variable "vm-size" {
  type    = "list"
  default = ["Standard_B1s", "Standard_B2s", "Standard_B4ms"]
}

variable "vm-image" {
  type    = "list"
  default = ["UbuntuServer:16.04-LTS:16.04.201905303", "UbuntuLTS"]
}

variable "disk-size" {
  type    = "list"
  default = ["10", "20", "40"]
}

# Resource group name - Change later
variable "resource-group-name" {
  type    = "string"
  default = "myresourcegroup"
}

variable "location-name" {
  type    = "string"
  default = "southcentralus"
}
