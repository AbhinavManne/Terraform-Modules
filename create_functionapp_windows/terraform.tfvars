#ASP
asp_name     = "fapp-asp-001"
asp_kind     = "Windows"
asp_reserved = false
asp_sku_tier = "Standard"
asp_sku_size = "S1"

#FUNCTION APP
resource_group_name = "funapprg"
location            = "East US"

function_app_name = "mainfuncapp001"

auth_settings_config = [{
  active_directory = [{
    allowed_audiences = null
    client_id         = "id"
    client_secret     = null
  }]
  additional_login_parameters = {
    email    = "abc",
    password = "123"
  }
  allowed_external_redirect_urls = ["https://portal.azure.com"]
  default_provider               = "Facebook"
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
    consumer_secret = "secret"
  }]
  issuer                        = null
  runtime_version               = "~1"
  token_refresh_extension_hours = 1
  token_store_enabled           = false
  unauthenticated_client_action = "RedirectToLoginPage"
}]

connection_string_config = [{
  name  = "funappstgacc01-connectionstring"
  type  = "Custom"
  value = "DefaultEndpointsProtocol=https;AccountName=funappstgacc01;AccountKey=ayq3+Q3TRDP2ZD0qnK6NYhShLDDs8ms1OF/hbBL8NsZ1qJys70PFHGgRPQ5i+eZo2pmi0catMXoT+ASt/P2bYA==;EndpointSuffix=core.windows.net"
}]

client_certificate_enabled         = false
client_certificate_mode            = "Optional"
client_certificate_exclusion_paths = ""
daily_memory_time_quota            = 2
enabled                            = true
enable_builtin_logging             = true
https_only                         = false

identity_config = [{
  identity_ids = null
  type         = "SystemAssigned"
}]

site_config_config = [{
  always_on                              = false
  api_definition_url                     = null
  api_management_api_id                  = null
  app_command_line                       = null
  application_insights_connection_string = "InstrumentationKey=f0a73d26-eeb5-49c9-a05f-93643a4b68d7;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/;LiveEndpoint=https://centralus.livediagnostics.monitor.azure.com/"
  application_insights_key               = "f0a73d26-eeb5-49c9-a05f-93643a4b68d7"
  app_scale_limit                        = 1
  application_stack = [{
    dotnet_version = "3.1"
  }]
  app_service_logs = [{
    disk_quota_mb         = 40
    retention_period_days = 30
  }]
  default_documents = null
  cors = [{
    allowed_origins     = [""]
    support_credentials = false
  }]

  elastic_instance_minimum          = 1
  ftps_state                        = "Disabled"
  health_check_path                 = "/health"
  health_check_eviction_time_in_min = 2
  http2_enabled                     = true
  ip_restriction = [{
    action = "Allow"
    headers = [{
      x_azure_fdid      = null
      x_fd_health_probe = null
      x_forwarded_for   = null
      x_forwarded_host  = null
    }]
    ip_address                = "10.0.1.0/24"
    name                      = "fapp-ip_restriction-001"
    priority                  = 100
    service_tag               = null
    virtual_network_subnet_id = null
  }]
  load_balancing_mode              = null
  managed_pipeline_mode            = null
  minimum_tls_version              = "1.1"
  pre_warmed_instance_count        = 2
  remote_debugging_enabled         = true
  remote_debugging_version         = "VS2019"
  runtime_scale_monitoring_enabled = false
  scm_ip_restriction = [{
    action = "Deny"
    headers = [{
      x_azure_fdid      = null
      x_fd_health_probe = null
      x_forwarded_for   = null
      x_forwarded_host  = null
    }]
    ip_address                = "10.0.1.0/24"
    name                      = "fapp-scm_ip_restriction-001"
    priority                  = 200
    service_tag               = null
    virtual_network_subnet_id = null
  }]
  scm_minimum_tls_version     = "1.0"
  scm_use_main_ip_restriction = false
  use_32_bit_worker           = false
  vnet_route_all_enabled      = false
  websockets_enabled          = false
  worker_count                = null
}]

backup_config = [{
  enabled = false
  name    = "fappbackupjob"
  schedule = [{
    frequency_interval       = 7
    frequency_unit           = "Day"
    keep_at_least_one_backup = false
    retention_period_days    = 10
    start_time               = "2022-11-01T07:00:00.10Z"
  }]
  storage_account_url = "https://fappbackupstg.blob.core.windows.net/fappbackupcontainer?sp=r&st=2022-10-25T12:07:18Z&se=2022-10-25T20:07:18Z&spr=https&sv=2021-06-08&sr=c&sig=SnXWq64YQ1Rw98tDVnGnk9aZfhJ1L9Oyskch6dvONr0%3D"
}]

sticky_settings_config = [{
  app_setting_names       = null
  connection_string_names = ["funappstgacc01-connectionstring"]
}]

storage_key_vault_secret_id = "https://funapp-key-vault001.vault.azure.net/secrets/fapp-connection-string-secret/74cc654b6e0842e1a4238a74ae2e92fe"

tags = {
  contact_name  = "Mitali Ghoshal"
  contact_email = "mitali.ghoshal@gds.ey.com"
  project       = "CIL"
  region        = "East US"
}


//CREATED RESOURCES - 
//resource group - funapprg
//key vault to store stg acc access key - funapp-key-vault
//storage account - funappstgacc01 -> use customer managed keys -> Key vault: funapp-key-vault, Key: fapp-stg-vaultkey ->system-assigned
//storage account for backup - fappbackupstg
//log analytics workspace - any
//app insights - funappinsights