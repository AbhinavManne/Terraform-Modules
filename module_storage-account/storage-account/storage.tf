
locals {

  is_hns_enabled = var.account_tier == "Standard" || (var.account_tier == "Premium" && var.account_kind == "BlockBlobStorage") && var.is_hns_enabled ? true : false

}

resource "random_string" "unique" {
  length  = var.length
  special = var.special
  upper   = var.upper
}
#---------------------------------------------------Storage account-------------------------------------------------------#

resource "azurerm_storage_account" "sa" {
  name                             = substr(format("sta%s%s", lower(replace(var.storage_account_name, "/[[:^alnum:]]/", "")), random_string.unique.result), 0, 24)
  resource_group_name              = var.resource_group_name
  location                         = var.location
  account_tier                     = var.account_tier # Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid
  account_replication_type         = var.replication_type
  min_tls_version                  = var.min_tls_version
  tags                             = merge({ "ResourceName" = substr(format("sta%s%s", lower(replace(var.storage_account_name, "/[[:^alnum:]]/", "")), random_string.unique.result), 0, 24) }, var.tags, )
  account_kind                     = var.account_kind
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  access_tier                      = var.access_tier
  edge_zone                        = var.edge_zone
  enable_https_traffic_only        = var.enable_https_traffic_only
  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public
  shared_access_key_enabled        = var.shared_access_key_enabled
  is_hns_enabled                   = local.is_hns_enabled
  nfsv3_enabled                    = (var.account_tier == "Standard" && var.account_kind == "StorageV2") || (var.account_tier == "Premium" && var.account_kind == "BlockBlobStorage") && (local.is_hns_enabled == true) && (var.enable_https_traffic_only == false) && var.nfsv3_enabled == true ? true : false

  large_file_share_enabled = var.large_file_share_enabled

  dynamic "custom_domain" {
    for_each = var.custom_domain_name != null ? [1] : []
    content {
      name          = var.custom_domain_name
      use_subdomain = var.use_subdomain
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.account_kind == "StorageV2" && var.managed_identity_type == "UserAssigned" && var.key_vault_key_id != null ? [1] : []
    content {
      key_vault_key_id          = var.key_vault_key_id
      user_assigned_identity_id = var.user_assigned_identity_id
    }
  }

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }

  dynamic "static_website" {
    for_each = (var.account_kind == "StorageV2" || var.account_kind == "BlockBlobStorage") && var.enable_static_website == true ? [1] : []
    content {
      index_document     = var.static_website_index_document
      error_404_document = var.static_website_error_doc
    }
  }
  #--------------------------------------------------------------------------------------------------------------------
  dynamic "share_properties" {
    for_each = var.enable_share_properties ? [1] : []
    content {

      dynamic "cors_rule" {
        for_each = var.shared_properties_allowed_headers != null ? [1] : []
        content {
          allowed_headers    = var.shared_properties_allowed_headers
          allowed_methods    = var.shared_properties_allowed_methods
          allowed_origins    = var.shared_properties_allowed_origins
          exposed_headers    = var.shared_properties_exposed_headers
          max_age_in_seconds = var.shared_properties_max_age_in_sec
        }
      }

      dynamic "retention_policy" {
        for_each = var.retention_policy_days != null ? [1] : []
        content {
          days = var.retention_policy_days
        }
      }

      dynamic "smb" {
        for_each = var.smb_versions != null ? [1] : []
        content {
          versions                        = var.smb_versions
          authentication_types            = var.smb_authentication_types
          kerberos_ticket_encryption_type = var.smb_kerberos_ticket_encryption_type
          channel_encryption_type         = var.channel_encryption_type

        }
      }
    }
  }
  dynamic "azure_files_authentication" {
    for_each = var.directory_type != null ? [1] : []
    content {
      directory_type = var.directory_type

      dynamic "active_directory" {
        for_each = var.directory_type == "AD" ? [1] : []
        content {
          storage_sid         = var.storage_sid
          domain_name         = var.domain_name
          domain_sid          = var.domain_sid
          domain_guid         = var.domain_guid
          forest_name         = var.forest_name
          netbios_domain_name = var.netbios_domain_name
        }
      }
    }
  }

  dynamic "routing" {
    for_each = var.enable_routing ? [1] : []
    content {
      publish_internet_endpoints  = var.publish_internet_endpoints
      publish_microsoft_endpoints = var.publish_microsoft_endpoints
      choice                      = var.routing_choice
    }
  }


  dynamic "blob_properties" {
    for_each = var.enable_blob_properties ? [1] : []
    content {
      versioning_enabled            = var.enable_versioning
      last_access_time_enabled      = var.last_access_time_enabled
      change_feed_enabled           = var.change_feed_enabled
      change_feed_retention_in_days = var.change_feed_retention_in_days
      default_service_version       = var.default_service_version

      dynamic "cors_rule" {
        for_each = var.blob_properties_allowed_headers != null ? [1] : []
        content {
          allowed_headers    = var.blob_properties_allowed_headers
          allowed_methods    = var.blob_properties_allowed_methods
          allowed_origins    = var.blob_properties_allowed_origins
          exposed_headers    = var.blob_properties_exposed_headers
          max_age_in_seconds = var.blob_properties_max_age_in_seconds
        }
      }

      dynamic "delete_retention_policy" {
        for_each = var.blob_soft_delete_retention_days != null ? [1] : []
        content {
          days = var.blob_soft_delete_retention_days
        }
      }
      dynamic "container_delete_retention_policy" {
        for_each = var.container_soft_delete_retention_days != null ? [1] : []
        content {
          days = var.container_soft_delete_retention_days
        }
      }
    }
  }

  dynamic "queue_properties" {
    for_each = var.account_kind != "BlobStorage" ? [1] : []
    content {

      dynamic "cors_rule" {
        for_each = var.queue_properties_allowed_headers != null ? [1] : []
        content {
          allowed_headers    = var.queue_properties_allowed_headers
          allowed_methods    = var.queue_properties_allowed_methods
          allowed_origins    = var.queue_properties_allowed_origins
          exposed_headers    = var.queue_properties_exposed_headers
          max_age_in_seconds = var.queue_properties_max_age_in_seconds
        }
      }

      dynamic "logging" {
        for_each = var.logging_delete != null ? [1] : []
        content {
          delete                = var.logging_delete
          read                  = var.logging_read
          version               = var.logging_version
          write                 = var.logging_write
          retention_policy_days = var.logging_retention_policy_days
        }
      }

      dynamic "minute_metrics" {
        for_each = var.minute_metrics_enabled != null ? [1] : []
        content {
          enabled               = var.minute_metrics_enabled
          version               = var.minute_metrics_version
          include_apis          = var.minute_metrics_include_apis
          retention_policy_days = var.minute_metrics_retention_policy_days
        }
      }

      dynamic "hour_metrics" {
        for_each = var.hour_metrics_enabled != null ? [1] : []
        content {
          enabled               = var.hour_metrics_enabled
          version               = var.hour_metrics_version
          include_apis          = var.hour_metrics_include_apis
          retention_policy_days = var.hour_metrics_retention_policy_days
        }
      }
    }
  }
}


#------------------------------------------ Storage Account Network Rules ------------------------------------------------#

resource "azurerm_storage_account_network_rules" "storacc_nr" {
  storage_account_id         = azurerm_storage_account.sa.id
  default_action             = var.network_rule_default_action
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = [var.subnet_id]
  bypass                     = var.bypass

  dynamic "private_link_access" {
    for_each = var.endpoint_resource_id != null ? [1] : []
    content {
      endpoint_resource_id = var.endpoint_resource_id
      endpoint_tenant_id   = var.endpoint_tenant_id
    }
  }
}


#-------------------------------------------Storage encryption scope-------------------------------------------------------#

resource "azurerm_storage_encryption_scope" "scope" {
  for_each                           = var.encryption_scopes
  name                               = each.key
  storage_account_id                 = azurerm_storage_account.sa.id
  source                             = each.value.source_encryption
  infrastructure_encryption_required = each.value.enable_infrastructure_encryption
}

#----------------------------------------- Advanced Threat Protection -----------------------------------------------------#

resource "azurerm_advanced_threat_protection" "atp" {
  target_resource_id = azurerm_storage_account.sa.id
  enabled            = var.enable_advanced_threat_protection
}

