// This is where were using it
resource "azurerm_resource_group" "k8s" {
    name = "k8sgroup${random_string.k8s.result}"
    location = "${var.k8s_vars["location"]}"
}

resource "random_string" "k8s" {
    length = 5
    upper = false
    lower = true
    number = true
    special = false
}
