module "container_group_module" {
  source              = "../../modules/module_container-group"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  identity_config = [{
    type         = var.identity_config.0.type
    identity_ids = var.identity_config.0.identity_ids
  }]

  init_container_config = [{
    name                         = var.init_container_config.0.name
    image                        = var.init_container_config.0.image
    environment_variables        = var.init_container_config.0.secure_environment_variables
    secure_environment_variables = var.init_container_config.0.environment_variables
    commands                     = var.init_container_config.0.commands
    volume = [{
      name                 = var.init_container_config.0.volume.0.name
      mount_path           = var.init_container_config.0.volume.0.mount_path
      read_only            = var.init_container_config.0.volume.0.read_only
      empty_dir            = var.init_container_config.0.volume.0.empty_dir
      storage_account_name = var.init_container_config.0.volume.0.storage_account_name
      storage_account_key  = var.init_container_config.0.volume.0.storage_account_key
      share_name           = var.init_container_config.0.volume.0.share_name
      git_repo = [{
        url       = var.init_container_config.0.volume.0.git_repo.0.url
        directory = var.init_container_config.0.volume.0.git_repo.0.directory
        revision  = var.init_container_config.0.volume.0.git_repo.0.revision
      }]
      secret = var.init_container_config.0.volume.0.secret
    }]
  }]

  container_config = [{
    name   = var.container_config.0.name
    image  = var.container_config.0.image
    cpu    = var.container_config.0.cpu
    memory = var.container_config.0.memory
    gpu = [{
      count = var.container_config.0.gpu.0.count
      sku   = var.container_config.0.gpu.0.sku
    }]
    cpu_limit    = var.container_config.0.cpu_limit
    memory_limit = var.container_config.0.memory_limit
    gpu_limit = [{
      count = var.container_config.0.gpu_limit.0.count
      sku   = var.container_config.0.gpu_limit.0.sku
    }]
    ports = [{
      port     = var.container_config.0.ports.0.port
      protocol = var.container_config.0.ports.0.protocol
    }]
    environment_variables        = var.container_config.0.environment_variables
    secure_environment_variables = var.container_config.0.secure_environment_variables
    readiness_probe = [{
      //one and only one of exec and http_get can be specified
      exec                  = var.container_config.0.readiness_probe.0.exec
      initial_delay_seconds = var.container_config.0.readiness_probe.0.initial_delay_seconds
      period_seconds        = var.container_config.0.readiness_probe.0.period_seconds
      failure_threshold     = var.container_config.0.readiness_probe.0.failure_threshold
      success_threshold     = var.container_config.0.readiness_probe.0.success_threshold
      timeout_seconds       = var.container_config.0.readiness_probe.0.timeout_seconds
    }]
    liveness_probe = [{
      //one and only one of exec and http_get can be specified
      http_get = [{
        path         = var.container_config.0.liveness_probe.0.http_get.0.path
        port         = var.container_config.0.liveness_probe.0.http_get.0.port
        scheme       = var.container_config.0.liveness_probe.0.http_get.0.scheme
        http_headers = var.container_config.0.liveness_probe.0.http_get.0.http_headers
      }]
      initial_delay_seconds = var.container_config.0.liveness_probe.0.initial_delay_seconds
      period_seconds        = var.container_config.0.liveness_probe.0.period_seconds
      failure_threshold     = var.container_config.0.liveness_probe.0.failure_threshold
      success_threshold     = var.container_config.0.liveness_probe.0.success_threshold
      timeout_seconds       = var.container_config.0.liveness_probe.0.timeout_seconds
    }]
    commands = var.container_config.0.commands
    volume = [{
      name                 = var.container_config.0.volume.0.name
      mount_path           = var.container_config.0.volume.0.mount_path
      read_only            = var.container_config.0.volume.0.read_only
      empty_dir            = var.container_config.0.volume.0.empty_dir
      storage_account_name = var.container_config.0.volume.0.storage_account_name
      storage_account_key  = var.container_config.0.volume.0.storage_account_key
      share_name           = var.container_config.0.volume.0.share_name
      git_repo = [{
        url       = var.container_config.0.volume.0.git_repo.0.url
        directory = var.container_config.0.volume.0.git_repo.0.directory
        revision  = var.container_config.0.volume.0.git_repo.0.revision
      }]
      secret = var.container_config.0.volume.0.secret
    }]
  }]

  os_type = var.os_type

  dns_config_config = [{
    nameservers    = var.dns_config_config.0.nameservers
    search_domains = var.dns_config_config.0.search_domains
    options        = var.dns_config_config.0.options
  }]

  diagnostics_config = [{
    log_analytics = [{
      log_type      = var.diagnostics_config.0.log_analytics.0.log_type
      workspace_id  = var.diagnostics_config.0.log_analytics.0.workspace_id
      workspace_key = var.diagnostics_config.0.log_analytics.0.workspace_key
      metadata      = var.diagnostics_config.0.log_analytics.0.metadata
    }]
  }]

  dns_name_label              = var.dns_name_label
  dns_name_label_reuse_policy = var.dns_name_label_reuse_policy

  exposed_port_config = [{
    port     = var.exposed_port_config.0.port
    protocol = var.exposed_port_config.0.protocol
  }]

  ip_address_type  = var.ip_address_type
  key_vault_key_id = var.key_vault_key_id
  subnet_ids       = var.subnet_ids

  image_registry_credential_config = [{
    user_assigned_identity_id = var.image_registry_credential_config.0.user_assigned_identity_id
    username                  = var.image_registry_credential_config.0.username
    password                  = var.image_registry_credential_config.0.password
    server                    = var.image_registry_credential_config.0.server
  }]

  restart_policy = var.restart_policy
  zones          = var.zones
  tags           = var.tags
}