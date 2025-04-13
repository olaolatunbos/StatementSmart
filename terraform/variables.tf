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
