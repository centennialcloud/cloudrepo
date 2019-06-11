resource "azurerm_resource_group" "eric-rg" { //eric-rg is the name of the azure resource group
    name     = "ericTF-rg" //not the same as the resource group in Azure
    location = "southcentralus"
}