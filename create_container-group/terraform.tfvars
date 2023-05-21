#container group
name                = "container-group-new"
resource_group_name = "container-group-rg"
location            = "East US"

identity_config = [{
  type         = "SystemAssigned"
  identity_ids = null
}]

os_type = "Linux"

ip_address_type = "None"

init_container_config = [{
  commands                     = null
  environment_variables        = null
  image                        = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
  name                         = "tmpcontainer"
  secure_environment_variables = null
  volume = [{
    empty_dir = false
    git_repo = [{
      directory = null
      revision  = null
      url       = ""
    }]
    mount_path           = ""
    name                 = ""
    read_only            = false
    secret               = null
    share_name           = null
    storage_account_key  = null
    storage_account_name = null
  }]
}]

container_config = [{
  commands              = null
  cpu                   = 1.5
  cpu_limit             = null
  environment_variables = null
  gpu = [{
    count = 1
    sku   = "K80"
  }]
  gpu_limit = [{
    count = null
    sku   = null
  }]
  image = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
  liveness_probe = [{
    //one and only one of exec and http_get can be specified
    failure_threshold = 3
    http_get = [{
      http_headers = null
      path         = "/"
      port         = 8080
      scheme       = null
    }]
    initial_delay_seconds = 5
    period_seconds        = 10
    success_threshold     = 3
    timeout_seconds       = 2
  }]
  memory       = 3
  memory_limit = null
  name         = "containerinstance001"
  ports = [{
    port     = 80
    protocol = "TCP"
  }]
  readiness_probe = [{
    //one and only one of exec and http_get can be specified
    exec                  = ["/tmp/ready"]
    failure_threshold     = 3
    initial_delay_seconds = 5
    period_seconds        = 10
    success_threshold     = 3
    timeout_seconds       = 2
  }]
  secure_environment_variables = null
  volume = [{
    empty_dir = false
    git_repo = [{
      directory = null
      revision  = null
      url       = ""
    }]
    mount_path           = ""
    name                 = "containergroupcontainervolumename"
    read_only            = false
    secret               = null
    share_name           = null
    storage_account_key  = null
    storage_account_name = null
  }]
}]

image_registry_credential_config = [{
  password                  = ""
  server                    = "containergroupimageregistry.azurecr.io"
  user_assigned_identity_id = null
  username                  = ""
}]

diagnostics_config = [{
  log_analytics = [{
    log_type = null
    metadata = {
      diagnostic = "containergroup"
    }
    workspace_id  = ""
    workspace_key = ""
  }]
}]

exposed_port_config = [{
  port     = 80
  protocol = "TCP"
}]
