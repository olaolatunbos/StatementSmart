variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Azure resource group location"
  type        = string
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "acr_sku" {
  description = "SKU tier for the ACR (e.g., Basic, Standard, Premium)"
  type        = string
  default     = "Standard"
}

variable "acr_admin_enabled" {
  description = "Enable admin access to the ACR"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "container_app_environment_name" {
  description = "Name of the Azure Container App Environment"
  type        = string
}

variable "identity_name" {
  description = "Name of the user-assigned identity"
  type        = string
}

variable "container_app_name" {
  description = "Name of the container app"
  type        = string
}

variable "container_image" {
  description = "Docker image name with tag to be deployed"
  type        = string
}

variable "container_name" {
  description = "Container name used in the app definition"
  type        = string
}

variable "container_port" {
  description = "Port on which the container is exposed"
  type        = number
  default     = 3000
}
