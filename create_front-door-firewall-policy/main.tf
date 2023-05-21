module "FrontdoorFirewallPolicy_module" {
  source                            = "../../modules/module_frontdoor-firewall-policy"
  resource_group_name               = var.resource_group_name
  frontdoor_firewall_policy_name    = var.frontdoor_firewall_policy_name
  enabled                           = var.enabled
  mode                              = var.mode
  redirect_url                      = var.redirect_url
  custom_block_response_status_code = var.custom_block_response_status_code
  custom_block_response_body        = var.custom_block_response_body
  tags                              = var.tags
  custom_rule                       = var.custom_rule
  managed_rule                      = var.managed_rule

}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}