#----DEFAULT VALUES: RESOURCE GROUP----#
resource_group                               = "rg-002"
create_resource_group                        = true
location                                     = "East US"

#----DEFAULT VALUES: AZURE FRONTDOOR WAF POLICY----#
frontdoor_waf_policy_name                             = "wafpolicy001"
enabled                                               = true
frontdoor_waf_policy_mode                             = "Prevention"
redirect_url                                          = "https://www.contoso.com"
custom_block_response_status_code                     = 403
custom_block_response_body                            = "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="
custom_rule_1_name                                    = "Rule1"
custom_rule_2_name                                    = "Rule2"
priority_1                                            = 1
priority_2                                            = 2
rate_limit_duration_in_minutes                        = 1
rate_limit_threshold                                  = 10
custom_rule_type                                      = "MatchRule"
rule_action                                           = "Block"
custom_rule_match_variable_remote_addr                = "RemoteAddr"
custom_rule_match_variable_request_header             = "RequestHeader"
custom_rule_selector                                  = "UserAgent"
custom_rule_operator_ipmatch                          = "IPMatch"
custom_rule_operator_contains                         = "Contains"
negation_condition                                    = false
custom_rule_1_match_values                            = ["192.168.1.0/24", "10.0.0.0/24"]
custom_rule_2_match_values_1                          = ["192.168.1.0/24"]
custom_rule_2_match_values_2                          = ["windows"]
transforms                                            = ["Lowercase", "Trim"]
managed_rule_type_default                             = "DefaultRuleSet"
managed_rule_type_bot_manager                         = "Microsoft_BotManagerRuleSet"
managed_rule_version                                  = "1.0"
managed_rule_exclusion_match_variable                 = "QueryStringArgNames"
managed_rule_exclusion_operator                       = "Equals"
managed_rule_exclusion_selector_not_suspicious        = "not_suspicious"
managed_rule_exclusion_selector_really_not_suspicious = "really_not_suspicious"
managed_rule_exclusion_selector_innocent              = "innocent"
managed_rule_group_name_php                           = "PHP"
managed_rule_group_name_sqli                          = "SQLI"
managed_rule_override_rule_id_1                       = "933100"
managed_rule_override_rule_id_2                       = "942200"
managed_rule_override_enabled                         = false

#----DEFAULT VALUES: AZURE FRONTDOOR----#
frontdoor_name                               = "example-FrontDoor-sampleDoor"
enforce_backend_pools_certificate_name_check = false
frontend_endpoint_name                       = "exampleFrontendEndpoint001"
load_balancing_name                          = "exampleLoadBalancer001"
health_probe_name                            = "exampleHealthProbe001"
backend_pool_name                            = "exampleBackendPool001"
first_backend_host                           = "firstwebapp001.azurewebsites.net"
second_backend_host                          = "secondwebapp002.azurewebsites.net"
http_port                                    = 80
https_port                                   = 443
routing_rule_name                            = "exampleRoutingRule001"
accepted_protocols                           = ["Http", "Https"]
patterns_to_match                            = ["/*"]
forwarding_protocol                          = "HttpsOnly" #can be HttpOnly, HttpsOnly or MatchRequest
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Azure_Frontdoor"
}