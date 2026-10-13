data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  enable_rbac_authorization  = true
  soft_delete_retention_days = 90
  purge_protection_enabled   = false
}

resource "azurerm_key_vault_secret" "sql_connection" {
  name         = "SqlConnectionString"
  value        = var.sql_connection_string
  key_vault_id = azurerm_key_vault.kv.id
}
