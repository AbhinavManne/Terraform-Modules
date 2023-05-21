#Reference to the kubernetes service creation module
module "kubernetes_service" {
  source                                    = "../../modules/module_aks-enable-container-insights/kubernetes"
  resource_group                            = var.resource_group
  create_resource_group                     = var.create_resource_group
  location                                  = var.location
  kubernetes_name                           = var.kubernetes_name
  dns_prefix                                = var.dns_prefix
  private_cluster_enabled                   = var.private_cluster_enabled
  default_node_pool_name                    = var.default_node_pool_name
  node_count                                = var.node_count
  vm_size                                   = var.vm_size
  os_disk_size_gb                           = var.os_disk_size_gb
  appId                                     = var.appId
  password                                  = var.password
  enabled                                   = var.enabled
  enable_http_application_routing           = var.enable_http_application_routing
  enable_azure_policy                       = var.enable_azure_policy
  enable_log_analytics_workspace            = var.enable_log_analytics_workspace
  tags                                      = var.tags
  log_analytics_workspace                   = var.log_analytics_workspace
  log_sku                                   = var.log_sku
  retention_in_days                         = var.retention_in_days
  security_center_subscription_pricing_tier = var.security_center_subscription_pricing_tier
  security_resource_type                    = var.security_resource_type
  security_center_email                     = var.security_center_email
  security_center_phone                     = var.security_center_phone
  security_center_alert_notifications       = var.security_center_alert_notifications
  security_center_alerts_to_admins          = var.security_center_alerts_to_admins
  security_center_setting_name              = var.security_center_setting_name
  enable_security_center_setting            = var.enable_security_center_setting
  enable_security_center_auto_provisioning  = var.enable_security_center_auto_provisioning
}

#Reference to module that provisions role assignment for  resource
module "module_resource-role-assignment" {
  source               = "../../modules/module_aks-enable-container-insights/rbac"
  scope                = module.kubernetes_service.resource_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "kubernetes_monitoring" {
  source                  = "../../modules/module_aks-enable-container-insights/diag_setting"
  resource_id             = module.kubernetes_service.resource_id
  resource_group_name     = module.kubernetes_service.resource_group
  resource_group_id       = module.kubernetes_service.resource_group_id
  resource_group_location = module.kubernetes_service.resource_group_location
}