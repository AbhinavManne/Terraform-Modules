#-----------------------------VARIABLE: DATA SOURCE: RESOURCE GROUP---------------------------------------#
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

#-----------------------------VARIABLE: RESOURCE: AZURE FRONTDOOR WAF POLICY-------------------------------#
variable "frontdoor_firewall_policy_name" {
  type        = string
  description = "Name of the frontdoor web application firewall policy"
}

variable "enabled" {
  type        = bool
  description = "Enabled state"
  default = true
}

variable "mode" {
  type        = string
  description = "firewall policy mode"
  default = "Prevention"
}

variable "redirect_url" {
  type        = string
  description = "Redirect URL"
}

variable "custom_block_response_status_code" {
  type        = number
  description = "Name of the frontdoor web application firewall policy"
  default     = 200
}

variable "custom_block_response_body" {
  type        = string
  description = "Response status code for block action type"
}

variable "tags" {
  type        = map(string)
  description = "tags"
}

variable "custom_rule" {
  type = list(object({
    name                           = string
    action                         = string
    enabled                        = bool
    priority                       = number
    type                           = string
    rate_limit_duration_in_minutes = number
    rate_limit_threshold           = number

    match_condition = list(object({
      match_variable     = string
      match_values       = list(string)
      operator           = string
      selector           = string
      negation_condition = bool
      transforms         = list(string)
    }))
  }))
  description = "One or more Custom rules in azure. Here, Optional Arguments are: enabled, rate_limit_duration_in_minutes, rate_limit_threshold, selector, negation_condition, and transforms"
}

variable "managed_rule" {
  type = list(object({
    type    = string
    version = string

    exclusion = list(object({
      match_variable = string
      operator       = string
      selector       = string
    }))

    override = list(object({
      rule_group_name = string

      exclusion = list(object({
        match_variable = string
        operator       = string
        selector       = string
      }))

      rule = list(object({
        rule_id = string
        action  = string
        enabled = bool

        exclusion = list(object({
          match_variable = string
          operator       = string
          selector       = string
        }))
      }))
    }))
  }))
  description = "One or more Managed rules in azure. Here, only Optional Argument is: enabled"
}
