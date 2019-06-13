resource "azurerm_monitor_action_group" "monitor" {
  name                = "${var.ag-name}"
  resource_group_name = "${azurerm_resource_group.monitor-rg.name}"
  short_name          = "${var.ag-name}-SMS"
  sms_receiver {
    name         = "${var.ag-smsname}"
    country_code = "1"
    phone_number = "${var.ag-phone}"
  }
}
