provider "azurerm" 
{
    version = "=1.28.0"

    subscription_id = "000000000-00000-0000-00"
    tenant_id = "1111111111111-11111111-1111" 
}
provider "azuread"
{
    version = "=0.3.0"
}

resource "azurerm_resource_group" "main" 
{
    name = "${var.resGroup}-resources" 
    location = "southcentralus"
}

resource "azurerm_managed_disk" "main" 
{
    name = "diskName" 
    location = "southcentralus"
    resource_group_name = "${azurerm_resource_group.main.name}"
    storage_account_type = "Standard_LRS" 
    create_option = "Empty"
    disk_size_gb = "10"
}

resource "azurerm_virtual_machine" "main" 
{
    name = "${var.vmVar}-vm"
    location = "${azurerm_resource_group.main.location}"
    resource_group_name = "${azurerm_resource_group.main.name}"
    //network_interface_ids = ["${azurerm_network_interface.main.id}"]
    vm_size = "Standard_DS1_v2"

    storage_image-referance 
    {
        offer = "UbuntuServer"
        sku = "16.04-LTS"
        version = "latest"
    }
    storage_os_disk 
    {
        name = "myosdisk1"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standard_LRS"
    }
}


