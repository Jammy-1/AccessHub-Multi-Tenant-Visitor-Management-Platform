# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log-analytics-workspace" {
  name                = "${var.customer_name}-${var.environment}-law"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
