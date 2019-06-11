variable "vm-size" {
  type = "map"

  default = {
    "B1" = "Standard_B1s"
    "B2" = "Standard_B2s"
    "B3" = "Standard_B4ms"
  }
}

variable "vm-size-str" {
  type    = "string"
}

variable "vm-image" {
  type = "map"

  default = {
    "16" = "16.04-LTS"
    "18" = "18.04-LTS"
  }
}

variable "vm-image-str" {
  type    = "string"
}

variable "disk-size" {
  type = "map"

  default = {
    "small"  = "10"
    "medium" = "20"
    "large"  = "40"
  }
}

variable "disk-size-str" {
  type    = "string"
}

# Resource group name - Change later
variable "resource-group-name" {
  type    = "string"
}

variable "location-name" {
  type    = "string"
}

variable "admin-username" {
  type    = "string"
}

variable "admin-password" {
  type    = "string"
}
