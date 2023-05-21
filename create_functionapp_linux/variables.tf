#ASP
variable "asp_name" {
  type        = string
  description = "Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
}

variable "asp_kind" {
  type        = string
  description = " The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). "
  default     = "Windows"
}

variable "asp_reserved" {
  type        = bool
  description = " Is this App Service Plan Reserved."
  default     = false
}

variable "asp_sku_tier" {
  type        = string
  description = "Specifies the plan's pricing tier."
}

variable "asp_sku_size" {
  type        = string
  description = "Specifies the plan's instance size."
}

#FUNCTION APP
variable "function_app_name" {
  type        = string
  description = "The name which should be used for this Linux Function App."
}

variable "location" {
  type        = string
  description = "Location of the Function App."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "app_settings" {
  type        = map(any)
  description = "A map of key-value pairs for App Settings and custom values."
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
  description = "Authentication settings for the function app."
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
  description = "Connection string settings for the function app."
  default = [{
    name  = null
    type  = "APIHub"
    value = null
  }]
}

variable "client_certificate_enabled" {
  type        = bool
  description = "Should the function app use Client Certificates."
  default     = false
}

variable "client_certificate_mode" {
  type        = string
  description = "The mode of the Function App's client certificates requirement for incoming requests."
  default     = "Optional"
}

variable "client_certificate_exclusion_paths" {
  type        = string
  description = "Paths to exclude when using client certificates, separated by ;"
  default     = ""
}

variable "daily_memory_time_quota" {
  type        = number
  description = "The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects function apps under the consumption plan."
  default     = 0
}

variable "enabled" {
  type        = bool
  description = "Is the Function App enabled?"
  default     = null
}

variable "content_share_force_disabled" {
  type        = bool
  description = "Should the settings for linking the Function App to storage be suppressed."
  default     = false
}

variable "functions_extension_version" {
  type        = string
  description = "The runtime version associated with the Function App."
  default     = "~4"
}

variable "enable_builtin_logging" {
  type        = bool
  description = "Should built in logging be enabled."
  default     = false
}

variable "https_only" {
  type        = bool
  description = "Can the Function App only be accessed via HTTPS?"
  default     = false
}

variable "identity_config" {
  type = list(object({
    type         = string
    identity_ids = list(string)
  }))
  description = " Identity settings for the function app."
  default = [{
    identity_ids = null
    type         = "SystemAssigned"
  }]
}

variable "key_vault_reference_identity_id" {
  type        = string
  description = "The User Assigned Identity ID used for accessing KeyVault secrets."
  default     = null
}

variable "site_config_config" {
  type = list(object({
    always_on                              = bool
    api_definition_url                     = string
    api_management_api_id                  = string
    app_command_line                       = string
    application_insights_connection_string = string
    application_insights_key               = string
    app_scale_limit                        = number
    application_stack = list(object({
      dotnet_version = string
    }))
    app_service_logs = list(object({
      disk_quota_mb         = number
      retention_period_days = number
    }))
    container_registry_managed_identity_client_id = string
    container_registry_use_managed_identity       = bool
    default_documents                             = list(string)
    cors = list(object({
      allowed_origins     = list(string)
      support_credentials = bool
    }))
    elastic_instance_minimum          = number
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
    pre_warmed_instance_count        = number
    remote_debugging_enabled         = bool
    remote_debugging_version         = string
    runtime_scale_monitoring_enabled = bool
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
  description = "Site configuration settings for the function app."
  default = [{
    always_on                              = false
    api_definition_url                     = null
    api_management_api_id                  = null
    app_command_line                       = null
    application_insights_connection_string = null
    application_insights_key               = null
    app_scale_limit                        = null
    application_stack = [{
      dotnet_version = "3.1"
    }]
    app_service_logs = [{
      disk_quota_mb         = 30
      retention_period_days = 100
    }]
    container_registry_managed_identity_client_id = ""
    container_registry_use_managed_identity       = false
    default_documents                             = null
    cors = [{
      allowed_origins     = null
      support_credentials = null
    }]
    dotnet_framework_version          = null
    elastic_instance_minimum          = null
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
    pre_warmed_instance_count        = null
    remote_debugging_enabled         = false
    remote_debugging_version         = null
    runtime_scale_monitoring_enabled = false
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
  description = "Backup settings for the function app. It is mandatory to pass all the arguments in the object."
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
  description = "Sticky settings for the function app."
  default = [{
    app_setting_names       = null
    connection_string_names = null
  }]
}

variable "storage_key_vault_secret_id" {
  type        = string
  description = "The Key Vault Secret ID, optionally including version, that contains the Connection String to connect to the storage account for this Function App."
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "The subnet id which will be used by this Function App for regional virtual network integration."
  default     = ""
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags which should be assigned to the Linux Function App."
  default     = null
}