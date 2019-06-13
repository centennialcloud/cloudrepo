resource "azurerm_virtual_machine_scale_set" "monitor" {
  name                = "${var.ssname}"
  location            = "${azurerm_resource_group.monitor-rg.location}"
  resource_group_name = "${azurerm_resource_group.monitor-rg.name}"
  upgrade_policy_mode = "Manual"

  sku {
    name     = "Standard_F2"
    tier     = "Standard"
    capacity = "${var.default-capacity}"
  }

  os_profile {
    computer_name_prefix = "${var.cnp}"
    admin_username       = "${var.ss-username}"
    admin_password       = "${var.ss-password}"
  }

  network_profile {
    name    = "${var.ss-network}"
    primary = true

    ip_configuration {
      name      = "${var.ss-ip}"
      primary   = true
      subnet_id = "${azurerm_subnet.monitor.id}"
    }
  }

  storage_profile_os_disk {
    create_option = "FromImage"
  }
}
