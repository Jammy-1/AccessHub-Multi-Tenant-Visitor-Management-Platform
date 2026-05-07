# Storage Account
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.customer_name}${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false
}

