provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Storage Account
module "storage-account" {
  source              = "./modules/storage_account"
  name                = var.storage_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
}


# Azure Container Registry
module "container-registry" {
  source              = "./modules/container_registry"
  name                = var.container_registry_name
  location            = var.location
  resource_group_name = var.resource_group_name
}



# Log Analytics Workspace

module "log_analytics_workspace" {
  source              = "./modules/log_analytics"
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
}


# Azure Front Door

module "dns-zone" {
  source              = "./modules/dns_zone"
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name

}

# Container App

module "container-app" {
  source                         = "./modules/container_app" # path to your container app module
  container_app_name             = var.container_app_name
  resource_group_name            = var.resource_group_name
  subscription_id                = var.subscription_id
  container_app_environment_name = var.container_app_environment_name
  acr_server                     = var.acr_server
  container_image                = var.container_image
}


# Container Apps Environment
module "container_app_environment" {
  source                         = "./modules/container_app_environment"
  container_app_environment_name = var.container_app_environment_name
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subscription_id                = var.subscription_id
  log_analytics_workspace_name   = var.log_analytics_workspace_name
}


# Azure Front Door
module "front-door" {
  source              = "./modules/front_door"
  name                = var.cdn_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = "Premium_AzureFrontDoor"
}
