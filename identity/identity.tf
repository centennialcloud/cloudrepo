provider "azuread" {
  version         = "~>0.3.0"
  subscription_id = "${var.subscriptionid}"
  tenant_id       = "${var.tenantid}"
}

provider "azurerm" {
  version = "~>1.28.0"
}

resource "azuread_user" "test_user" {
  user_principal_name = "${var.userprincipalname}"
  display_name        = "${var.displayname}"
  password            = "SecretP@sswd99!"
}

data "azurerm_subscription" "primary" {}

resource "azurerm_role_assignment" "test" {
  scope                = "${data.azurerm_subscription.primary.id}"
  role_definition_name = "${var.role}"
  principal_id         = "${azuread_user.test_user.id}"
}
