provider "azurerm" {
  features {}
  subscription_id = "001a4eb4-4cb2-47b9-a3bd-de9b5304872c"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "taskmanagement-app-dev-rg"
  location = "uksouth"
}

# Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "taskmanagementacr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "log-analytics-workspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Container App Environment
resource "azurerm_container_app_environment" "app_environment" {
  name                       = "app-environment"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

# User-Assigned Identity
resource "azurerm_user_assigned_identity" "app_identity" {
  name                = "taskmanagement-app-identity"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Role Assignment for ACR Pull
resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.app_identity.principal_id
}

# Container App
resource "azurerm_container_app" "container_app" {
  name                         = "taskmanagement-app"
  container_app_environment_id = azurerm_container_app_environment.app_environment.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.app_identity.id]
  }
  ingress {
    external_enabled = true
    target_port      = 3000
    transport        = "auto"
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  registry {
    server   = azurerm_container_registry.acr.login_server
    identity = azurerm_user_assigned_identity.app_identity.id
  }

  template {
    container {
      name   = "my-flask-app"
      image  = "${azurerm_container_registry.acr.login_server}/my-flask-app:latest"
      cpu    = 0.5
      memory = "1Gi"

    }
  }
}
