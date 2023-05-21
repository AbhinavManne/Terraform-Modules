module "WebApplicationFirewallPolicy_module" {
  source                               = "../../modules/module_webapplicationfirewallpolicy/webapp_policy"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  web_application_firewall_policy_name = var.web_application_firewall_policy_name
  tags                                 = var.tags
  custom_rules                         = var.custom_rules
  exclusion                            = var.exclusion
  managed_rule_set                     = var.managed_rule_set
  enable_policy_settings               = var.enable_policy_settings
  enabled                              = var.enabled
  file_upload_limit_in_mb              = var.file_upload_limit_in_mb
  max_request_body_size_in_kb          = var.max_request_body_size_in_kb
  mode                                 = var.mode
  request_body_check                   = var.request_body_check
}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}
