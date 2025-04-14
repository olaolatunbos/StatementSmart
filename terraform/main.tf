provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "rg" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "acr" {
  source              = "./modules/container_registry"
  name                = var.acr_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

module "log_analytics" {
  source              = "./modules/log_analytics_workspace"
  name                = var.log_analytics_workspace_name
  location            = module.rg.location
  resource_group_name = module.rg.name
}

module "app_environment" {
  source                     = "./modules/app_environment"
  name                       = var.container_app_environment_name
  location                   = module.rg.location
  resource_group_name        = module.rg.name
  log_analytics_workspace_id = module.log_analytics.id
}

resource "azurerm_user_assigned_identity" "app_identity" {
  name                = var.identity_name
  location            = module.rg.location
  resource_group_name = module.rg.name
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = module.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.app_identity.principal_id
}

module "container_app" {
  source                       = "./modules/container_app"
  name                         = var.container_app_name
  container_name               = var.container_name
  container_image              = var.container_image
  container_app_environment_id = module.app_environment.id
  resource_group_name          = module.rg.name
  acr_login_server             = module.acr.login_server
  identity_id                  = azurerm_user_assigned_identity.app_identity.id
  container_port               = var.container_port
}
