variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account"
}

variable "container_registry_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of the Log Analytics workspace"
}

variable "dns_zone_name" {
  type        = string
  description = "DNS zone name"
}

variable "container_app_name" {
  type        = string
  description = "Name of the Azure Container App"
}

variable "container_app_environment_name" {
  type        = string
  description = "Name of the Container App Environment"
}

variable "acr_server" {
  type        = string
  description = "Container Registry Server URL"
}

variable "container_image" {
  type        = string
  description = "Container image path"
}

variable "cdn_profile_name" {
  type        = string
  description = "Name of Azure Front Door (CDN) profile"
}
