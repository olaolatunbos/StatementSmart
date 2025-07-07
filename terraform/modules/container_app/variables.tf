variable "container_app_name" {
  description = "Name of the Azure Container App."
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

variable "container_app_environment_name" {
  description = "Name of the container app environment."
  type        = string
}

variable "acr_server" {
  description = "ACR login server (e.g., myregistry.azurecr.io)."
  type        = string
}

variable "container_image" {
  description = "Full container image path (e.g., myregistry.azurecr.io/image:tag)."
  type        = string
}
