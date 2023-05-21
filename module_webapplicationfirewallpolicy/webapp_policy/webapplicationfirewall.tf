
#----------------------------- Web application firewall policy ----------------------------------
resource "azurerm_web_application_firewall_policy" "wafp" {
  name                = var.web_application_firewall_policy_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  managed_rules {
    dynamic "exclusion" {
      for_each = var.exclusion != null ? var.exclusion : []
      content {
        match_variable          = exclusion.value.match_variables
        selector                = exclusion.value.selector
        selector_match_operator = exclusion.value.selector_match_operator

        dynamic "excluded_rule_set" {
          for_each = exclusion.value.excluded_rule_set != null ? exclusion.value.excluded_rule_set : []
          content {
            type    = excluded_rule_set.value.type
            version = excluded_rule_set.value.version

            dynamic "rule_group" {
              for_each = excluded_rule_set.value.rule_group != null ? excluded_rule_set.value.rule_group : []
              content {
                rule_group_name = rule_group.value.rule_group_name
                excluded_rules  = rule_group.value.excluded_rules
              }
            }
          }
        }
      }
    }
    dynamic "managed_rule_set" {
      for_each = var.managed_rule_set
      content {
        type    = managed_rule_set.value.type
        version = managed_rule_set.value.version

        dynamic "rule_group_override" {
          for_each = managed_rule_set.value.rule_group_override != null ? managed_rule_set.value.rule_group_override : []
          content {
            rule_group_name = rule_group_override.value.rule_group_name
            disabled_rules  = rule_group_override.value.disabled_rules
          }
        }
      }
    }
  }




  dynamic "custom_rules" {
    for_each = var.custom_rules != null ? var.custom_rules : []
    content {
      name      = custom_rules.value.name
      priority  = custom_rules.value.priority
      rule_type = custom_rules.value.rule_type
      action    = custom_rules.value.action

      dynamic "match_conditions" {
        for_each = custom_rules.value.match_conditions
        content {
          match_values       = match_conditions.value.match_values
          operator           = match_conditions.value.operator
          negation_condition = match_conditions.value.negation_condition
          transforms         = match_conditions.value.transforms

          dynamic "match_variables" {
            for_each = match_conditions.value.match_variables
            content {
              variable_name = match_variables.value.variable_name
              selector      = match_variables.value.selector
            }
          }
        }
      }
    }
  }

  dynamic "policy_settings" {
    for_each = var.enable_policy_settings != null ? [1] : []
    content {
      enabled                     = var.enabled
      mode                        = var.mode
      file_upload_limit_in_mb     = var.file_upload_limit_in_mb
      request_body_check          = var.request_body_check
      max_request_body_size_in_kb = var.max_request_body_size_in_kb
    }
  }
}


      