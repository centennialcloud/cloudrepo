#Create Empty Disk.
resource "azurerm_managed_disk" "windows-disk" {
  name                 = "${var.disk-name}"
  resource_group_name  = "${azurerm_resource_group.windows-rg.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "${var.disk-size}"

  tags = {
    environment = "Windows-OS"
  }
}
