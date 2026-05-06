resource "azurerm_resource_group" "resource_group" {
  name     = "${var.customer_name}-${var.environment}"
  location = var.location
}