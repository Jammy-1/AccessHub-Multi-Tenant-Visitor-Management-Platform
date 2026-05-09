#Cosmos
output "cosmos_endpoint" { value = azurerm_cosmosdb_account.cosmos.endpoint }
output "cosmos_key" { value = azurerm_cosmosdb_account.cosmos.primary_key }
