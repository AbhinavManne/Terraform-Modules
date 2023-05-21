resource "azurerm_windows_web_app" "windows_web_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id
  app_settings        = var.app_settings
  
  dynamic "auth_settings" {
    for_each = var.auth_settings_config != null ? [1] : []
    content {
      enabled                        = var.auth_settings_config.0.enabled
      additional_login_parameters    = var.auth_settings_config.0.additional_login_parameters
      allowed_external_redirect_urls = var.auth_settings_config.0.allowed_external_redirect_urls
      default_provider               = var.auth_settings_config.0.default_provider
      dynamic "facebook" {
        for_each = var.auth_settings_config.0.default_provider == "Facebook" ? [1] : []
        content {
          app_id       = var.auth_settings_config.0.facebook.0.app_id
          app_secret   = var.auth_settings_config.0.facebook.0.app_secret
          oauth_scopes = var.auth_settings_config.0.facebook.0.oauth_scopes
        }
      }
      dynamic "github" {
        for_each = var.auth_settings_config.0.default_provider == "Github" ? [1] : []
        content {
          client_id     = var.auth_settings_config.0.github.0.client_id
          client_secret = var.auth_settings_config.0.github.0.client_secret
          oauth_scopes  = var.auth_settings_config.0.github.0.oauth_scopes
        }
      }
      dynamic "google" {
        for_each = var.auth_settings_config.0.default_provider == "Google" ? [1] : []
        content {
          client_id     = var.auth_settings_config.0.google.0.client_id
          client_secret = var.auth_settings_config.0.google.0.client_secret
          oauth_scopes  = var.auth_settings_config.0.google.0.oauth_scopes
        }
      }
      dynamic "microsoft" {
        for_each = var.auth_settings_config.0.default_provider == "Microsoft" ? [1] : []
        content {
          client_id     = var.auth_settings_config.0.microsoft.0.client_id
          client_secret = var.auth_settings_config.0.microsoft.0.client_secret
          oauth_scopes  = var.auth_settings_config.0.microsoft.0.oauth_scopes
        }
      }
      dynamic "twitter" {
        for_each = var.auth_settings_config.0.default_provider == "Twitter" ? [1] : []
        content {
          consumer_key    = var.auth_settings_config.0.twitter.0.consumer_key
          consumer_secret = var.auth_settings_config.0.twitter.0.consumer_secret
        }
      }
      issuer                        = var.auth_settings_config.0.issuer
      runtime_version               = var.auth_settings_config.0.runtime_version
      token_refresh_extension_hours = var.auth_settings_config.0.token_refresh_extension_hours
      token_store_enabled           = var.auth_settings_config.0.token_store_enabled
      unauthenticated_client_action = var.auth_settings_config.0.unauthenticated_client_action
      dynamic "active_directory" {
        for_each = var.auth_settings_config.0.active_directory != null ? [1] : []
        content {
          client_id         = var.auth_settings_config.0.active_directory.0.client_id
          client_secret     = var.auth_settings_config.0.active_directory.0.client_secret
          allowed_audiences = var.auth_settings_config.0.active_directory.0.allowed_audiences
        }
      }
    }
  }

  dynamic "connection_string" {
    for_each = var.connection_string_config != null ? [1] : []
    content {
      name  = var.connection_string_config.0.name
      type  = var.connection_string_config.0.type
      value = var.connection_string_config.0.value
    }
  }
  client_affinity_enabled            = var.client_affinity_enabled
  client_certificate_enabled         = var.client_certificate_enabled
  client_certificate_mode            = var.client_certificate_mode
  enabled                            = var.enabled
  https_only                         = var.https_only
  dynamic "identity" {
    for_each = var.identity_config != null ? [1] : []
    content {
      type         = var.identity_config.0.type
      identity_ids = var.identity_config.0.identity_ids
    }
  }
  key_vault_reference_identity_id = var.key_vault_reference_identity_id

  dynamic "site_config" {
    for_each = var.site_config_config != null ? [1] : []
    content {
      always_on                              = var.site_config_config.0.always_on
      api_definition_url                     = var.site_config_config.0.api_definition_url
      api_management_api_id                  = var.site_config_config.0.api_management_api_id
      app_command_line                       = var.site_config_config.0.app_command_line
      dynamic "application_stack" {
        for_each = var.site_config_config.0.application_stack != null ? [1] : []
        content {
          dotnet_version = var.site_config_config.0.application_stack.0.dotnet_version    //Note: For .net Application
          //node_version   = var.site_config_config.0.application_stack.0.node_version      //Note: For node Application
          //php_version    = var.site_config_config.0.application_stack.0.php_version       //Note: For php Application
          //python_version = var.site_config_config.0.application_stack.0.python_version    //Note: For python Application
          
          //Note: For Java Application
          //java_container         = var.site_config_config.0.application_stack.0.java_container
          //java_container_version = var.site_config_config.0.application_stack.0.java_container_version
          //java_version           = var.site_config_config.0.application_stack.0.java_version
          
          //Note: For docker Application
          //docker_container_name      = var.site_config_config.0.application_stack.0.docker_container_name
          //docker_container_registry  = var.site_config_config.0.application_stack.0.docker_container_registry
          //docker_container_tag       = var.site_config_config.0.application_stack.0.docker_container_tag
        }
      }
      container_registry_managed_identity_client_id = var.site_config_config.0.container_registry_managed_identity_client_id
      container_registry_use_managed_identity       = var.site_config_config.0.container_registry_use_managed_identity
      default_documents                             = var.site_config_config.0.default_documents
      dynamic "cors" {
        for_each = var.site_config_config.0.cors != null ? [1] : []
        content {
          allowed_origins     = var.site_config_config.0.cors.0.allowed_origins
          support_credentials = var.site_config_config.0.cors.0.support_credentials
        }
      }
      ftps_state                        = var.site_config_config.0.ftps_state
      health_check_path                 = var.site_config_config.0.health_check_path
      health_check_eviction_time_in_min = var.site_config_config.0.health_check_eviction_time_in_min
      http2_enabled                     = var.site_config_config.0.http2_enabled
      dynamic "ip_restriction" {
        for_each = var.site_config_config.0.ip_restriction != null ? [1] : []
        content {
          ip_address                = var.site_config_config.0.ip_restriction.0.ip_address
          service_tag               = var.site_config_config.0.ip_restriction.0.service_tag
          virtual_network_subnet_id = var.site_config_config.0.ip_restriction.0.virtual_network_subnet_id
          name                      = var.site_config_config.0.ip_restriction.0.name
          priority                  = var.site_config_config.0.ip_restriction.0.priority
          action                    = var.site_config_config.0.ip_restriction.0.action
          dynamic "headers" {
          for_each = var.site_config_config.0.ip_restriction.0.headers != null ? [1] : []
            content {
              x_azure_fdid      = var.site_config_config.0.ip_restriction.0.headers.0.x_azure_fdid
              x_fd_health_probe = var.site_config_config.0.ip_restriction.0.headers.0.x_fd_health_probe
              x_forwarded_for   = var.site_config_config.0.ip_restriction.0.headers.0.x_forwarded_for
              x_forwarded_host  = var.site_config_config.0.ip_restriction.0.headers.0.x_forwarded_host
            }
          }
        }
      }
      load_balancing_mode              = var.site_config_config.0.load_balancing_mode
      managed_pipeline_mode            = var.site_config_config.0.managed_pipeline_mode
      minimum_tls_version              = var.site_config_config.0.minimum_tls_version
      remote_debugging_enabled         = var.site_config_config.0.remote_debugging_enabled
      remote_debugging_version         = var.site_config_config.0.remote_debugging_version
      local_mysql_enabled              = var.site_config_config.0.local_mysql_enabled
      
      dynamic "scm_ip_restriction" {
        for_each = var.site_config_config.0.scm_ip_restriction != null ? [1] : []
        content {
          ip_address                = var.site_config_config.0.scm_ip_restriction.0.ip_address
          service_tag               = var.site_config_config.0.scm_ip_restriction.0.service_tag
          virtual_network_subnet_id = var.site_config_config.0.scm_ip_restriction.0.virtual_network_subnet_id
          name                      = var.site_config_config.0.scm_ip_restriction.0.name
          priority                  = var.site_config_config.0.scm_ip_restriction.0.priority
          action                    = var.site_config_config.0.scm_ip_restriction.0.action
          dynamic "headers" {
            for_each = var.site_config_config.0.scm_ip_restriction.0.headers != null ? [1] : []
            content {
              x_azure_fdid      = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_azure_fdid
              x_fd_health_probe = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_fd_health_probe
              x_forwarded_for   = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_forwarded_for
              x_forwarded_host  = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_forwarded_host
            }
          }
        }
      }
      scm_minimum_tls_version     = var.site_config_config.0.scm_minimum_tls_version
      scm_use_main_ip_restriction = var.site_config_config.0.scm_use_main_ip_restriction
      use_32_bit_worker           = var.site_config_config.0.use_32_bit_worker
      vnet_route_all_enabled      = var.site_config_config.0.vnet_route_all_enabled
      websockets_enabled          = var.site_config_config.0.websockets_enabled
      worker_count                = var.site_config_config.0.worker_count
    }
  }
  dynamic "backup" {
    for_each = var.backup_config != null ? [1] : []
    content {
      name = var.backup_config.0.name
      dynamic "schedule" {
        for_each = var.backup_config.0.schedule != null ? [1] : []
        content {
          frequency_interval       = var.backup_config.0.schedule.0.frequency_interval
          frequency_unit           = var.backup_config.0.schedule.0.frequency_unit
          keep_at_least_one_backup = var.backup_config.0.schedule.0.keep_at_least_one_backup
          retention_period_days    = var.backup_config.0.schedule.0.retention_period_days
          start_time               = var.backup_config.0.schedule.0.start_time
        }
      }
      storage_account_url = var.backup_config.0.storage_account_url
      enabled             = var.backup_config.0.enabled
    }
  }
  sticky_settings {
    app_setting_names       = var.sticky_settings_config.0.app_setting_names
    connection_string_names = var.sticky_settings_config.0.connection_string_names
  }

  dynamic "storage_account" {
     for_each = var.storage_account_config != null ? [1] : []
     content {
        access_key   = var.storage_account_config.0.access_key
        account_name = var.storage_account_config.0.account_name
        name         = var.storage_account_config.0.name
        share_name   = var.storage_account_config.0.share_name
        type         = var.storage_account_config.0.type
        mount_path   = var.storage_account_config.0.mount_path
     }
 }

dynamic "logs" {
  for_each = var.logs_config != null ? [1] : []
  content {
    detailed_error_messages   = var.logs_config.0.detailed_error_messages
    failed_request_tracing    = var.logs_config.0.failed_request_tracing  
    dynamic "application_logs" {
      for_each = var.logs_config.0.application_logs != null ? [1] : []
      content {
        file_system_level     = var.logs_config.0.application_logs.0.file_system_level
        dynamic "azure_blob_storage" {
          for_each = var.logs_config.0.application_logs.0.azure_blob_storage != null ? [1] : []
          content {
            level             = var.logs_config.0.application_logs.0.azure_blob_storage.0.level
            retention_in_days = var.logs_config.0.application_logs.0.azure_blob_storage.0.retention_in_days
            sas_url           = var.logs_config.0.application_logs.0.azure_blob_storage.0.sas_url
             }
           }
          }
          }

     dynamic "http_logs" {
       for_each = var.logs_config.0.http_logs != null ? [1] : []
       content {
          dynamic "file_system" {
            for_each = var.logs_config.0.http_logs.0.file_system != null ? [1] : []
            content {
               retention_in_days = var.logs_config.0.http_logs.0.file_system.0.retention_in_days
               retention_in_mb   = var.logs_config.0.http_logs.0.file_system.0.retention_in_mb
                }
              }
            }
           }
           }
     }

  tags  = var.tags
}