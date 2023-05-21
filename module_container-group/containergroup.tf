resource "azurerm_container_group" "container_group" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "identity" {
    for_each = var.identity_config != null ? [1] : []
    content {
      //When type is set to SystemAssigned, the identity of the Principal ID can be retrieved after the container group has been created
      type         = var.identity_config.0.type
      identity_ids = var.identity_config.0.identity_ids
    }
  }

  dynamic "init_container" {
    for_each = var.init_container_config.0.name != "" && var.init_container_config.0.image != "" ? [1] : []
    content {
      name                         = var.init_container_config.0.name
      image                        = var.init_container_config.0.image
      environment_variables        = var.init_container_config.0.secure_environment_variables
      secure_environment_variables = var.init_container_config.0.environment_variables
      commands                     = var.init_container_config.0.commands
      dynamic "volume" {
        for_each = var.init_container_config.0.volume.0.name != "" && var.init_container_config.0.volume.0.mount_path != "" ? [1] : []
        content {
          //Exactly one of empty_dir volume, git_repo volume, secret volume or storage account volume (share_name, storage_account_name, and storage_account_key) must be specified.
          //when using a storage account volume, all of share_name, storage_account_name, and storage_account_key must be specified.
          name                 = var.init_container_config.0.volume.0.name
          mount_path           = var.init_container_config.0.volume.0.mount_path
          read_only            = var.init_container_config.0.volume.0.read_only
          empty_dir            = var.init_container_config.0.volume.0.empty_dir
          storage_account_name = var.init_container_config.0.volume.0.storage_account_name
          storage_account_key  = var.init_container_config.0.volume.0.storage_account_key
          share_name           = var.init_container_config.0.volume.0.share_name
          dynamic "git_repo" {
            for_each = var.init_container_config.0.volume.0.git_repo != null ? [1] : []
            content {
              url       = var.init_container_config.0.volume.0.git_repo.0.url
              directory = var.init_container_config.0.volume.0.git_repo.0.directory
              revision  = var.init_container_config.0.volume.0.git_repo.0.revision
            }
          }
          secret = var.init_container_config.0.volume.0.secret
        }
      }
    }
  }

  container {
    name   = var.container_config.0.name
    image  = var.container_config.0.image
    cpu    = var.container_config.0.cpu
    memory = var.container_config.0.memory
    dynamic "gpu" {
      //Gpu resources are currently only supported in Linux containers.
      for_each = var.container_config.0.gpu != null ? [1] : []
      content {
        count = var.container_config.0.gpu.0.count
        sku   = var.container_config.0.gpu.0.sku
      }
    }
    cpu_limit    = var.container_config.0.cpu_limit
    memory_limit = var.container_config.0.memory_limit
    dynamic "gpu_limit" {
      for_each = var.container_config.0.gpu_limit != null ? [1] : []
      content {
        count = var.container_config.0.gpu_limit.0.count
        sku   = var.container_config.0.gpu_limit.0.sku
      }
    }

    dynamic "ports" {
      //Omitting these blocks will default the exposed ports on the group to all ports on all containers defined in the container blocks of this group.
      //for_each = var.container_config.0.ports != null ? [1] : []
      for_each = var.container_config.0.ports.0.protocol == "TCP" || var.container_config.0.ports.0.protocol == "UDP" ? [1] : []
      content {
        port     = var.container_config.0.ports.0.port
        protocol = var.container_config.0.ports.0.protocol
      }
    }

    environment_variables        = var.container_config.0.environment_variables
    secure_environment_variables = var.container_config.0.secure_environment_variables

    dynamic "readiness_probe" {
      for_each = var.container_config.0.readiness_probe != null ? [1] : []
      content {
        //one and only one of exec and http_get can be specified
        exec                  = var.container_config.0.readiness_probe.0.exec
        initial_delay_seconds = var.container_config.0.readiness_probe.0.initial_delay_seconds
        period_seconds        = var.container_config.0.readiness_probe.0.period_seconds
        failure_threshold     = var.container_config.0.readiness_probe.0.failure_threshold
        success_threshold     = var.container_config.0.readiness_probe.0.success_threshold
        timeout_seconds       = var.container_config.0.readiness_probe.0.timeout_seconds
      }
    }

    dynamic "liveness_probe" {
      for_each = var.container_config.0.liveness_probe != null ? [1] : []
      content {
        //one and only one of exec and http_get can be specified
        dynamic "http_get" {
          for_each = var.container_config.0.liveness_probe.0.http_get != null ? [1] : []
          content {
            path         = var.container_config.0.liveness_probe.0.http_get.0.path
            port         = var.container_config.0.liveness_probe.0.http_get.0.port
            scheme       = var.container_config.0.liveness_probe.0.http_get.0.scheme
            http_headers = var.container_config.0.liveness_probe.0.http_get.0.http_headers
          }
        }
        initial_delay_seconds = var.container_config.0.liveness_probe.0.initial_delay_seconds
        period_seconds        = var.container_config.0.liveness_probe.0.period_seconds
        failure_threshold     = var.container_config.0.liveness_probe.0.failure_threshold
        success_threshold     = var.container_config.0.liveness_probe.0.success_threshold
        timeout_seconds       = var.container_config.0.liveness_probe.0.timeout_seconds
      }
    }

    commands = var.container_config.0.commands

    dynamic "volume" {
      for_each = var.container_config.0.volume.0.name != "" && var.container_config.0.volume.0.mount_path != "" ? [1] : []
      content {
        name                 = var.container_config.0.volume.0.name
        mount_path           = var.container_config.0.volume.0.mount_path
        read_only            = var.container_config.0.volume.0.read_only
        empty_dir            = var.container_config.0.volume.0.empty_dir
        storage_account_name = var.container_config.0.volume.0.storage_account_name
        storage_account_key  = var.container_config.0.volume.0.storage_account_key
        share_name           = var.container_config.0.volume.0.share_name
        dynamic "git_repo" {
          for_each = var.container_config.0.volume.0.git_repo != null ? [1] : []
          content {
            url       = var.container_config.0.volume.0.git_repo.0.url
            directory = var.container_config.0.volume.0.git_repo.0.directory
            revision  = var.container_config.0.volume.0.git_repo.0.revision
          }
        }
        secret = var.container_config.0.volume.0.secret
        //The secret values must be supplied as Base64 encoded strings, such as by using the Terraform base64encode function. The secret values are decoded to their original values when mounted in the volume on the container.
      }
    }
  }

  //if os_type is set to Windows, currently only a single container block is supported. Windows containers are not supported in virtual networks.
  os_type = var.os_type

  /*dynamic "dns_config" {
        for_each = var.dns_config_config != null ? [1] : []
        content {
            nameservers = var.dns_config_config.0.nameservers
            search_domains = var.dns_config_config.0.search_domains
            options = var.dns_config_config.0.options
        }
    }*/

  //dns_config - DNS label/name is not supported when deploying to virtual networks.

  dynamic "diagnostics" {
    for_each = var.diagnostics_config.0.log_analytics.0.workspace_id != "" && var.diagnostics_config.0.log_analytics.0.workspace_key != "" ? [1] : []
    content {
      log_analytics {
        log_type      = var.diagnostics_config.0.log_analytics.0.log_type
        workspace_id  = var.diagnostics_config.0.log_analytics.0.workspace_id
        workspace_key = var.diagnostics_config.0.log_analytics.0.workspace_key
        metadata      = var.diagnostics_config.0.log_analytics.0.metadata
      }
    }
  }

  //dns_name_label and os_type set to windows are not compatible with ip_address_type as Private

  //dns_name_label = var.dns_name_label
  //dns_name_label_reuse_policy = var.dns_name_label_reuse_policy

  dynamic "exposed_port" {
    //Removing all exposed_port blocks requires setting exposed_port = [].
    for_each = var.exposed_port_config.0.port != null && var.exposed_port_config.0.protocol != null ? [1] : []
    content {
      //The exposed_port can only contain ports that are also exposed on one or more containers in the group.
      port     = var.exposed_port_config.0.port
      protocol = var.exposed_port_config.0.protocol
    }
  }

  ip_address_type  = var.ip_address_type
  key_vault_key_id = var.key_vault_key_id
  //subnet_ids = var.subnet_ids

  // If ip_address_type is set to Private, subnet_ids also needs to be set.
  // If ip_address_type is set to Public, dns_name_label and dns_name_label_reuse_policy needs to be set
  // If ip_address_type is set to None, nothing needs to be set

  dynamic "image_registry_credential" {
    for_each = var.image_registry_credential_config.0.server != null && ((var.image_registry_credential_config.0.username != "" && var.image_registry_credential_config.0.password != "") || var.image_registry_credential_config.0.user_assigned_identity_id != null) ? [1] : []
    content {
      //Currently you can't use a managed identity in a container group deployed to a virtual network.
      username = var.image_registry_credential_config.0.username
      password = var.image_registry_credential_config.0.password
      server   = var.image_registry_credential_config.0.server
    }
  }

  restart_policy = var.restart_policy
  //zones = var.zones
  tags = var.tags
}