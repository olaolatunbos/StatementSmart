variable "name" {
  type        = string
  description = "Name of the Container App Environment"
}

variable "location" {
  type        = string
  description = "Azure region for the environment"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "ID of the Log Analytics Workspace"
}
