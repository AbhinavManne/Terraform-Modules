create_resource_group = false
resource_group_name   = "rg"
location              = "east us"

frontdoor_firewall_policy_name    = "wafpolicy001"
enabled                           = true
mode                              = "Prevention"
redirect_url                      = "https://www.contoso.com"
custom_block_response_status_code = 403
custom_block_response_body        = "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "frontdoor firewall policy"
}

custom_rule = [{
  action  = "Allow"
  enabled = true
  match_condition = [{
    match_variable     = "RequestHeader"
    selector           = "UserAgent"
    operator           = "Contains"
    negation_condition = false
    match_values       = ["windows"]
    transforms         = ["Lowercase", "Trim"]
  }]
  name                           = "rule1"
  priority                       = 1
  rate_limit_duration_in_minutes = 1
  rate_limit_threshold           = 10
  type                           = "MatchRule"
}]

managed_rule = [{
  exclusion = [{
    match_variable = "QueryStringArgNames"
    operator       = "Equals"
    selector       = "not_suspicious"
  }]
  override = [{
    exclusion = [{
      match_variable = "QueryStringArgNames"
      operator       = "Equals"
      selector       = "really_not_suspicious"
    }]
    rule = [{
      action  = "Block"
      enabled = true
      exclusion = [{
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "innocent"
      }]
      rule_id = "942200"
    }]
    rule_group_name = "SQLI"
  }]
  type    = "DefaultRuleSet"
  version = "1.0"
}]