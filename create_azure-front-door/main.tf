#Reference to Frontdoor WAF Policy creation module
module "azure_frontdoor_firewall_policy_creation_module" {
  source                                                = "../../modules/module_azure-frontdoor-firewall-policy-creation"
  resource_group                                        = var.resource_group
  create_resource_group                                 = var.create_resource_group
  location                                              = var.location
  frontdoor_waf_policy_name                             = var.frontdoor_waf_policy_name
  enabled                                               = var.enabled
  frontdoor_waf_policy_mode                             = var.frontdoor_waf_policy_mode
  redirect_url                                          = var.redirect_url
  custom_block_response_status_code                     = var.custom_block_response_status_code
  custom_block_response_body                            = var.custom_block_response_body
  custom_rule_1_name                                    = var.custom_rule_1_name
  custom_rule_2_name                                    = var.custom_rule_2_name
  priority_1                                            = var.priority_1
  priority_2                                            = var.priority_2
  rate_limit_duration_in_minutes                        = var.rate_limit_duration_in_minutes
  rate_limit_threshold                                  = var.rate_limit_threshold
  custom_rule_type                                      = var.custom_rule_type
  rule_action                                           = var.rule_action
  custom_rule_match_variable_remote_addr                = var.custom_rule_match_variable_remote_addr
  custom_rule_match_variable_request_header             = var.custom_rule_match_variable_request_header
  custom_rule_selector                                  = var.custom_rule_selector
  custom_rule_operator_ipmatch                          = var.custom_rule_operator_ipmatch
  custom_rule_operator_contains                         = var.custom_rule_operator_contains
  negation_condition                                    = var.negation_condition
  custom_rule_1_match_values                            = var.custom_rule_1_match_values
  custom_rule_2_match_values_1                          = var.custom_rule_2_match_values_1
  custom_rule_2_match_values_2                          = var.custom_rule_2_match_values_2
  transforms                                            = var.transforms
  managed_rule_type_default                             = var.managed_rule_type_default
  managed_rule_type_bot_manager                         = var.managed_rule_type_bot_manager
  managed_rule_version                                  = var.managed_rule_version
  managed_rule_exclusion_match_variable                 = var.managed_rule_exclusion_match_variable
  managed_rule_exclusion_operator                       = var.managed_rule_exclusion_operator
  managed_rule_exclusion_selector_not_suspicious        = var.managed_rule_exclusion_selector_not_suspicious
  managed_rule_exclusion_selector_really_not_suspicious = var.managed_rule_exclusion_selector_really_not_suspicious
  managed_rule_exclusion_selector_innocent              = var.managed_rule_exclusion_selector_innocent
  managed_rule_group_name_php                           = var.managed_rule_group_name_php
  managed_rule_group_name_sqli                          = var.managed_rule_group_name_sqli
  managed_rule_override_rule_id_1                       = var.managed_rule_override_rule_id_1
  managed_rule_override_rule_id_2                       = var.managed_rule_override_rule_id_2
  managed_rule_override_enabled                         = var.managed_rule_override_enabled
}

#Reference to Azure Frontdoor creation module
module "azure_frontdoor_creation_module" {
  source                                       = "../../modules/module_azure-frontdoor-creation/azure_frontdoor"
  resource_group                                        = var.resource_group
  create_resource_group                                 = var.create_resource_group
  location                                              = var.location
  frontdoor_name                               = var.frontdoor_name
  enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check
  frontend_endpoint_name                       = var.frontend_endpoint_name
  frontdoor_waf_policy_id                      = module.azure_frontdoor_firewall_policy_creation_module.frontdoor_waf_policy_id
  load_balancing_name                          = var.load_balancing_name
  health_probe_name                            = var.health_probe_name
  backend_pool_name                            = var.backend_pool_name
  first_backend_host                           = var.first_backend_host
  second_backend_host                          = var.second_backend_host
  http_port                                    = var.http_port
  https_port                                   = var.https_port
  routing_rule_name                            = var.routing_rule_name
  accepted_protocols                           = var.accepted_protocols
  patterns_to_match                            = var.patterns_to_match
  forwarding_protocol                          = var.forwarding_protocol
  tags                                         = var.tags
}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  source               = "../../modules/module_azure-frontdoor-creation/rbac"
  scope                = module.azure_frontdoor_creation_module.resource_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "frontdoor_monitoring" {
  source                  = "../../modules/module_azure-frontdoor-creation/diag_setting"
  resource_id             = module.azure_frontdoor_creation_module.resource_id
  resource_group_name     = module.azure_frontdoor_creation_module.resource_group
  resource_group_id       = module.azure_frontdoor_creation_module.resource_group_id
  resource_group_location = module.azure_frontdoor_creation_module.resource_group_location
}