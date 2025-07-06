provider "azurerm" {
  features {}
  subscription_id = "001a4eb4-4cb2-47b9-a3bd-de9b5304872c"
}
resource "azurerm_storage_account" "res-0" {
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

resource "azurerm_container_registry" "res-0" {
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

