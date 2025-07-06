provider "azurerm" {
  features {}
  subscription_id = "001a4eb4-4cb2-47b9-a3bd-de9b5304872c"
}

# Storage Account
resource "azurerm_storage_account" "storage-account" {
  access_tier                       = "Hot"
  account_kind                      = "StorageV2"
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  allow_nested_items_to_be_public   = false
  cross_tenant_replication_enabled  = false
  default_to_oauth_authentication   = false
  dns_endpoint_type                 = "Standard"
  https_traffic_only_enabled        = true
  infrastructure_encryption_enabled = false
  is_hns_enabled                    = false
  large_file_share_enabled          = true
  local_user_enabled                = true
  location                          = "uksouth"
  min_tls_version                   = "TLS1_2"
  name                              = "taskapptfstate"
  nfsv3_enabled                     = false
  public_network_access_enabled     = true
  queue_encryption_key_type         = "Service"
  resource_group_name               = "app-prod-rg"
  sftp_enabled                      = false
  shared_access_key_enabled         = true
  table_encryption_key_type         = "Service"
  tags                              = {}
  blob_properties {
    change_feed_enabled      = false
    last_access_time_enabled = false
    versioning_enabled       = false
    container_delete_retention_policy {
      days = 7
    }
    delete_retention_policy {
      days                     = 7
      permanent_delete_enabled = false
    }
  }
  share_properties {
    retention_policy {
      days = 7
    }
  }
}

# Azure Container Registry
resource "azurerm_container_registry" "container-registry" {
  admin_enabled                 = true
  anonymous_pull_enabled        = false
  data_endpoint_enabled         = false
  export_policy_enabled         = true
  location                      = "uksouth"
  name                          = "olaolat"
  network_rule_bypass_option    = "AzureServices"
  public_network_access_enabled = true
  quarantine_policy_enabled     = false
  resource_group_name           = "app-prod-rg"
  sku                           = "Standard"
  trust_policy_enabled          = false
  zone_redundancy_enabled       = false
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log-analytics-workspace" {
  allow_resource_only_permissions         = true
  cmk_for_query_forced                    = false
  daily_quota_gb                          = -1
  immediate_data_purge_on_30_days_enabled = false
  internet_ingestion_enabled              = true
  internet_query_enabled                  = true
  location                                = "uksouth"
  name                                    = "workspaceappprodrga4fe"
  resource_group_name                     = "app-prod-rg"
  retention_in_days                       = 30
  sku                                     = "PerGB2018"
  tags                                    = {}
}

# DNS Zone
resource "azurerm_dns_zone" "dns-zone" {
  name                = "taskmanagement-app.com"
  resource_group_name = "app-prod-rg"
  tags                = {}
  soa_record {
    email         = "azuredns-hostmaster.microsoft.com"
    expire_time   = 2419200
    minimum_ttl   = 300
    refresh_time  = 3600
    retry_time    = 300
    serial_number = 1
    tags          = {}
    ttl           = 3600
  }
}

# Container App
resource "azurerm_container_app" "container-app" {
  container_app_environment_id = "/subscriptions/001a4eb4-4cb2-47b9-a3bd-de9b5304872c/resourceGroups/app-prod-rg/providers/Microsoft.App/managedEnvironments/managedEnvironment"
  max_inactive_revisions       = 100
  name                         = "task-app"
  resource_group_name          = "app-prod-rg"
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"
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
    server   = "olaolat.azurecr.io"
  }
  template {
    max_replicas = 1
    min_replicas = 1
    container {
      cpu    = 0.5
      image  = "olaolat.azurecr.io/task-app:latest"
      memory = "1Gi"
      name   = "task-app"
    }
  }
}

# Container Apps Environment
resource "azurerm_container_app_environment" "container-app-environment" {
  location                   = "uksouth"
  log_analytics_workspace_id = "/subscriptions/001a4eb4-4cb2-47b9-a3bd-de9b5304872c/resourceGroups/app-prod-rg/providers/Microsoft.OperationalInsights/workspaces/workspaceappprodrga4fe"
  logs_destination           = "log-analytics"
  mutual_tls_enabled         = false
  name                       = "managedEnvironment"
  resource_group_name        = "app-prod-rg"
}

# Azure Front Door
resource "azurerm_cdn_frontdoor_profile" "front-door" {
  name                     = "afd-profile"
  resource_group_name      = "app-prod-rg"
  response_timeout_seconds = 60
  sku_name                 = "Premium_AzureFrontDoor"
  tags                     = {}
}
