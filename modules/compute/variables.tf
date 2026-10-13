variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "canadacentral"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "asp-cloudscale-prod"
}

variable "web_app_name" {
  description = "Globally unique name of the Linux Web App"
  type        = string
}

variable "app_subnet_id" {
  description = "Subnet ID for Regional VNet Integration"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID for RBAC role assignment"
  type        = string
}

variable "key_vault_secret_uri" {
  description = "URI of the database connection secret in Key Vault"
  type        = string
}

variable "app_insights_connection_string" {
  description = "Connection string for Application Insights"
  type        = string
}
