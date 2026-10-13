output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}

output "sql_secret_versionless_id" {
  value = azurerm_key_vault_secret.sql_connection.versionless_id
}
