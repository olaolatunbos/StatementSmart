# azure-terraform

provider "azurerm" {
features {}
subscription_id = "001a4eb4-4cb2-47b9-a3bd-de9b5304872c"
}

# Resource Group

module "rg" {
source = "./modules/resource_group"
name = "taskmanagement-app-dev-rg"
location = "uksouth"
}

# Container Registry

module "acr" {
source = "./modules/container_registry"
name = "taskmanagementacr"
location = module.rg.location
resource_group_name = module.rg.name
sku = "Standard"
admin_enabled = true
}

module "log_analytics" {
source = "./modules/log_analytics_workspace"
name = "log-analytics-workspace"
location = module.rg.location
resource_group_name = module.rg.name
}

module "app_environment" {
source = "./modules/app_environment"
name = "app-environment"
location = module.rg.location
resource_group_name = module.rg.name
log_analytics_workspace_id = module.log_analytics.id
}

module "identity" {
source = "./modules/identity"
name = "taskmanagement-app-identity"
location = module.rg.location
resource_group_name = module.rg.name
}

resource "azurerm_role_assignment" "acr_pull" {
scope = module.acr.id
role_definition_name = "AcrPull"
principal_id = module.identity.principal_id
}

module "container_app" {
source = "./modules/container_app"
name = "taskmanagement-app"
container_image = "${module.acr.login_server}/my-flask-app:latest"
container_app_environment_id = module.app_environment.id
resource_group_name = module.rg.name
acr_login_server = module.acr.login_server
identity_id = module.identity.id
}

resource "azurerm_user_assigned_identity" "app_identity" {
name = "taskmanagement-app-identity"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}

# Role Assignment for ACR Pull

resource "azurerm_role_assignment" "acr_pull" {
scope = azurerm_container_registry.acr.id
role_definition_name = "AcrPull"
principal_id = azurerm_user_assigned_identity.app_identity.principal_id
}
