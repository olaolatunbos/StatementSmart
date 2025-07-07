variable "name" {
  description = "The name of the Azure Front Door profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "sku_name" {
  description = "The SKU of the Front Door profile. Allowed values are 'Standard_AzureFrontDoor' or 'Premium_AzureFrontDoor'."
  type        = string
}

