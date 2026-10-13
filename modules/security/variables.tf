variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "canadacentral"
}

variable "key_vault_name" {
  description = "Globally unique name of the Key Vault"
  type        = string
}

variable "sql_connection_string" {
  description = "Connection string secret to store in Key Vault"
  type        = string
  sensitive   = true
}
