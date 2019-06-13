output "id" {
  value = "${list(azurerm_monitor_autoscale_setting.monitor.id,azurerm_virtual_machine_scale_set.monitor.id,azurerm_monitor_action_group.monitor.id)}"
}
