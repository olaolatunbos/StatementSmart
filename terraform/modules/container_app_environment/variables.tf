variable "container_app_environment_name" {
  description = "Name of the Container App Environment."
  type        = string
}

variable "location" {
  description = "Azure region where the Container App Environment will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace."
  type        = string
}
