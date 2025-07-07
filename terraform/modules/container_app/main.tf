resource "azurerm_container_app" "this" {
  name                   = var.container_app_name
  resource_group_name    = var.resource_group_name
  revision_mode          = "Single"
  workload_profile_name  = "Consumption"
  max_inactive_revisions = 100

  container_app_environment_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.App/managedEnvironments/${var.container_app_environment_name}"

  ingress {
    allow_insecure_connections = false
    client_certificate_mode    = "ignore"
    external_enabled           = true
    target_port                = 3000
    transport                  = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  registry {
    identity = "system-environment"
    server   = var.acr_server
  }

  template {
    max_replicas = 1
    min_replicas = 1

    container {
      name   = var.container_app_name
      image  = var.container_image
      cpu    = 0.5
      memory = "1Gi"
    }
  }
}
