#Reference to the kubernetes service creation module
module "kubernetes_service" {
  source              = "../../modules/module_azure-kubernetes-service"
  resource_group_name = var.resource_group_name
  location            = var.location

  cluster_name = var.cluster_name

  api_server_authorized_ip_ranges     = var.api_server_authorized_ip_ranges
  azure_policy_enabled                = var.azure_policy_enabled
  disk_encryption_set_id              = var.disk_encryption_set_id
  prefix                              = var.prefix
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
  agents_pool_name                    = var.agents_pool_name
  agents_size                         = var.agents_size
  enable_auto_scaling                 = var.enable_auto_scaling
  enable_host_encryption              = var.enable_host_encryption
  enable_node_public_ip               = var.enable_node_public_ip
  agents_max_count                    = var.agents_max_count
  agents_max_pods                     = var.agents_max_pods
  agents_min_count                    = var.agents_min_count
  agents_count                        = var.agents_count
  agents_labels                       = var.agents_labels
  only_critical_addons_enabled        = var.only_critical_addons_enabled
  orchestrator_version                = var.orchestrator_version
  os_disk_size_gb                     = var.os_disk_size_gb
  os_disk_type                        = var.os_disk_type
  tags                                = var.tags
  agents_type                         = var.agents_type
  vnet_subnet_id                      = var.vnet_subnet_id
  agents_availability_zones           = var.agents_availability_zones
  rbac_aad_admin_group_object_ids     = var.rbac_aad_admin_group_object_ids
  rbac_aad_azure_rbac_enabled         = var.rbac_aad_azure_rbac_enabled

  rbac_aad_tenant_id = var.rbac_aad_tenant_id
  identity_type      = var.identity_type
  identity_ids       = var.identity_ids

  ingress_application_gateway_id          = var.ingress_application_gateway_id
  ingress_application_gateway_name        = var.ingress_application_gateway_name
  ingress_application_gateway_subnet_cidr = var.ingress_application_gateway_subnet_cidr
  ingress_application_gateway_subnet_id   = var.ingress_application_gateway_subnet_id

  secret_rotation_enabled  = var.secret_rotation_enabled
  secret_rotation_interval = var.secret_rotation_interval
  subnet_name              = var.subnet_name
  admin_username           = var.admin_username

  network_plugin                 = var.network_plugin
  net_profile_dns_service_ip     = var.net_profile_dns_service_ip
  net_profile_docker_bridge_cidr = var.net_profile_docker_bridge_cidr
  network_policy                 = var.network_policy
  net_profile_outbound_type      = var.net_profile_outbound_type
  net_profile_pod_cidr           = var.net_profile_pod_cidr
  net_profile_service_cidr       = var.net_profile_service_cidr
  node_count                     = var.node_count

  client_id                    = var.client_id
  object_id                    = var.object_id
  client_id_identity           = var.client_id_identity
  user_assigned_identity_id    = var.user_assigned_identity_id
  client_secret                = var.client_secret
  oms_agent                    = var.oms_agent
  nat_gateway_profile          = var.nat_gateway_profile
  public_ssh_key               = var.public_ssh_key
  additional_node_pools        = var.additional_node_pools
  node_taints                  = var.node_taints
  eviction_policy              = var.eviction_policy
  proximity_placement_group_id = var.proximity_placement_group_id
  spot_max_price               = var.spot_max_price
  priority                     = var.priority
  mode                         = var.mode
}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

# module "alert" {
#   source                   = "../../modules/module_alert"
#   action_group_name        = var.action_group_name
#   resource_group_location  = var.location
#   resource_group_name      = var.resource_group_name
#   short_name               = var.short_name
#   action_group_rule_name   = var.action_group_rule_name
#   scope_type               = var.scope_type
#   resource_id              = module.kubernetes_service.aks_id
#   activity_log_alert_name  = var.activity_log_alert_name
#   resource_group_id        = module.module_create_resource_group.resource_group_id
#   operation_name_log_alert = var.operation_name_log_alert
#   category_log_alert       = var.category_log_alert
#   metric_alert_name        = var.metric_alert_name
#   storage_account_id       = var.storage_account_id
#   metric_namespace         = var.metric_namespace
#   metric_name              = var.metric_name
#   aggregation              = var.aggregation
#   operator                 = var.operator
#   threshold                = var.threshold
#   dimension_name           = var.dimension_name
#   dimension_operator       = var.dimension_operator
#   values                   = var.values

# }


# module "diag_settings" {
#   source                          = "../../modules/module_diagnostics_settings"
#   enable_log_monitoring           = var.enable_log_monitoring
#   diag_name                       = var.diag_name
#   target_resource_id              = module.kubernetes_service.aks_id
#   log_analytics_workspace_id      = var.log_analytics_workspace_id
#   log_analytics_destination_type  = var.log_analytics_destination_type
#   storage_account_id              = var.storage_account_id
#   eventhub_name                   = var.eventhub_name
#   eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
#   log_enabled                     = var.log_enabled
#   log_retention_policy_enabled    = var.log_retention_policy_enabled
#   log_retention_days              = var.log_retention_days
#   metric_retention_policy_enabled = var.metric_retention_policy_enabled
#   metric_retention_days           = var.metric_retention_days
# }
