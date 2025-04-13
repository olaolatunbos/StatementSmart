variable "name" {
  type        = string
  description = "Name of the Container App"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "container_app_environment_id" {
  type        = string
  description = "ID of the Container App Environment"
}

variable "identity_id" {
  type        = string
  description = "ID of the User Assigned Identity"
}

variable "acr_login_server" {
  type        = string
  description = "ACR login server URL"
}

variable "container_name" {
  type        = string
  default     = "app"
  description = "Name of the container inside the app"
}

variable "container_image" {
  type        = string
  description = "Container image name (without tag or server)"
}

variable "container_port" {
  type        = number
  default     = 3000
  description = "Port the container listens on"
}

variable "cpu" {
  type        = number
  default     = 0.5
  description = "CPU to allocate"
}

variable "memory" {
  type        = string
  default     = "1Gi"
  description = "Memory to allocate"
}
