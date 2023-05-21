
resource "azurerm_kubernetes_cluster" "main" {
  location                            = var.location
  name                                = var.cluster_name
  resource_group_name                 = var.resource_group_name
  api_server_authorized_ip_ranges     = var.api_server_authorized_ip_ranges
  azure_policy_enabled                = var.azure_policy_enabled
  disk_encryption_set_id              = var.disk_encryption_set_id
  dns_prefix                          = var.prefix
  dns_prefix_private_cluster          = var.prefix == null ? var.dns_prefix_private_cluster : null
  automatic_channel_upgrade           = var.automatic_channel_upgrade
  http_application_routing_enabled    = var.http_application_routing_enabled
  kubernetes_version                  = var.kubernetes_version
  local_account_disabled              = var.local_account_disabled
  node_resource_group                 = var.node_resource_group
  oidc_issuer_enabled                 = var.oidc_issuer_enabled
  open_service_mesh_enabled           = var.open_service_mesh_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  role_based_access_control_enabled   = var.role_based_access_control_enabled
  sku_tier                            = var.sku_tier
  public_network_access_enabled       = var.public_network_access_enabled
  run_command_enabled                 = var.run_command_enabled
  tags                                = var.tags

  #this block is required by default 

  default_node_pool {

    name                         = var.agents_pool_name
    vm_size                      = var.agents_size
    enable_auto_scaling          = var.enable_auto_scaling != null ? var.enable_auto_scaling : null
    enable_host_encryption       = var.enable_host_encryption != null ? var.enable_host_encryption : null
    enable_node_public_ip        = var.enable_node_public_ip != null ? var.enable_node_public_ip : null
    max_count                    = var.agents_max_count != null ? var.agents_max_count : null
    max_pods                     = var.agents_max_pods != null ? var.agents_max_pods : null
    min_count                    = var.agents_min_count != null ? var.agents_min_count : null
    node_count                   = var.enable_auto_scaling == true ? null : var.node_count
    node_labels                  = var.agents_labels != null ? var.agents_labels : null
    only_critical_addons_enabled = var.only_critical_addons_enabled != null ? var.only_critical_addons_enabled : null
    orchestrator_version         = var.orchestrator_version != null ? var.orchestrator_version : null
    os_disk_size_gb              = var.os_disk_size_gb != null ? var.os_disk_size_gb : null
    os_disk_type                 = var.os_disk_type != null ? var.os_disk_type : null
    tags                         = merge(var.tags, var.agents_tags)
    type                         = var.agents_type != null ? var.agents_type : null
    vnet_subnet_id               = var.network_plugin == "azure" ? var.vnet_subnet_id : null
    zones                        = var.agents_availability_zones != null ? var.agents_availability_zones : null


    dynamic "kubelet_config" {
      for_each = var.kubelet_config != null ? [1] : []
      content {
        allowed_unsafe_sysctls    = lookup(var.kubelet_config, "allowed_unsafe_sysctls", null)
        container_log_max_line    = lookup(var.kubelet_config, "container_log_max_line", null)
        container_log_max_size_mb = lookup(var.kubelet_config, "container_log_max_size_mb", null)
        cpu_cfs_quota_enabled     = lookup(var.kubelet_config, "cpu_cfs_quota_enabled", null)
        cpu_cfs_quota_period      = lookup(var.kubelet_config, "cpu_cfs_quota_period", null)
        cpu_manager_policy        = lookup(var.kubelet_config, "cpu_manager_policy", null)
        image_gc_high_threshold   = lookup(var.kubelet_config, "image_gc_high_threshold", null)
        image_gc_low_threshold    = lookup(var.kubelet_config, "image_gc_low_threshold", null)
        pod_max_pid               = lookup(var.kubelet_config, "pod_max_pid", null)
        topology_manager_policy   = lookup(var.kubelet_config, "topology_manager_policy", null)
      }
    }

    dynamic "linux_os_config" {
      for_each = var.linux_os_config == null ? [] : [1]
      content {
        swap_file_size_mb             = lookup(var.linux_os_config, "allowed_unsafe_sysctls", null)
        transparent_huge_page_defrag  = lookup(var.linux_os_config, "transparent_huge_page_defrag", null)
        transparent_huge_page_enabled = lookup(var.linux_os_config, "transparent_huge_page_enabled", null)

        dynamic "sysctl_config" {
          for_each = try(var.linux_os_config.sysctl_config, null) == null ? [] : [1]
          content {
            fs_aio_max_nr                      = var.linux_os_config.sysctl_config.fs_aio_max_nr
            fs_file_max                        = var.linux_os_config.sysctl_config.fs_file_max
            fs_inotify_max_user_watches        = var.linux_os_config.sysctl_config.fs_inotify_max_user_watches
            fs_nr_open                         = var.linux_os_config.sysctl_config.fs_nr_open
            kernel_threads_max                 = var.linux_os_config.sysctl_config.kernel_threads_max
            net_core_netdev_max_backlog        = var.linux_os_config.sysctl_config.net_core_netdev_max_backlog
            net_core_optmem_max                = var.linux_os_config.sysctl_config.net_core_optmem_max
            net_core_rmem_default              = var.linux_os_config.sysctl_config.net_core_rmem_default
            net_core_rmem_max                  = var.linux_os_config.sysctl_config.net_core_rmem_max
            net_core_somaxconn                 = var.linux_os_config.sysctl_config.net_core_somaxconn
            net_core_wmem_default              = var.linux_os_config.sysctl_config.net_core_wmem_default
            net_core_wmem_max                  = var.linux_os_config.sysctl_config.net_core_wmem_max
            net_ipv4_ip_local_port_range_max   = var.linux_os_config.sysctl_config.net_ipv4_ip_local_port_range_max
            net_ipv4_ip_local_port_range_min   = var.linux_os_config.sysctl_config.net_ipv4_ip_local_port_range_min
            net_ipv4_neigh_default_gc_thresh1  = var.linux_os_config.sysctl_config.net_ipv4_neigh_default_gc_thresh1
            net_ipv4_neigh_default_gc_thresh2  = var.linux_os_config.sysctl_config.net_ipv4_neigh_default_gc_thresh2
            net_ipv4_neigh_default_gc_thresh3  = var.linux_os_config.sysctl_config.net_ipv4_neigh_default_gc_thresh3
            net_ipv4_tcp_fin_timeout           = var.linux_os_config.sysctl_config.net_ipv4_tcp_fin_timeout
            net_ipv4_tcp_keepalive_intvl       = var.linux_os_config.sysctl_config.net_ipv4_tcp_keepalive_intvl
            net_ipv4_tcp_keepalive_probes      = var.linux_os_config.sysctl_config.net_ipv4_tcp_keepalive_probes
            net_ipv4_tcp_keepalive_time        = var.linux_os_config.sysctl_config.net_ipv4_tcp_keepalive_time
            net_ipv4_tcp_max_syn_backlog       = var.linux_os_config.sysctl_config.net_ipv4_tcp_max_syn_backlog
            net_ipv4_tcp_max_tw_buckets        = var.linux_os_config.sysctl_config.net_ipv4_tcp_max_tw_buckets
            net_ipv4_tcp_tw_reuse              = var.linux_os_config.sysctl_config.net_ipv4_tcp_tw_reuse
            net_netfilter_nf_conntrack_buckets = var.linux_os_config.sysctl_config.net_netfilter_nf_conntrack_buckets
            net_netfilter_nf_conntrack_max     = var.linux_os_config.sysctl_config.net_netfilter_nf_conntrack_max
            vm_max_map_count                   = var.linux_os_config.sysctl_config.vm_max_map_count
            vm_swappiness                      = var.linux_os_config.sysctl_config.vm_swappiness
            vm_vfs_cache_pressure              = var.linux_os_config.sysctl_config.vm_vfs_cache_pressure
          }
        }
      }
    }


    dynamic "upgrade_settings" {
      for_each = var.upgrade_settings == null ? [] : [1]
      content {
        max_surge = var.upgrade_settings.max_surge
      }
    }
  }


  dynamic "aci_connector_linux" {
    for_each = var.subnet_name != null ? [1] : []
    content {
      subnet_name = var.subnet_name
    }
  }

  dynamic "auto_scaler_profile" {
    for_each = var.auto_scaler_profile != null ? [1] : []

    content {
      balance_similar_node_groups      = lookup(var.auto_scaler_profile, "balance_similar_node_groups", null)
      expander                         = lookup(var.auto_scaler_profile, "expander", null)
      max_graceful_termination_sec     = lookup(var.auto_scaler_profile, "max_graceful_termination_sec", null)
      max_node_provisioning_time       = lookup(var.auto_scaler_profile, "max_node_provisioning_time", null)
      max_unready_nodes                = lookup(var.auto_scaler_profile, "max_unready_nodes", null)
      max_unready_percentage           = lookup(var.auto_scaler_profile, "max_unready_percentage", null)
      new_pod_scale_up_delay           = lookup(var.auto_scaler_profile, "new_pod_scale_up_delay", null)
      scale_down_delay_after_add       = lookup(var.auto_scaler_profile, "scale_down_delay_after_add", null)
      scale_down_delay_after_delete    = lookup(var.auto_scaler_profile, "scale_down_delay_after_delete", null)
      scale_down_delay_after_failure   = lookup(var.auto_scaler_profile, "scale_down_delay_after_failure", null)
      scan_interval                    = lookup(var.auto_scaler_profile, "scan_interval", null)
      scale_down_unneeded              = lookup(var.auto_scaler_profile, "scale_down_unneeded", null)
      scale_down_unready               = lookup(var.auto_scaler_profile, "scale_down_unready", null)
      scale_down_utilization_threshold = lookup(var.auto_scaler_profile, "scale_down_utilization_threshold", null)
      empty_bulk_delete_max            = lookup(var.auto_scaler_profile, "empty_bulk_delete_max", null)
      skip_nodes_with_local_storage    = lookup(var.auto_scaler_profile, "skip_nodes_with_local_storage", null)
      skip_nodes_with_system_pods      = lookup(var.auto_scaler_profile, "skip_nodes_with_system_pods", null)
    }
  }

  dynamic "http_proxy_config" {
    for_each = var.http_proxy_config != null ? [1] : []
    content {
      http_proxy  = lookup(var.http_proxy_config, "http_proxy", null)
      https_proxy = lookup(var.http_proxy_config, "https_proxy", null)
      no_proxy    = lookup(var.http_proxy_config, "no_proxy", null)
      trusted_ca  = lookup(var.http_proxy_config, "trusted_ca", null)
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.role_based_access_control_enabled && var.rbac_aad_managed ? ["rbac"] : []

    content {
      admin_group_object_ids = var.rbac_aad_admin_group_object_ids != null ? var.rbac_aad_admin_group_object_ids : null
      azure_rbac_enabled     = var.rbac_aad_azure_rbac_enabled != null ? var.rbac_aad_azure_rbac_enabled : null
      managed                = true
      tenant_id              = var.rbac_aad_tenant_id != null ? var.rbac_aad_tenant_id : null
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.role_based_access_control_enabled && !var.rbac_aad_managed ? ["rbac"] : []

    content {
      client_app_id     = var.rbac_aad_client_app_id 
      managed           = false
      server_app_id     = var.rbac_aad_server_app_id 
      server_app_secret = var.rbac_aad_server_app_secret 
      tenant_id         = var.rbac_aad_tenant_id != null ? var.rbac_aad_tenant_id : null
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []

    content {
      type         = var.identity_type
      identity_ids = var.identity_ids != null ? var.identity_ids : null
    }
  }

  dynamic "ingress_application_gateway" {
    for_each = var.ingress_application_gateway_enabled ? ["ingress_application_gateway"] : []

    content {
      gateway_id   = var.ingress_application_gateway_id != null ? var.ingress_application_gateway_id : null
      gateway_name = var.ingress_application_gateway_name != null ? var.ingress_application_gateway_name : null
      subnet_cidr  = var.ingress_application_gateway_subnet_cidr != null ? var.ingress_application_gateway_subnet_cidr : null
      subnet_id    = var.ingress_application_gateway_subnet_id != null ? var.ingress_application_gateway_subnet_id : null
    }
  }

  dynamic "key_vault_secrets_provider" {
    for_each = var.key_vault_secrets_provider_enabled ? ["key_vault_secrets_provider"] : []

    content {
      secret_rotation_enabled  = var.secret_rotation_enabled
      secret_rotation_interval = var.secret_rotation_interval
    }
  }


  dynamic "maintenance_window" {
    for_each = var.maintenance_window != null ? [1] : []
    content {
      dynamic "allowed" {
        for_each = var.maintenance_window.allowed == null ? {} : var.maintenance_window.allowed
        content {
          day   = allowed.value.day
          hours = allowed.value.hours
        }
      }
      dynamic "not_allowed" {
        for_each = var.maintenance_window.not_allowed == null ? {} : var.maintenance_window.not_allowed
        content {
          end   = not_allowed.value.end
          start = not_allowed.value.start
        }
      }
    }
  }


  dynamic "linux_profile" {
    for_each = var.admin_username == null && var.public_ssh_key == null ? [] : ["linux_profile"]

    content {
      admin_username = var.admin_username

      ssh_key {
        key_data = var.public_ssh_key
      }
    }
  }

  dynamic "network_profile" {
    for_each = var.network_plugin != null ? [1] : []
    content {
      network_plugin     = var.network_plugin
      dns_service_ip     = var.net_profile_dns_service_ip != null ? var.net_profile_dns_service_ip : null
      docker_bridge_cidr = var.net_profile_docker_bridge_cidr != null ? var.net_profile_docker_bridge_cidr : null
      network_policy     = var.network_policy != null ? var.network_policy : null
      outbound_type      = var.net_profile_outbound_type != null ? var.net_profile_outbound_type : null
      pod_cidr           = var.network_plugin == "kubenet" ? var.net_profile_pod_cidr : null
      service_cidr       = var.net_profile_service_cidr != null ? var.net_profile_service_cidr : null



      dynamic "load_balancer_profile" {
        for_each = var.load_balancer_profile != null ? [1] : []
        content {
          managed_outbound_ip_count = lookup(var.load_balancer_profile, "managed_outbound_ip_count", null)
          outbound_ip_prefix_ids    = lookup(var.load_balancer_profile, "outbound_ip_prefix_ids", null)
          outbound_ip_address_ids   = lookup(var.load_balancer_profile, "outbound_ip_address_ids", null)
          idle_timeout_in_minutes   = lookup(var.load_balancer_profile, "idle_timeout_in_minutes", null)
          outbound_ports_allocated  = lookup(var.load_balancer_profile, "outbound_ports_allocated", null)
        }
      }

      dynamic "nat_gateway_profile" {
        for_each = var.nat_gateway_profile != null ? [1] : []
        content {
          idle_timeout_in_minutes   = lookup(var.nat_gateway_profile, "idle_timeout_in_minutes", null)
          managed_outbound_ip_count = lookup(var.nat_gateway_profile, "managed_outbound_ip_count", null)
        }
      }
    }
  }

  dynamic "oms_agent" {
    for_each = var.oms_agent == null ? [] : [1]

    content {
      log_analytics_workspace_id = var.oms_agent.log_analytics_workspace_id
    }
  }

  dynamic "service_principal" {
    for_each = var.client_id != "" && var.client_secret != "" ? ["service_principal"] : []

    content {
      client_id     = var.client_id
      client_secret = var.client_secret
    }
  }

  dynamic "windows_profile" {
    for_each = (var.network_plugin == "azure" || var.network_plugin == "none") && var.windows_profile != null ? [1] : []
    content {
      admin_username = var.windows_profile.admin_username
      admin_password = var.windows_profile.admin_password
      license        = var.windows_profile.license

    }
  }

  dynamic "kubelet_identity" {
    for_each = var.identity_type == "UserAssigned" ? [1] : []
    content {
      client_id                 = var.client_id_identity
      object_id                 = var.object_id
      user_assigned_identity_id = var.user_assigned_identity_id
    }
  }

}



resource "azurerm_kubernetes_cluster_node_pool" "additional" {
  for_each              = var.additional_node_pools != null ? { for k, v in var.additional_node_pools : k => v if v != null } : {}
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id

  name                   = each.key
  vm_size                = each.value["vm_size"]
  os_disk_size_gb        = lookup(each.value, "os_disk_size_gb", null)
  os_disk_type           = lookup(each.value, "os_disk_type", null)
  enable_auto_scaling    = lookup(each.value, "enable_auto_scaling", null)
  node_count             = (each.value["enable_auto_scaling"] ? null : each.value["node_count"])
  min_count              = (each.value["enable_auto_scaling"] ? each.value["min_count"] : null)
  max_count              = (each.value["enable_auto_scaling"] ? each.value["max_count"] : null)
  os_type                = lookup(each.value, "os_type", "Managed")
  enable_host_encryption = lookup(each.value, "enable_host_encryption", false)
  enable_node_public_ip  = lookup(each.value, "enable_node_public_ip", false)
  max_pods               = lookup(each.value, "max_pods", null)
  node_labels            = lookup(each.value, "node_labels", null)
  orchestrator_version   = lookup(each.value, "orchestrator_version", null)
  tags                   = each.value["tags"]
  vnet_subnet_id         = lookup(each.value, "subnet_id", null)

  node_taints                  = var.node_taints != null ? var.node_taints : null
  eviction_policy              = var.eviction_policy != null ? var.eviction_policy : null
  proximity_placement_group_id = var.proximity_placement_group_id != null ? var.proximity_placement_group_id : null
  spot_max_price               = var.spot_max_price != null ? var.spot_max_price : null
  priority                     = var.priority != null ? var.priority : null
  mode                         = var.mode != null ? var.mode : null

  dynamic "kubelet_config" {
    for_each = var.kubelet_config != null ? [1] : []
    content {
      allowed_unsafe_sysctls    = lookup(var.kubelet_config, "allowed_unsafe_sysctls", null)
      container_log_max_line    = lookup(var.kubelet_config, "container_log_max_line", null)
      container_log_max_size_mb = lookup(var.kubelet_config, "container_log_max_size_mb", null)
      cpu_cfs_quota_enabled     = lookup(var.kubelet_config, "cpu_cfs_quota_enabled", null)
      cpu_cfs_quota_period      = lookup(var.kubelet_config, "cpu_cfs_quota_period", null)
      cpu_manager_policy        = lookup(var.kubelet_config, "cpu_manager_policy", null)
      image_gc_high_threshold   = lookup(var.kubelet_config, "image_gc_high_threshold", null)
      image_gc_low_threshold    = lookup(var.kubelet_config, "image_gc_low_threshold", null)
      pod_max_pid               = lookup(var.kubelet_config, "pod_max_pid", null)
      topology_manager_policy   = lookup(var.kubelet_config, "topology_manager_policy", null)
    }
  }

  dynamic "linux_os_config" {
    for_each = var.linux_os_config_additional == null ? [] : [1]
    content {
      swap_file_size_mb             = var.linux_os_config_additional.allowed_unsafe_sysctls
      transparent_huge_page_defrag  = var.linux_os_config_additional.transparent_huge_page_defrag
      transparent_huge_page_enabled = var.linux_os_config_additional.transparent_huge_page_enabled

      dynamic "sysctl_config" {
        for_each = try(var.linux_os_config_additional.sysctl_config, null) == null ? [] : [1]
        content {
          fs_aio_max_nr                      = var.linux_os_config_additional.sysctl_config.fs_aio_max_nr
          fs_file_max                        = var.linux_os_config_additional.sysctl_config.fs_file_max
          fs_inotify_max_user_watches        = var.linux_os_config_additional.sysctl_config.fs_inotify_max_user_watches
          fs_nr_open                         = var.linux_os_config_additional.sysctl_config.fs_nr_open
          kernel_threads_max                 = var.linux_os_config_additional.sysctl_config.kernel_threads_max
          net_core_netdev_max_backlog        = var.linux_os_config_additional.sysctl_config.net_core_netdev_max_backlog
          net_core_optmem_max                = var.linux_os_config_additional.sysctl_config.net_core_optmem_max
          net_core_rmem_default              = var.linux_os_config_additional.sysctl_config.net_core_rmem_default
          net_core_rmem_max                  = var.linux_os_config_additional.sysctl_config.net_core_rmem_max
          net_core_somaxconn                 = var.linux_os_config_additional.sysctl_config.net_core_somaxconn
          net_core_wmem_default              = var.linux_os_config_additional.sysctl_config.net_core_wmem_default
          net_core_wmem_max                  = var.linux_os_config_additional.sysctl_config.net_core_wmem_max
          net_ipv4_ip_local_port_range_max   = var.linux_os_config_additional.sysctl_config.net_ipv4_ip_local_port_range_max
          net_ipv4_ip_local_port_range_min   = var.linux_os_config_additional.sysctl_config.net_ipv4_ip_local_port_range_min
          net_ipv4_neigh_default_gc_thresh1  = var.linux_os_config_additional.sysctl_config.net_ipv4_neigh_default_gc_thresh1
          net_ipv4_neigh_default_gc_thresh2  = var.linux_os_config_additional.sysctl_config.net_ipv4_neigh_default_gc_thresh2
          net_ipv4_neigh_default_gc_thresh3  = var.linux_os_config_additionalsysctl_config.net_ipv4_neigh_default_gc_thresh3
          net_ipv4_tcp_fin_timeout           = var.linux_os_config_additional.sysctl_config.net_ipv4_tcp_fin_timeout
          net_ipv4_tcp_keepalive_intvl       = var.linux_os_config_additional.sysctl_config.net_ipv4_tcp_keepalive_intvl
          net_ipv4_tcp_keepalive_probes      = var.linux_os_config_additional.sysctl_config.net_ipv4_tcp_keepalive_probes
          net_ipv4_tcp_keepalive_time        = var.linux_os_config_additional.sysctl_config.net_ipv4_tcp_keepalive_time
          net_ipv4_tcp_max_syn_backlog       = var.linux_os_config_additional.sysctl_config.net_ipv4_tcp_max_syn_backlog
          net_ipv4_tcp_max_tw_buckets        = var.linux_os_config_additional.sysctl_config.net_ipv4_tcp_max_tw_buckets
          net_ipv4_tcp_tw_reuse              = var.linux_os_config_additional.sysctl_config.net_ipv4_tcp_tw_reuse
          net_netfilter_nf_conntrack_buckets = var.linux_os_config_additional.sysctl_config.net_netfilter_nf_conntrack_buckets
          net_netfilter_nf_conntrack_max     = var.linux_os_config_additional.sysctl_config.net_netfilter_nf_conntrack_max
          vm_max_map_count                   = var.linux_os_config_additional.sysctl_config.vm_max_map_count
          vm_swappiness                      = var.linux_os_config_additional.sysctl_config.vm_swappiness
          vm_vfs_cache_pressure              = var.linux_os_config_additional.sysctl_config.vm_vfs_cache_pressure
        }
      }
    }

  }


  dynamic "upgrade_settings" {
    for_each = var.upgrade_settings_additional == null ? [] : [1]
    content {
      max_surge = var.upgrade_settings_additional.max_surge
    }
  }

}

