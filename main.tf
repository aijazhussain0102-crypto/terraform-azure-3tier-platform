# Resource Group for all project workloads
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = var.environment
    Project     = "terraform-azure-3tier-platform"
    ManagedBy   = "Terraform"
  }
}

# Random suffix to guarantee globally unique Azure PaaS names
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

# 1. Monitoring Module (Log Analytics & Application Insights)
module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

# 2. Networking Module (VNet, Subnets & Private DNS)
module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

# 3. Database Module (Azure SQL Serverless & Private Endpoint)
module "database" {
  source                  = "./modules/database"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  sql_server_name         = "sql-cloudscale-${random_string.suffix.result}"
  data_subnet_id          = module.networking.data_subnet_id
  sql_private_dns_zone_id = module.networking.sql_private_dns_zone_id
}

# 4. Security Module (Key Vault & Connection String Secret)
module "security" {
  source                = "./modules/security"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  key_vault_name        = "kv-cloudscale-${random_string.suffix.result}"
  sql_connection_string = module.database.generated_connection_string
}

# 5. Compute Module (Linux Web App, VNet Integration, Managed Identity)
module "compute" {
  source                         = "./modules/compute"
  resource_group_name            = azurerm_resource_group.rg.name
  location                       = azurerm_resource_group.rg.location
  web_app_name                   = "app-cloudscale-${random_string.suffix.result}"
  app_subnet_id                  = module.networking.app_subnet_id
  key_vault_id                   = module.security.key_vault_id
  key_vault_secret_uri           = module.security.sql_secret_versionless_id
  app_insights_connection_string = module.monitoring.app_insights_connection_string
}
