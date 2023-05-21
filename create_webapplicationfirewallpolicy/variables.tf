#-----------------------------------Resource Group---------------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}

#----------------------------- web_application_firewall_policy_name --------------------------
variable "web_application_firewall_policy_name" {
  type        = string
  description = "Web application firewall policy name in Azure"
}

variable "tags" {
  type        = map(string)
  description = "tags"
}

variable "exclusion" {
  type = list(object({
    match_variables         = string
    selector                = string
    selector_match_operator = string

    excluded_rule_set = list(object({
      type    = string
      version = string

      rule_group = list(object({
        rule_group_name = string
        excluded_rules  = list(string)
      }))
    }))
  }))
  description = "One or more exclusion block in azure. Here, Optional Arguments are: selector, type, version, and excluded_rules"
}

variable "managed_rule_set" {
  type = list(object({
    type    = string
    version = string

    rule_group_override = list(object({
      rule_group_name = string
      disabled_rules  = list(string)

    }))
  }))
  description = "One or more Managed rule set in azure. Here, Optional Arguments are: type, version, and disabled_rules"
}


variable "custom_rules" {
  type = list(object({
    name      = string
    priority  = number
    rule_type = string
    action    = string

    match_conditions = list(object({
      match_values       = list(string)
      operator           = string
      negation_condition = bool
      transforms         = list(string)

      match_variables = list(object({
        variable_name = string
        selector      = string
      }))
    }))
  }))
  description = "One or more Custom rules in azure. Here, Optional Arguments are: name, negation_condition, transforms, and selector"
}

variable "enable_policy_settings" {
  type        = bool
  description = "whether to enable policy settings block"
}

variable "enabled" {
  type        = bool
  description = "Describes if the policy is in enabled state or disabled state"
  default     = true
}
variable "mode" {
  type        = string
  description = "Describes if it is in detection mode or prevention mode at the policy level."
  default     = "Prevention"
}
variable "file_upload_limit_in_mb" {
  type        = number
  description = "The File Upload Limit in MB."
  default     = 100
}
variable "request_body_check" {
  type        = bool
  description = "Is Request Body Inspection enabled?"
  default     = true
}
variable "max_request_body_size_in_kb" {
  type        = number
  description = "The Maximum Request Body Size in KB."
  default     = 128
}


