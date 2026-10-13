output "resource_group_name" {
  description = "Project Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "web_app_url" {
  description = "Public HTTPS URL of the Azure Web App"
  value       = "https://${module.compute.web_app_default_hostname}"
}

output "key_vault_uri" {
  description = "URI of the provisioned Azure Key Vault"
  value       = module.security.key_vault_uri
}

output "sql_server_fqdn" {
  description = "Private FQDN of the Azure SQL logical server"
  value       = module.database.sql_server_fqdn
}
