variable "location" {
  description = "Primary Azure region"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Name of the project resource group"
  type        = string
  default     = "rg-cloudscale-3tier-prod"
}

variable "environment" {
  description = "Deployment environment tag"
  type        = string
  default     = "prod"
}
