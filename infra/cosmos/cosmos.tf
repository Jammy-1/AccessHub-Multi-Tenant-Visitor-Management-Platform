# Comos Account
  resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "${var.customer_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  capabilities { name = "EnableServerless" }
  consistency_policy { consistency_level = "Session" }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

# SQL Database
resource "azurerm_cosmosdb_sql_database" "visitiors_database" {
  name                = "visitors-db"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}

# Container
resource "azurerm_cosmosdb_sql_container" "visitors_container" {
  name                = "visitors"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
  database_name       = azurerm_cosmosdb_sql_database.visitiors_database.name

  partition_key_paths = ["/tennantId"]

  indexing_policy { indexing_mode = "consistent" }
}


