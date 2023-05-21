#-----------------------------VARIABLE: DATA SOURCE: RESOURCE GROUP---------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#----------------------------VARIABLE: AZURE FRONTDOOR WAF POLICY-----------------------------------------#
variable "frontdoor_waf_policy_name" {
  type        = string
  description = "Name of the frontdoor web application firewall policy"
}

variable "enabled" {
  type        = bool
  description = "Enabled state"
}

variable "frontdoor_waf_policy_mode" {
  type        = string
  description = "The firewall policy mode"
}

variable "redirect_url" {
  type        = string
  description = "Redirect URL"
}

variable "custom_block_response_status_code" {
  type        = number
  description = "Name of the frontdoor web application firewall policy"
}

variable "custom_block_response_body" {
  type        = string
  description = "Response status code for block action type"
}

variable "custom_rule_1_name" {
  type        = string
  description = "Name of the custom rule"
}

variable "custom_rule_2_name" {
  type        = string
  description = "Name of the custom rule"
}

variable "priority_1" {
  type        = number
  description = "The priority of the rule"
}

variable "priority_2" {
  type        = number
  description = "The priority of the rule"
}

variable "rate_limit_duration_in_minutes" {
  type        = number
  description = "The rate limit duration in minutes"
}

variable "rate_limit_threshold" {
  type        = number
  description = "The rate limit threshold"
}

variable "custom_rule_type" {
  type        = string
  description = "Type of the custom rule"
}

variable "rule_action" {
  type        = string
  description = "The action to perform when the rule is matched"
}

variable "custom_rule_match_variable_remote_addr" {
  type        = string
  description = "The request variable to compare with"
}

variable "custom_rule_match_variable_request_header" {
  type        = string
  description = "The request variable to compare with"
}

variable "custom_rule_selector" {
  type        = string
  description = "Custom Rule Selector"
}

variable "custom_rule_operator_ipmatch" {
  type        = string
  description = "Custom Rule Operator"
}

variable "custom_rule_operator_contains" {
  type        = string
  description = "Custom Rule Operator"
}

variable "negation_condition" {
  type        = bool
  description = "Should the result of the condition be negated"
}

variable "custom_rule_1_match_values" {
  type        = list(string)
  description = "Match values for custom rule"
}

variable "custom_rule_2_match_values_1" {
  type        = list(string)
  description = "Match values for custom rule"
}

variable "custom_rule_2_match_values_2" {
  type        = list(string)
  description = "Match values for custom rule"
}

variable "transforms" {
  type        = list(string)
  description = "Transforms to apply"
}

variable "managed_rule_type_default" {
  type        = string
  description = "The name of the managed rule to use with this resource"
}

variable "managed_rule_type_bot_manager" {
  type        = string
  description = "The name of the managed rule to use with this resource"
}

variable "managed_rule_version" {
  type        = string
  description = "The version on the managed rule to use with this resource"
}

variable "managed_rule_exclusion_match_variable" {
  type        = string
  description = "The variable type to be excluded"
}

variable "managed_rule_exclusion_operator" {
  type        = string
  description = "Comparison operator to apply to the selector when specifying which elements in the collection this exclusion applies to"
}

variable "managed_rule_exclusion_selector_not_suspicious" {
  type        = string
  description = "Selector for the value in the match_variable attribute this exclusion applies to"
}

variable "managed_rule_exclusion_selector_really_not_suspicious" {
  type        = string
  description = "Selector for the value in the match_variable attribute this exclusion applies to"
}

variable "managed_rule_exclusion_selector_innocent" {
  type        = string
  description = "Selector for the value in the match_variable attribute this exclusion applies to"
}

variable "managed_rule_group_name_php" {
  type        = string
  description = "The managed rule group to override"
}

variable "managed_rule_group_name_sqli" {
  type        = string
  description = "The managed rule group to override"
}

variable "managed_rule_override_rule_id_1" {
  type        = string
  description = "Identifier for the managed rule"
}

variable "managed_rule_override_rule_id_2" {
  type        = string
  description = "Identifier for the managed rule"
}

variable "managed_rule_override_enabled" {
  type        = bool
  description = "Is the managed rule override enabled or disabled"
}

variable "frontdoor_name" {
  type        = string
  description = "Name of the azure frontdoor"
}

variable "enforce_backend_pools_certificate_name_check" {
  type        = bool
  description = "Whether to enforce certificate name check in backend pools"
}

variable "frontend_endpoint_name" {
  type        = string
  description = "Name of the frontend endpoint"
}

variable "load_balancing_name" {
  type        = string
  description = "Name of the load balancer"
}

variable "health_probe_name" {
  type        = string
  description = "Name of the health probe"
}

variable "backend_pool_name" {
  type        = string
  description = "Name of the backend pool"
}

variable "first_backend_host" {
  type        = string
  description = "URL of a backend host"
}

variable "second_backend_host" {
  type        = string
  description = "URL of another backend host"
}

variable "http_port" {
  type        = number
  description = "HTTP port no."
}

variable "https_port" {
  type        = number
  description = "HTTPS port no."
}

variable "routing_rule_name" {
  type        = string
  description = "Name of the routing rule"
}

variable "accepted_protocols" {
  type        = list(string)
  description = "List of Protocol schemes to match for the Backend Routing Rule"
}

variable "patterns_to_match" {
  type        = list(string)
  description = "List of route patterns for the Backend Routing Rule"
}

variable "forwarding_protocol" {
  type        = string
  description = "Protocol to use when redirecting"
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#----------------------------------VARIABLES: RBAC MODULE----------------------------------------------#

variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}

#----------------------------------------------------------------------------------------------------------#