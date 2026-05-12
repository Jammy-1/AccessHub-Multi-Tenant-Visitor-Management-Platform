# App Service Plan
resource "azurerm_service_plan" "app_plan" {
  name                = "${var.customer_name}-${var.environment}-app-sp"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "api" {
  name                = "${var.customer_name}-${var.environment}-func"
  location            = var.location
  resource_group_name = var.resource_group_name

  service_plan_id            = azurerm_service_plan.app_plan.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_key

  https_only = true

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
    "COSMOS_ENDPOINT"          = var.cosmos_endpoint
    "COSMOS_KEY"               = var.cosmos_key
    "APPINSIGHTS_KEY"          = azurerm_application_insights.insights.instrumentation_key
  }

  site_config {}
}


