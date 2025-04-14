variable "name" {
  type        = string
  description = "The name of the ACR"
}

variable "location" {
  type        = string
  description = "Location for the ACR"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "The SKU of the ACR (e.g., Basic, Standard, Premium)"
}

variable "admin_enabled" {
  type        = bool
  default     = true
  description = "Whether admin access is enabled"
}

