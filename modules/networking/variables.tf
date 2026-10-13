variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "canadacentral"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "vnet-cloudscale-prod"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.100.0.0/16"]
}

variable "app_subnet_prefix" {
  description = "Subnet prefix for App Service delegated subnet"
  type        = list(string)
  default     = ["10.100.1.0/24"]
}

variable "data_subnet_prefix" {
  description = "Subnet prefix for Private Endpoints (SQL/Storage)"
  type        = list(string)
  default     = ["10.100.2.0/24"]
}
