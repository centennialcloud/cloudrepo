
variable "sizes" {
  type    = "list"
  default = ["Standard_B1s", "Standard_B2s", "Standard_B4ms"] 
}

variable "image" {
    type = "list"
    default = ["UbuntuServer:16.04-LTS:16.04.201905303", "UbuntuLTS"]
}

variable "disk" {
  type = "list"
  default = ["10", "20", "40"]
}