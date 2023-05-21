locals {
  certificate_common_names      = var.certificate_common_name != null && var.certificate_common_names_x509_store_name != null
  reverse_proxy_certificate     = var.reverse_proxy_certificate_thumbprint != null && var.reverse_proxy_certificate_thumbprint_secondary != null && var.reverse_proxy_certificate_x509_store_name != null
}

#----------------------------------------RESOURCE: SERVICE FABRIC CLUSTER----------------------------------#
resource "azurerm_service_fabric_cluster" "sfcluster" {
  name                              = var.service_fabric_cluster_name //
  resource_group_name               = var.resource_group_name
  location                          = var.location
  reliability_level                 = var.reliability_level
  management_endpoint               = var.management_endpoint
  upgrade_mode                      = var.upgrade_mode
  vm_image                          = var.vm_image
  cluster_code_version              = var.upgrade_mode == "Manual" || var.cluster_code_version != null ? var.cluster_code_version : null
  add_on_features                   = var.add_on_features
  service_fabric_zonal_upgrade_mode = var.service_fabric_zonal_upgrade_mode
  vmss_zonal_upgrade_mode           = var.vmss_zonal_upgrade_mode

  dynamic "azure_active_directory" {
    for_each = var.tenant_id != null && var.cluster_application_id != null && var.client_application_id != null ? [1] : []
    content {
      tenant_id              = var.tenant_id
      cluster_application_id = var.cluster_application_id
      client_application_id  = var.client_application_id
    }
  }

  dynamic "certificate_common_names" {
    for_each = local.certificate_common_names ? [1] : []
    content {
      common_names {
        certificate_common_name       = var.certificate_common_name
        certificate_issuer_thumbprint = var.certificate_issuer_thumbprint
      }
      x509_store_name = var.certificate_common_names_x509_store_name
    }
  }

  dynamic "certificate" {
    for_each = local.certificate_common_names != true && var.certificate_thumbprint != null && var.certificate_thumbprint_secondary != null && var.certificate_x509_store_name != null ? [1] : []
    content {
      thumbprint           = var.certificate_thumbprint
      thumbprint_secondary = var.certificate_thumbprint_secondary
      x509_store_name      = var.certificate_x509_store_name
    }
  }

  dynamic "reverse_proxy_certificate" {
    for_each = local.reverse_proxy_certificate ? [1] : []
    content {
      thumbprint           = var.reverse_proxy_certificate_thumbprint
      thumbprint_secondary = var.reverse_proxy_certificate_thumbprint_secondary
      x509_store_name      = var.reverse_proxy_certificate_x509_store_name
    }
  }

  dynamic "reverse_proxy_certificate_common_names" {
    for_each = local.reverse_proxy_certificate != true && var.reverse_proxy_certificate_common_names != null && var.reverse_proxy_certificate_common_names_x509_store_name != null ? [1] : []
    content {
      common_names {
        certificate_common_name       = var.reverse_proxy_certificate_common_names
        certificate_issuer_thumbprint = var.reverse_proxy_certificate_certificate_issuer_thumbprint
      }
      x509_store_name = var.reverse_proxy_certificate_common_names_x509_store_name
    }
  }

  dynamic "client_certificate_thumbprint" {
    for_each = var.client_certificate_thumbprint != null ? [1] : []
    content {
      thumbprint = client_certificate_thumbprint.value.thumbprint 
      is_admin   = client_certificate_thumbprint.value.is_admin   
    }
  }

  dynamic "client_certificate_common_name" {
    for_each = var.client_certificate_thumbprint == null && var.client_certificate_common_name != null ? [1] : []
    content {
      common_name                   = var.client_certificate_common_name
      //certificate_issuer_thumbprint = var.client_certificate_common_name_certificate_issuer_thumbprint //(not supported)
      is_admin                      = var.client_certificate_common_name_is_admin
    }
  }

  dynamic "diagnostics_config" {
    for_each = var.storage_account_name != null && var.storage_account_name != null && var.storage_account_blob_endpoint != null && var.storage_account_queue_endpoint != null && var.storage_account_table_endpoint != null ? [1] : []
    content {
      storage_account_name       = var.storage_account_name
      protected_account_key_name = var.protected_account_key_name
      blob_endpoint              = var.storage_account_blob_endpoint
      queue_endpoint             = var.storage_account_queue_endpoint
      table_endpoint             = var.storage_account_table_endpoint
    }
  }

  dynamic "fabric_settings" {
    for_each = var.fabric_settings 
    content {
      name       = fabric_settings.value.name       
      parameters = fabric_settings.value.parameters 
    }
  }

  dynamic "node_type" {
    for_each = var.service_fabric_cluster_nodes 
    content {
      name                        = node_type.value.name
      placement_properties        = node_type.value.placement_properties
      capacities                  = node_type.value.capacities
      instance_count              = node_type.value.instance_count
      is_primary                  = node_type.value.is_primary
      is_stateless                = node_type.value.is_stateless
      multiple_availability_zones = node_type.value.multiple_availability_zones
      client_endpoint_port        = node_type.value.client_endpoint_port
      http_endpoint_port          = node_type.value.http_endpoint_port
      durability_level            = node_type.value.durability_level
      reverse_proxy_endpoint_port = node_type.value.reverse_proxy_endpoint_port

      dynamic "application_ports" {
        for_each = node_type.value.application_ports
        content {
          start_port = application_ports.value.start_port
          end_port   = application_ports.value.end_port
        }
      }

      dynamic "ephemeral_ports" {
        for_each = node_type.value.ephemeral_ports
        content {
          start_port = ephemeral_ports.value.start_port
          end_port   = ephemeral_ports.value.end_port
        }
      }
    }
  }
  dynamic "upgrade_policy" {
    for_each = var.upgrade_policy
    content {
      //force_restart                     = var.upgrade_policy_force_restart //(not supported)
      health_check_retry_timeout        = upgrade_policy.value.health_check_retry_timeout
      health_check_stable_duration      = upgrade_policy.value.health_check_stable_duration
      health_check_wait_duration        = upgrade_policy.value.health_check_wait_duration
      upgrade_domain_timeout            = upgrade_policy.value.upgrade_domain_timeout
      upgrade_replica_set_check_timeout = upgrade_policy.value.upgrade_replica_set_check_timeout
      upgrade_timeout                   = upgrade_policy.value.upgrade_timeout   

      dynamic "health_policy" {
        for_each = upgrade_policy.value.health_policy 
        content {
          max_unhealthy_applications_percent = health_policy.value.max_unhealthy_applications_percent
          max_unhealthy_nodes_percent        = health_policy.value.max_unhealthy_nodes_percent         
        }
      }  
      dynamic "delta_health_policy" {
        for_each = upgrade_policy.value.delta_health_policy 
        content {
          max_delta_unhealthy_applications_percent         = delta_health_policy.value.max_delta_unhealthy_applications_percent
          max_delta_unhealthy_nodes_percent                = delta_health_policy.value.max_delta_unhealthy_nodes_percent
          max_upgrade_domain_delta_unhealthy_nodes_percent = delta_health_policy.value.max_upgrade_domain_delta_unhealthy_nodes_percent
        }
      }
    }
  }
  
  tags = var.tags
}
