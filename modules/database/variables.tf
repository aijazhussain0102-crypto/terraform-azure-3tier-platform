variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "canadacentral"
}

variable "sql_server_name" {
  description = "Globally unique name of the Azure SQL logical server"
  type        = string
}

variable "data_subnet_id" {
  description = "Subnet ID where Private Endpoint will attach"
  type        = string
}

variable "sql_private_dns_zone_id" {
  description = "Private DNS Zone ID for SQL Private Link"
  type        = string
}
