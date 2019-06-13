variable "resource-group-name" {
  type    = "string"
  description = "resource group: "
}

variable "location-name" {
  type    = "string"
  description = "location: "
}

 variable "storage-account-name" {
   type = "string"
   description = "name of storage account: "
 }

# variable "container-name" {
#   type    = "string"
#   default = "${random_string.star.result}"
# }

# variable "file-name" {
#   type    = "string"
#   default = "${random_string.star.result}"
# }
variable "vm-size" {
  type = "map"

  default = {
    "B1" = "Standard_B1s"
    "B2" = "Standard_B2s"
    "B3" = "Standard_B4ms"
  }
}

variable "vm-size-str" {
  description = "Size of the VM. Choose from B1, B2, B3"
  type = "string"
}

variable "vm-image" {
  type = "map"

  default = {
    "16" = "16.04-LTS"
    "18" = "18.04-LTS"
  }
}

variable "vm-image-str" {
  description = "Version of Ubuntu. Choose 16 or 18"
  type = "string"
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
  description = "Size of the VM. Choose small, medium, or large"
  type = "string"
}

variable "resource-group-name" {
  description = "Name of the resource group"
  type = "string"
}

variable "location-name" {
  description = "Location of the resource"
  type = "string"
}

variable "admin-username" {
  description = "VM admin name"
  type = "string"
}

variable "admin-password" {
  description = "VM admin password"
  type = "string"
}

variable "vm-name" {
  description = "Name of the VM"
  type = "string"
}

variable "storage-account-name" {
  type    = "string"
  default = "storeacc784584"
}

variable "container-name" {
  type    = "string"
  default = "container"
}
