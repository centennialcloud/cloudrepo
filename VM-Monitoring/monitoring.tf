resource "azurerm_monitor_autoscale_setting" "monitor" {
  name                = "${var.autoscale}"
  resource_group_name = "${azurerm_resource_group.monitor-rg.name}"
  location            = "${azurerm_resource_group.monitor-rg.location}"
  target_resource_id  = "${azurerm_virtual_machine_scale_set.monitor.id}"

  profile {
    name = "${var.as-profile}"

    capacity {
      default = "${var.default-capacity}"
      minimum = "${var.minimum-capacity}"
      maximum = "${var.maximum-capacity}"
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = "${azurerm_virtual_machine_scale_set.monitor.id}"
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "3"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = "${azurerm_virtual_machine_scale_set.monitor.id}"
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }

  notification {
    email {
      send_to_subscription_administrator    = true
      send_to_subscription_co_administrator = true
      custom_emails                         = ["${var.email}"]
    }
  }
}