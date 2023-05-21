


resource "azurerm_data_factory_integration_runtime_azure_ssis" "integration_runtime" {

  data_factory_id = var.data_factory_id
  name            = var.integration_runtime_custom_name
  location        = var.location
  description     = var.integration_runtime_description

  node_size                        = lookup(var.integration_runtime_configuration, "node_size")
  number_of_nodes                  = lookup(var.integration_runtime_configuration, "number_of_nodes", 1)
  max_parallel_executions_per_node = lookup(var.integration_runtime_configuration, "max_parallel_executions_per_node", 1)
  edition                          = lookup(var.integration_runtime_configuration, "edition", "Standard")
  license_type                     = lookup(var.integration_runtime_configuration, "license_type", "LicenseIncluded")

  dynamic "catalog_info" {
    for_each = var.catalog_info != null ? [var.catalog_info] : []
    content {
      server_endpoint        = lookup(catalog_info.value, "server_endpoint")
      administrator_login    = lookup(catalog_info.value, "administrator_login", null)
      administrator_password = var.administrator_password != null ? var.administrator_password : null //lookup(catalog_info.value, "administrator_password", null)
      pricing_tier           = lookup(catalog_info.value, "pricing_tier", null)
      dual_standby_pair_name = lookup(catalog_info.value, "dual_standby_pair_name", null)
    }
  }


  dynamic "custom_setup_script" {
    for_each = var.custom_setup_script != null ? [var.custom_setup_script] : []
    content {
      blob_container_uri = lookup(custom_setup_script.value, "blob_container_uri")
      sas_token          = var.sas_token //data.azurerm_key_vault_secret.secret2.value//lookup(custom_setup_script.value, "sas_token")
    }
  }

  dynamic "express_custom_setup" {
    for_each = var.express_custom_setup != null ? [var.express_custom_setup] : []

    content {
      environment        = lookup(express_custom_setup.value, "environment", null)
      powershell_version = lookup(express_custom_setup.value, "powershell_version", null)

      dynamic "command_key" {
        for_each = lookup(express_custom_setup.value, "command_key", null)
        content {
          target_name = lookup(command_key.value, "target_name", null)
          user_name   = lookup(command_key.value, "user_name", null)
          password    = var.password != null ? var.password : null //data.azurerm_key_vault_secret.secret1.value//lookup(command_key.value, "password", null)

          dynamic "key_vault_password" {
            for_each = var.key_vault_password ? [1] : []
            content {
              linked_service_name = var.linked_service_name
              secret_name         = var.secret_name
              secret_version      = var.secret_version != null ? var.secret_version : null
              parameters          = var.parameters != null ? var.parameters : null

            }
          }

        }
      }

      dynamic "component" {
        for_each = lookup(express_custom_setup.value, "component", null)
        content {
          name    = lookup(component.value, "name")
          license = lookup(component.value, "license", null)

          dynamic "key_vault_license" {
            for_each = var.key_vault_license ? [1] : []
            content {
              linked_service_name = var.linked_service_name_1
              secret_name         = var.secret_name_1
              secret_version      = var.secret_version_1 != null ? var.secret_version_1 : null
              parameters          = var.parameters_1 != null ? var.parameters_1 : null
            }
          }

        }
      }
    }
  }


  dynamic "express_vnet_integration" {
    for_each = var.subnet_id != null ? [var.subnet_id] : []
    content {
      subnet_id = var.subnet_id
    }
  }

  dynamic "package_store" {
    for_each = var.package_store != null ? var.package_store : {}
    content {
      name                = lookup(package_store.value, "name")
      linked_service_name = lookup(package_store.value, "linked_service_name")
    }
  }

  dynamic "proxy" {
    for_each = var.proxy != null ? [var.proxy] : []
    content {
      self_hosted_integration_runtime_name = proxy.value.self_hosted_integration_runtime_name
      staging_storage_linked_service_name  = proxy.value.staging_storage_linked_service_name
      path                                 = proxy.value.path != null ? proxy.value.path : null
    }
  }

  dynamic "vnet_integration" {
    for_each = var.vnet_integration != null ? [var.vnet_integration] : []
    content {
      vnet_id     = lookup(vnet_integration.value, "subnet_name") != null ? lookup(vnet_integration.value, "vnet_id") : null
      subnet_name = lookup(vnet_integration.value, "subnet_id") == null ? lookup(vnet_integration.value, "subnet_name") : null
      subnet_id   = lookup(vnet_integration.value, "subnet_name") == null ? lookup(vnet_integration.value, "subnet_id") : null
      public_ips  = lookup(vnet_integration.value, "public_ips", null)

    }
  }
}
