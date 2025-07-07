output "container_app_id" {
  description = "The ID of the Azure Container App."
  value       = azurerm_container_app.this.id
}

output "container_app_name" {
  description = "The name of the Azure Container App."
  value       = azurerm_container_app.this.name
}
