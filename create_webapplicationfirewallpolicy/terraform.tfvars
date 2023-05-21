create_resource_group                = false
resource_group_name                  = "rg"
location                             = "east us"
web_application_firewall_policy_name = "wafpolicy-1"

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "webapplication firewall policy"
}

exclusion = [{
  excluded_rule_set = [{
    rule_group = [{
      excluded_rules  = null
      rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
    }]
    type    = "OWASP"
    version = "3.2"
  }]
  match_variables         = "RequestCookieNames"
  selector                = "too-tasty"
  selector_match_operator = "EndsWith"
}]

managed_rule_set = [{
  rule_group_override = [{
    disabled_rules  = ["920300", "920440"]
    rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
  }]
  type    = "OWASP"
  version = "3.1"
}]


custom_rules = [{
  name      = "Rule1"
  priority  = 1
  rule_type = "MatchRule"
  action    = "Allow"

  match_conditions = [{
    match_values       = ["192.168.1.0/24", "10.0.0.0/24"]
    operator           = "IPMatch"
    negation_condition = false
    transforms         = null

    match_variables = [{
      variable_name = "RemoteAddr"
      selector      = null

    }]
  }]
}]

enable_policy_settings      = true
enabled                     = true
file_upload_limit_in_mb     = 100
max_request_body_size_in_kb = 128
mode                        = "Prevention"
request_body_check          = true

