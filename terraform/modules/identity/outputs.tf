output "id" {
  description = "The ID of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.app_identity.id
}

output "name" {
  description = "The name of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.app_identity.name
}

output "principal_id" {
  description = "The principal ID associated with the identity"
  value       = azurerm_user_assigned_identity.app_identity.principal_id
}

output "client_id" {
  description = "The client ID of the identity"
  value       = azurerm_user_assigned_identity.app_identity.client_id
}
