variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "canadacentral"
}

variable "workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
  default     = "law-cloudscale-prod"
}

variable "app_insights_name" {
  description = "Name of Application Insights"
  type        = string
  default     = "appi-cloudscale-prod"
}
