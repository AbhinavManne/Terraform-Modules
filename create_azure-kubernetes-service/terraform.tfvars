
resource_group_name       = "rg"
create_resource_group     = false
location                  = "east us"
prefix                    = "sqk56"
subnet_name               = null
network_plugin            = "kubenet" // or can take as "azure"  
open_service_mesh_enabled = true
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Azure_Kubernetes"
}





oms_agent = {
  log_analytics_workspace_id = "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourcegroups/rg/providers/microsoft.operationalinsights/workspaces/log123"
}




client_id_identity        = "47643b12-e489-4e98-beda-75321bedf02e"
object_id                 = "6cb2bd85-bf7d-4da8-9568-3f9d0fb76613"
user_assigned_identity_id = "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user123"
identity_ids              = ["/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user123"]

client_id = null //"00000000-0000-0000-0000-000000000000"
client_secret = null //"00000000-0000-0000-0000-000000000000"

rbac_aad_client_app_id = "00000000-0000-0000-0000-000000000000"
rbac_aad_server_app_id = "00000000-0000-0000-0000-000000000000"
rbac_aad_server_app_secret = "00000000-0000-0000-0000-000000000000"
rbac_aad_managed = false

cluster_name = "clust123"

api_server_authorized_ip_ranges = null //["137.117.106.90/29"]
azure_policy_enabled            = true
disk_encryption_set_id          = null

http_application_routing_enabled = true
kubernetes_version               = 1.22
local_account_disabled           = false
node_resource_group              = "noderg-new"
oidc_issuer_enabled              = false

private_cluster_enabled             = true
private_cluster_public_fqdn_enabled = false
private_dns_zone_id                 = null
role_based_access_control_enabled   = false
sku_tier                            = "Free"
agents_pool_name                    = "agent123"
agents_size                         = "Standard_B2s"
enable_auto_scaling                 = true
enable_host_encryption              = false
enable_node_public_ip               = false
agents_max_count                    = 79
agents_max_pods                     = 11
agents_min_count                    = 3
node_count                          = 4
agents_count                        = null
agents_labels                       = null
only_critical_addons_enabled        = false
orchestrator_version                = null
os_disk_size_gb                     = null
os_disk_type                        = "Managed"

agents_type                     = "VirtualMachineScaleSets"
vnet_subnet_id                  = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vn12/subnets/sub1"
agents_availability_zones       = [1, 2, 3]
rbac_aad_admin_group_object_ids = null
rbac_aad_azure_rbac_enabled     = true
//managed                = true
rbac_aad_tenant_id = null
identity_type      = "UserAssigned"


ingress_application_gateway_id          = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/applicationGateways/jikj"
ingress_application_gateway_name        = "jikj"
ingress_application_gateway_subnet_cidr = "10.0.0.0/24"
ingress_application_gateway_subnet_id   = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vn12/subnets/default"

secret_rotation_enabled  = true
secret_rotation_interval = "2m"

admin_username = null
public_ssh_key = null

net_profile_dns_service_ip     = "10.2.0.10"
net_profile_docker_bridge_cidr = "172.17.0.1/16"
network_policy                 = "calico" // or "azure"
net_profile_outbound_type      = null
net_profile_pod_cidr           = null
net_profile_service_cidr       = "10.2.0.0/24"



nat_gateway_profile = null

linux_os_config = {

  allowed_unsafe_sysctls = 1

  sysctl_config = {
    sys1 = {
      fs_aio_max_nr                      = 65537
      fs_file_max                        = 8191
      fs_inotify_max_user_watches        = 781251
      fs_nr_open                         = 8193
      kernel_threads_max                 = 21
      net_core_netdev_max_backlog        = 1001
      net_core_optmem_max                = 20481
      net_core_rmem_default              = 212993
      net_core_rmem_max                  = 212993
      net_core_somaxconn                 = 4097
      net_core_wmem_default              = 212993
      net_core_wmem_max                  = 212993
      net_ipv4_ip_local_port_range_max   = 1025
      net_ipv4_ip_local_port_range_min   = 1025
      net_ipv4_neigh_default_gc_thresh1  = 129
      net_ipv4_neigh_default_gc_thresh2  = null
      net_ipv4_neigh_default_gc_thresh3  = null
      net_ipv4_tcp_fin_timeout           = null
      net_ipv4_tcp_keepalive_intvl       = null
      net_ipv4_tcp_keepalive_probes      = null
      net_ipv4_tcp_keepalive_time        = null
      net_ipv4_tcp_max_syn_backlog       = null
      net_ipv4_tcp_max_tw_buckets        = null
      net_ipv4_tcp_tw_reuse              = null
      net_netfilter_nf_conntrack_buckets = null
      net_netfilter_nf_conntrack_max     = null
      vm_max_map_count                   = null
      vm_swappiness                      = null
      vm_vfs_cache_pressure              = null
    }
  }
  transparent_huge_page_defrag  = "always"
  transparent_huge_page_enabled = "always"
}


additional_node_pools = {
  node1 = {


    vm_size                      = "Standard_B2s"
    availability_zones           = [1, 2, 3]
    node_count                   = 1
    enable_auto_scaling          = false
    min_count                    = null
    max_count                    = null
    enable_host_encryption       = false
    enable_node_public_ip        = false
    max_pods                     = null
    node_labels                  = null
    only_critical_addons_enabled = false
    orchestrator_version         = null
    os_disk_size_gb              = null
    os_disk_type                 = "Managed"
    type                         = "VirtualMachineScaleSets"
    tags                         = null
    subnet_id                    = null # must be a key from node_pool_subnets variable
    //max_surge                    = "1"
    os_type = "Linux"
  }
}

# settings below not available in default node pools
mode                         = "User"
node_taints                  = null
eviction_policy              = null
priority                     = "Regular"
proximity_placement_group_id = null
spot_max_price               = null


auto_scaler_profile = {
  balance_similar_node_groups      = false
  empty_bulk_delete_max            = 10
  expander                         = "random"
  max_graceful_termination_sec     = 600
  max_node_provisioning_time       = "15m"
  max_unready_nodes                = 3
  max_unready_percentage           = 45
  new_pod_scale_up_delay           = "10s"
  scale_down_delay_after_add       = "10m"
  scale_down_delay_after_delete    = "10s"
  scale_down_delay_after_failure   = "3m"
  scale_down_unneeded              = "10m"
  scale_down_unready               = "20m"
  scale_down_utilization_threshold = 0.5
  scan_interval                    = "10s"
  skip_nodes_with_local_storage    = true
  skip_nodes_with_system_pods      = true
}

kubelet_config = {
  "config1" = {
    allowed_unsafe_sysctls    = ["value"]
    container_log_max_line    = 1
    container_log_max_size_mb = "value"
    cpu_cfs_quota_enabled     = false
    cpu_cfs_quota_period      = "value"
    cpu_manager_policy        = "value"
    image_gc_high_threshold   = 1
    image_gc_low_threshold    = 1
    pod_max_pid               = 1
    topology_manager_policy   = "value"
  }
}

# #----------------Alerts --------------------------------------#
# action_group_name        = "example-action-groupz"
# short_name               = "actiongz"
# action_group_rule_name   = "example-z"
# scope_type               = "Resource"
# activity_log_alert_name  = "example-activitylogalertz"
# operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
# category_log_alert       = "Security"
# metric_alert_name        = "example-metricalertz"
# metric_namespace         = "Microsoft.Storage/storageAccounts"
# metric_name              = "Transactions"
# aggregation              = "Total"
# operator                 = "GreaterThan"
# threshold                = 50
# dimension_name           = "ApiName"
# dimension_operator       = "Include"
# values                   = ["*"]

# #------------------Diagnostic settings---------------------------#
# enable_log_monitoring           = true
# diag_name                       = "resource-diag"
# target_resource_id              = null
# log_analytics_workspace_id      = null
# log_analytics_destination_type  = null #"Dedicated"
# storage_account_id              = "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet123/subnets/subnet123"
# eventhub_name                   = null
# eventhub_authorization_rule_id  = null
# log_enabled                     = true
# log_retention_policy_enabled    = true
# log_retention_days              = 7
# metric_retention_policy_enabled = true
# metric_retention_days           = 7


  