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