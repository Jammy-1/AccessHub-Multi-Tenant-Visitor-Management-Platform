# Application Insights
resource "azurerm_application_insights" "app_insights" {
  name                = "${var.customer_name}-${var.environment}-app-insights"
  location            = var.location
 resource_group_name = var.resource_group_name
  application_type    = "Web"
}