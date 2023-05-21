#--------------------------------------MODULE FOR FUNCTION APP-------------------------------------------#
module "function_app_module" {
  source = "../../modules/module_functionapp_windows"

  asp_name     = var.asp_name
  asp_kind     = var.asp_kind
  asp_reserved = var.asp_reserved
  asp_sku_tier = var.asp_sku_tier
  asp_sku_size = var.asp_sku_size

  function_app_name   = var.function_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_settings        = var.app_settings
  auth_settings_config = [{
    enabled                        = var.auth_settings_config.0.enabled
    additional_login_parameters    = var.auth_settings_config.0.additional_login_parameters
    allowed_external_redirect_urls = var.auth_settings_config.0.allowed_external_redirect_urls
    default_provider               = var.auth_settings_config.0.default_provider
    facebook = [{
      app_id       = var.auth_settings_config.0.facebook.0.app_id
      app_secret   = var.auth_settings_config.0.facebook.0.app_secret
      oauth_scopes = var.auth_settings_config.0.facebook.0.oauth_scopes
    }]
    github = [{
      client_id     = var.auth_settings_config.0.github.0.client_id
      client_secret = var.auth_settings_config.0.github.0.client_secret
      oauth_scopes  = var.auth_settings_config.0.github.0.oauth_scopes
    }]
    google = [{
      client_id     = var.auth_settings_config.0.google.0.client_id
      client_secret = var.auth_settings_config.0.google.0.client_secret
      oauth_scopes  = var.auth_settings_config.0.google.0.oauth_scopes
    }]
    microsoft = [{
      client_id     = var.auth_settings_config.0.microsoft.0.client_id
      client_secret = var.auth_settings_config.0.microsoft.0.client_secret
      oauth_scopes  = var.auth_settings_config.0.microsoft.0.oauth_scopes
    }]
    twitter = [{
      consumer_key    = var.auth_settings_config.0.twitter.0.consumer_key
      consumer_secret = var.auth_settings_config.0.twitter.0.consumer_secret
    }]
    issuer                        = var.auth_settings_config.0.issuer
    runtime_version               = var.auth_settings_config.0.runtime_version
    token_refresh_extension_hours = var.auth_settings_config.0.token_refresh_extension_hours
    token_store_enabled           = var.auth_settings_config.0.token_store_enabled
    unauthenticated_client_action = var.auth_settings_config.0.unauthenticated_client_action

    active_directory = [{
      client_id         = var.auth_settings_config.0.active_directory.0.client_id
      client_secret     = var.auth_settings_config.0.active_directory.0.client_secret
      allowed_audiences = var.auth_settings_config.0.active_directory.0.allowed_audiences
    }]
  }]
  connection_string_config = [{
    name  = var.connection_string_config.0.name
    type  = var.connection_string_config.0.type
    value = var.connection_string_config.0.value
  }]
  client_certificate_enabled         = var.client_certificate_enabled
  client_certificate_mode            = var.client_certificate_mode
  client_certificate_exclusion_paths = var.client_certificate_exclusion_paths
  daily_memory_time_quota            = var.daily_memory_time_quota
  enabled                            = var.enabled
  content_share_force_disabled       = var.content_share_force_disabled
  functions_extension_version        = var.functions_extension_version
  enable_builtin_logging             = var.enable_builtin_logging
  https_only                         = var.https_only
  identity_config = [{
    type         = var.identity_config.0.type
    identity_ids = var.identity_config.0.identity_ids
  }]

  key_vault_reference_identity_id = var.key_vault_reference_identity_id
  site_config_config = [{
    always_on                              = var.site_config_config.0.always_on
    api_definition_url                     = var.site_config_config.0.api_definition_url
    api_management_api_id                  = var.site_config_config.0.api_management_api_id
    app_command_line                       = var.site_config_config.0.app_command_line
    application_insights_connection_string = var.site_config_config.0.application_insights_connection_string
    application_insights_key               = var.site_config_config.0.application_insights_key
    app_scale_limit                        = var.site_config_config.0.app_scale_limit
    application_stack = [{
      dotnet_version = var.site_config_config.0.application_stack.0.dotnet_version
    }]
    app_service_logs = [{
      disk_quota_mb         = var.site_config_config.0.app_service_logs.0.disk_quota_mb
      retention_period_days = var.site_config_config.0.app_service_logs.0.retention_period_days
    }]
    default_documents = var.site_config_config.0.default_documents
    cors = [{
      allowed_origins     = var.site_config_config.0.cors.0.allowed_origins
      support_credentials = var.site_config_config.0.cors.0.support_credentials
    }]
    elastic_instance_minimum          = var.site_config_config.0.elastic_instance_minimum
    ftps_state                        = var.site_config_config.0.ftps_state
    health_check_path                 = var.site_config_config.0.health_check_path
    health_check_eviction_time_in_min = var.site_config_config.0.health_check_eviction_time_in_min
    http2_enabled                     = var.site_config_config.0.http2_enabled
    ip_restriction = [{
      ip_address                = var.site_config_config.0.ip_restriction.0.ip_address
      service_tag               = var.site_config_config.0.ip_restriction.0.service_tag
      virtual_network_subnet_id = var.site_config_config.0.ip_restriction.0.virtual_network_subnet_id
      name                      = var.site_config_config.0.ip_restriction.0.name
      priority                  = var.site_config_config.0.ip_restriction.0.priority
      action                    = var.site_config_config.0.ip_restriction.0.action
      headers = [{
        x_azure_fdid      = var.site_config_config.0.ip_restriction.0.headers.0.x_azure_fdid
        x_fd_health_probe = var.site_config_config.0.ip_restriction.0.headers.0.x_fd_health_probe
        x_forwarded_for   = var.site_config_config.0.ip_restriction.0.headers.0.x_forwarded_for
        x_forwarded_host  = var.site_config_config.0.ip_restriction.0.headers.0.x_forwarded_host
      }]
    }]
    load_balancing_mode              = var.site_config_config.0.load_balancing_mode
    managed_pipeline_mode            = var.site_config_config.0.managed_pipeline_mode
    minimum_tls_version              = var.site_config_config.0.minimum_tls_version
    pre_warmed_instance_count        = var.site_config_config.0.pre_warmed_instance_count
    remote_debugging_enabled         = var.site_config_config.0.remote_debugging_enabled
    remote_debugging_version         = var.site_config_config.0.remote_debugging_version
    runtime_scale_monitoring_enabled = var.site_config_config.0.runtime_scale_monitoring_enabled
    scm_ip_restriction = [{
      ip_address                = var.site_config_config.0.scm_ip_restriction.0.ip_address
      service_tag               = var.site_config_config.0.scm_ip_restriction.0.service_tag
      virtual_network_subnet_id = var.site_config_config.0.scm_ip_restriction.0.virtual_network_subnet_id
      name                      = var.site_config_config.0.scm_ip_restriction.0.name
      priority                  = var.site_config_config.0.scm_ip_restriction.0.priority
      action                    = var.site_config_config.0.scm_ip_restriction.0.action
      headers = [{
        x_azure_fdid      = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_azure_fdid
        x_fd_health_probe = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_fd_health_probe
        x_forwarded_for   = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_forwarded_for
        x_forwarded_host  = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_forwarded_host
      }]
    }]
    scm_minimum_tls_version     = var.site_config_config.0.scm_minimum_tls_version
    scm_use_main_ip_restriction = var.site_config_config.0.scm_use_main_ip_restriction
    use_32_bit_worker           = var.site_config_config.0.use_32_bit_worker
    vnet_route_all_enabled      = var.site_config_config.0.vnet_route_all_enabled
    websockets_enabled          = var.site_config_config.0.websockets_enabled
    worker_count                = var.site_config_config.0.worker_count
  }]
  backup_config = [{
    name = var.backup_config.0.name
    schedule = [{
      frequency_interval       = var.backup_config.0.schedule.0.frequency_interval
      frequency_unit           = var.backup_config.0.schedule.0.frequency_unit
      keep_at_least_one_backup = var.backup_config.0.schedule.0.keep_at_least_one_backup
      retention_period_days    = var.backup_config.0.schedule.0.retention_period_days
      start_time               = var.backup_config.0.schedule.0.start_time
    }]
    storage_account_url = var.backup_config.0.storage_account_url
    enabled             = var.backup_config.0.enabled
  }]

  sticky_settings_config = [{
    app_setting_names       = var.sticky_settings_config.0.app_setting_names
    connection_string_names = var.sticky_settings_config.0.connection_string_names
  }]
  storage_key_vault_secret_id = var.storage_key_vault_secret_id
  tags                        = var.tags
}

