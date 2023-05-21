module "FirewallPolicyRuleCollectionGroup_module" {
  source                                     = "../../modules/module_firewall-policy-rule-collection-group"
  #resource_group_name                        = var.resource_group_name
  #location                                   = var.location
  firewall_policy_rule_collection_group_name = var.firewall_policy_rule_collection_group_name
  firewall_policy_id                         = module.FirewallPolicy_module.firewall_policy_id
  priority                                   = var.priority
  application_rule_collection                = var.application_rule_collection
  network_rule_collection                    = var.network_rule_collection
  nat_rule_collection                        = var.nat_rule_collection
}

module "FirewallPolicy_module" {
  source                               = "../../modules/module_firewall_policy"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  firewall_policy_name                 = var.firewall_policy_name
  base_policy_id                       = var.base_policy_id
  private_ip_ranges                    = var.private_ip_ranges
  firewall_policy_sku                  = var.firewall_policy_sku
  tags                                 = var.tags
  threat_intelligence_mode             = var.threat_intelligence_mode
  sql_redirect_allowed                 = var.sql_redirect_allowed
  enable_dns                           = var.enable_dns
  proxy_enabled                        = var.proxy_enabled
  servers                              = var.servers
  identity_type                        = var.identity_type
  identity_ids                         = var.identity_ids
  insights_enabled                     = var.insights_enabled
  default_log_analytics_workspace_id   = var.default_log_analytics_workspace_id
  retention_in_days                    = var.retention_in_days
  log_analytics_workspace              = var.log_analytics_workspace
  enable_intrusion_detection           = var.enable_intrusion_detection
  mode                                 = var.mode
  private_ranges                       = var.private_ip_ranges
  signature_overrides                  = var.signature_overrides
  traffic_bypass                       = var.traffic_bypass
  enable_threat_intelligence_allowlist = var.enable_threat_intelligence_allowlist
  fqdns                                = var.fqdns
  ip_addresses                         = var.ip_addresses
  enable_tls_certificate               = var.enable_tls_certificate
  key_vault_secret_id                  = var.key_vault_secret_id
  name                                 = var.name

}

module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}