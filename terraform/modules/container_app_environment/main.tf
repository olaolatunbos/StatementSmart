resource "azurerm_container_app_environment" "this" {
  name                = var.container_app_environment_name
  location            = var.location
  resource_group_name = var.resource_group_name
  logs_destination    = "log-analytics"
  mutual_tls_enabled  = false

  log_analytics_workspace_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${var.log_analytics_workspace_name}"
}
