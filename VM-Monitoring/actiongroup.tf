resource "azurerm_resource_group" "test" {
  name     = "monitoring-resources"
  location = "West US"
}

resource "azurerm_monitor_action_group" "test" {
  name                = "CriticalAlertsAction"
  resource_group_name = "${azurerm_resource_group.test.name}"
  short_name          = "p0action"

  email_receiver {
    name          = "sendtoadmin"
    email_address = "admin@contoso.com"
  }

  email_receiver {
    name          = "sendtodevops"
    email_address = "devops@contoso.com"
  }

  sms_receiver {
    name         = "oncallmsg"
    country_code = "1"
    phone_number = "1231231234"
  }

  webhook_receiver {
    name        = "callmyapiaswell"
    service_uri = "http://example.com/alert"
  }
}