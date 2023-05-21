variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "service_plan_id" {
  type        = string
}

variable "app_settings" {
  type        = map(any)
  default     = null
}

variable "auth_settings_config" {
  type = list(object({
    enabled                        = bool
    additional_login_parameters    = map(string)
    allowed_external_redirect_urls = list(string)
    default_provider               = string
    facebook = list(object({
      app_id       = string
      app_secret   = string
      oauth_scopes = list(string)
    }))
    google = list(object({
      client_id     = string
      client_secret = string
      oauth_scopes  = list(string)
    }))
    github = list(object({
      client_id     = string
      client_secret = string
      oauth_scopes  = list(string)
    }))
    microsoft = list(object({
      client_id     = string
      client_secret = string
      oauth_scopes  = list(string)
    }))
    twitter = list(object({
      consumer_key    = string
      consumer_secret = string
    }))
    issuer                        = string
    runtime_version               = string
    token_refresh_extension_hours = number
    token_store_enabled           = bool
    unauthenticated_client_action = string
    active_directory = list(object({
      client_id         = string
      client_secret     = string
      allowed_audiences = list(string)
    }))
  }))
  default = [{
    active_directory = [{
      allowed_audiences = null
      client_id         = "id"
      client_secret     = null
    }]
    additional_login_parameters = {
      email    = "abc",
      password = "123"
    }
    allowed_external_redirect_urls = [null]
    default_provider               = null
    enabled                        = false
    facebook = [{
      app_id       = "id"
      app_secret   = "secret"
      oauth_scopes = ["Slack", "Github"]
    }]
    google = [{
      client_id     = "id"
      client_secret = "secret"
      oauth_scopes  = ["Slack", "Github"]
    }]
    github = [{
      client_id     = "id"
      client_secret = "secret"
      oauth_scopes  = ["Slack", "Github"]
    }]
    microsoft = [{
      client_id     = "id"
      client_secret = "secret"
      oauth_scopes  = ["Slack", "Github"]
    }]
    twitter = [{
      consumer_key    = "key"
      consumer_secret = ""
    }]
    issuer                        = null
    runtime_version               = null
    token_refresh_extension_hours = 1
    token_store_enabled           = false
    unauthenticated_client_action = null
  }]
}

variable "connection_string_config" {
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  default = [{
    name  = null
    type  = "APIHub"
    value = null
  }]
}

variable "client_affinity_enabled" {
  type    = bool
  default = false  
}

variable "client_certificate_enabled" {
  type        = bool
  default     = false
}

variable "client_certificate_mode" {
  type        = string
  default     = "Optional"
}

variable "enabled" {
  type        = bool
  default     = null
}

variable "https_only" {
  type        = bool
  default     = false
}

variable "identity_config" {
  type = list(object({
    type         = string
    identity_ids = list(string)
  }))
  default = [{
    identity_ids = null
    type         = "SystemAssigned"
  }]
}

variable "key_vault_reference_identity_id" {
  type        = string
  default     = null
}

variable "site_config_config" {
  type = list(object({
    always_on                              = bool
    api_definition_url                     = string
    api_management_api_id                  = string
    app_command_line                       = string
    application_stack = list(object({
      dotnet_version = string
      //node_version   = string
      //php_version    = string
      //python_version = string

      //java_container         = string
      //java_container_version = string
      //java_version           = string

      //docker_container_name     = string
      //docker_container_registry = string
      //docker_container_tag      = string
    }))
    container_registry_managed_identity_client_id = string
    container_registry_use_managed_identity       = bool
    default_documents                             = list(string)
    cors = list(object({
      allowed_origins     = list(string)
      support_credentials = bool
    }))
    ftps_state                        = string
    health_check_path                 = string
    health_check_eviction_time_in_min = number
    http2_enabled                     = bool
    ip_restriction = list(object({
      ip_address                = string
      service_tag               = string
      virtual_network_subnet_id = string
      name                      = string
      priority                  = number
      action                    = string
      headers = list(object({
        x_azure_fdid      = list(string)
        x_fd_health_probe = list(string)
        x_forwarded_for   = list(string)
        x_forwarded_host  = list(string)
      }))
    }))
    load_balancing_mode              = string
    managed_pipeline_mode            = string
    minimum_tls_version              = string
    remote_debugging_enabled         = bool
    remote_debugging_version         = string
    local_mysql_enabled              = bool
    scm_ip_restriction = list(object({
      ip_address                = string
      service_tag               = string
      virtual_network_subnet_id = string
      name                      = string
      priority                  = number
      action                    = string
      headers = list(object({
        x_azure_fdid      = list(string)
        x_fd_health_probe = list(string)
        x_forwarded_for   = list(string)
        x_forwarded_host  = list(string)
      }))
    }))
    scm_minimum_tls_version     = string
    scm_use_main_ip_restriction = bool
    use_32_bit_worker           = bool
    vnet_route_all_enabled      = bool
    websockets_enabled          = bool
    worker_count                = number
    
  }))
  default = [{
    always_on                              = false
    api_definition_url                     = null
    api_management_api_id                  = null
    app_command_line                       = null
    app_scale_limit                        = null
    application_stack = [{
      dotnet_version = null
      //node_version   = null
      //php_version    = null
      //python_version = null

      
      //java_container         = null
      //java_container_version = null
      //java_version           = null

      //docker_container_name     = null
      //docker_container_registry = null
      //docker_container_tag      = "latest"
    }]
    container_registry_managed_identity_client_id = null
    container_registry_use_managed_identity       = false
    default_documents                             = null
    cors = [{
      allowed_origins     = null
      support_credentials = null
    }]
    ftps_state                        = null
    health_check_path                 = null
    health_check_eviction_time_in_min = null
    http2_enabled                     = false
    ip_restriction = [{
      action = null
      headers = [{
        x_azure_fdid      = null
        x_fd_health_probe = null
        x_forwarded_for   = null
        x_forwarded_host  = null
      }]
      ip_address                = null
      name                      = null
      priority                  = null
      service_tag               = null
      virtual_network_subnet_id = null
    }]
    load_balancing_mode              = null
    managed_pipeline_mode            = null
    minimum_tls_version              = null
    remote_debugging_enabled         = false
    remote_debugging_version         = null
    local_mysql_enabled              = null
    scm_ip_restriction = [{
      action = null
      headers = [{
        x_azure_fdid      = null
        x_fd_health_probe = null
        x_forwarded_for   = null
        x_forwarded_host  = null
      }]
      ip_address                = null
      name                      = null
      priority                  = null
      service_tag               = null
      virtual_network_subnet_id = null
    }]
    scm_minimum_tls_version     = "1.2"
    scm_use_main_ip_restriction = false
    use_32_bit_worker           = false
    vnet_route_all_enabled      = false
    websockets_enabled          = false
    worker_count                = null
    
  }]
}

variable "backup_config" {
  type = list(object({
    name = string
    schedule = list(object({
      frequency_interval       = number
      frequency_unit           = string
      keep_at_least_one_backup = bool
      retention_period_days    = number
      start_time               = string
    }))
    storage_account_url = string
    enabled             = bool
  }))
  default = [{
    enabled = false
    name    = "backupjob"
    schedule = [{
      frequency_interval       = 7
      frequency_unit           = "Day"
      keep_at_least_one_backup = false
      retention_period_days    = null
      start_time               = null
    }]
    storage_account_url = "url"
  }]
}

variable "sticky_settings_config" {
  type = list(object({
    app_setting_names       = list(string)
    connection_string_names = list(string)
  }))
  default = [{
    app_setting_names       = null
    connection_string_names = null
  }]
}

variable "storage_account_config" {
  type = list(object({
    access_key     = string
    account_name   = string
    name           = string
    share_name     = string
    type           = string
    mount_path     = string
    }))
  default = [{
    access_key     = null
    account_name   = null
    name           = null
    share_name     = null
    type           = null
    mount_path     = null
   }]
} 

variable "tags" {
  type        = map(any)  
  default     = null
}

variable "logs_config" {
  type = list(object({
     detailed_error_messages = bool
     failed_request_tracing  = bool
     application_logs = list(object({
        file_system_level = string
        azure_blob_storage = list(object({
              level             = string
              retention_in_days = number
              sas_url           = string
            }))
        
       }))
     http_logs = list(object({
        file_system = list(object({
             retention_in_days  = number
             retention_in_mb    = number
           }))
       }))
   })) 
  default = [{
       detailed_error_messages = false
       failed_request_tracing  = false
       application_logs = [{
          file_system_level = null
          azure_blob_storage = [{
                level             = null
                retention_in_days = null
                sas_url           = null
               }]
            }]
       http_logs = [{
          file_system = [{
               retention_in_days = null
               retention_in_mb   = null
            }]
         }]
       }]
}