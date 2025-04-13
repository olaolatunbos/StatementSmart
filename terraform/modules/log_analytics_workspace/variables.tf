variable "name" {
  type        = string
  description = "The name of the Log Analytics Workspace"
}

variable "location" {
  type        = string
  description = "The Azure region to deploy the workspace"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "sku" {
  type        = string
  default     = "PerGB2018"
  description = "The pricing SKU for the workspace"
}

variable "retention_in_days" {
  type        = number
  default     = 30
  description = "Data retention in days"
}
