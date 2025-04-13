variable "name" {
  type        = string
  description = "Name of the User-Assigned Identity"
}

variable "location" {
  type        = string
  description = "Location for the Identity"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where the identity will be created"
}
