# azure-terraform

provider "azurerm" {
features {}
subscription_id = var.subscription_id
}

# Resource Group

resource "azurerm_resource_group" "rg" {
name = var.resource_group_name
location = var.resource_group_location
}

module "acr" {
source = "./modules/container_registry"
name = "taskmanagementacr"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
sku = "Standard"
admin_enabled = true
}

module "log_analytics" {
source = "./modules/log_analytics_workspace"
name = "log-analytics-workspace"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}

module "app_environment" {
source = "./modules/app_environment"
name = "app-environment"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
log_analytics_workspace_id = module.log_analytics.id
}

module "app_identity" {
source = "./modules/identity"
name = "taskmanagement-app-identity"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_role_assignment" "acr_pull" {
scope = module.acr.id
role_definition_name = "AcrPull"
principal_id = module.app_identity.principal_id
}

module "container_app" {
source = "./modules/container_app"
name = "taskmanagement-app"
resource_group_name = azurerm_resource_group.rg.name
container_app_environment_id = module.app_environment.id
identity_id = module.app_identity.id
acr_login_server = module.acr.login_server
container_image = "my-flask-app"
container_name = "my-flask-app"
container_port = 3000
cpu = 0.5
memory = "1Gi"
}
