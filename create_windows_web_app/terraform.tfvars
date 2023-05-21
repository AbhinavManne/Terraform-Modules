resource_group_name = "common_rg"
location            = "East US"

name = "mainwindapp001"

service_plan_id = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.Web/serverfarms/testwindows"

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
client_affinity_enabled            = false
client_certificate_enabled         = false
client_certificate_mode            = "Optional"
enabled                            = true
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
  application_stack = [{
    dotnet_version = "v3.0"
    //node_version   = "12-LTS"
    //php_version    = "7.4"
    //python_version = "2.7"

    //java_container         = "JAVA"
    //java_container_version = "8"
    //java_version           = "1.8" 
     
    //docker_container_name     = "azure-app-service/samples/aspnethelloworld"
    //docker_container_registry = "mcr.microsoft.com"
    //docker_container_tag      = "latest"
  }]
  container_registry_managed_identity_client_id = null
  container_registry_use_managed_identity       = false
  default_documents                             = null
  cors = [{
    allowed_origins     = [""]
    support_credentials = false
  }]

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
  remote_debugging_enabled         = true
  remote_debugging_version         = "VS2019"
  local_mysql_enabled              = false
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
  storage_account_url = "https://teststorew.blob.core.windows.net/test?sp=r&st=2022-11-06T06:39:15Z&se=2022-11-08T14:39:15Z&spr=https&sv=2021-06-08&sr=c&sig=4L6Zjw4q99z6%2BfU3kEy%2B5JcXzP9hvyavFn%2B0lnQlxdE%3D"
}]

sticky_settings_config = [{
  app_setting_names       = null
  connection_string_names = ["funappstgacc01-connectionstring"]
}]

storage_account_config = [{
   access_key    = "JpSqCin5chYRaWCFxYhz3B3qfRs6s+/tH94jpafB6rDex1yxntXEt0cH0jT/gM70RBQr6SINJM6t+ASt4REoZg=="
   account_name  = "teststorew"
   name          = "testwindweb"
   share_name    = "test"
   type          = "AzureFiles"
   mount_path    = null
}]



tags = {
  contact_name  = "sharath"
  contact_email = "Sharath.Kumar.R.N@gds.ey.com"
  project       = "CIL"
  region        = "East US"
}

logs_config = [{
     detailed_error_messages = false
     failed_request_tracing  = false
     application_logs = [{
         file_system_level   = "Information"
          azure_blob_storage = [{
                level             = "Information"
                retention_in_days = 0
                sas_url           = "https://teststorew.blob.core.windows.net/test?sp=r&st=2022-11-06T06:39:15Z&se=2022-11-08T14:39:15Z&spr=https&sv=2021-06-08&sr=c&sig=4L6Zjw4q99z6%2BfU3kEy%2B5JcXzP9hvyavFn%2B0lnQlxdE%3D"
           }]
          }]
      http_logs = [{
          file_system = [{
               retention_in_days = 0
               retention_in_mb   = 25
             }]
         }]
  }]
             

//CREATED RESOURCES - 
//resource group - common_rg
//storage account - teststorew
//storage account for backup - test(storage account url)
//app service plan - testwindows
