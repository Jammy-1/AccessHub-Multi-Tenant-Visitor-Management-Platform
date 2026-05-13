# Resource-Group
module "Resource-Group" {
  source        = "../../infra/resource-group"
  customer_name = var.customer_name
  environment   = var.environment
  location      = var.location
}

# Storage
module "Storage" {
  source        = "../../infra/modules/storage"
  customer_name = var.customer_name
  environment   = var.environment
  location      = var.location

  resource_group_name = var.resource_group_name
}

# Comos
module "Comos" {
  source        = "../../infra/cosmos"
  customer_name = var.customer_name
  environment   = var.environment
  location      = var.location

  resource_group_name = var.resource_group_name
}

# Funtions
module "Function" {
  source        = "../../infra/functions"
  customer_name = var.customer_name
  environment   = var.environment
  location      = var.location

  resource_group_name  = var.resource_group_name
  storage_account_name = module.Storage.storage_account_name
  storage_account_key  = module.Storage.storage_account_key

  cosmos_endpoint = module.Cosmos.cosmos_endpoint
  cosmos_key      = module.Comos.cosmos_key
}

# Monitoring
module "Monitoring" {
  source        = "../../infra/modules/monitoring"
  customer_name = var.customer_name
  environment   = var.environment
  location      = var.location

  resource_group_name = var.resource_group_name
}