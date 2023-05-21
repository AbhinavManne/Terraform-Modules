#--------------------------------RESOURCE: LOG ANALYTICS WORKSPACE----------------------------------#
variable "log_analytics_workspace" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "log_sku" {
  type        = string
  description = " Specifies the Sku of the Log Analytics Workspace."
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = " Internet ingestion enabled or not"
}

variable "internet_query_enabled" {
  type        = bool
  description = " Interent query enable or not"
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  description = " The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000."
}

variable "daily_quota_gb" {
  type        = number
  description = " The workspace daily quota for ingestion in GB."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

#--------------------------------RESOURCE: LOG ANALYTICS SOLUTION----------------------------------#
variable "create_log_analytics_solution" {
  type        = bool
  description = "If you want to create a log analytics solution resource or not"
}

variable "solution_name" {
  type        = string
  description = "Specifies the name of the solution to be deployed."
}

variable "plan_publisher" {
  type        = string
  description = "The publisher of the solution. For example Microsoft"
}

variable "plan_product" {
  type        = string
  description = "The product name of the solution. For example OMSGallery/Containers"
}

variable "promotion_code" {
  type        = string
  description = "A promotion code to be used with the solution."
}

#-----------------------------------RESOURCE: AUTOMATION RULE--------------------------------------#

variable "automation_rule_config" {
  type = object({
    name         = string
    log_analytics_workspace_id = string
    display_name = string
    order        = number
    action_incident = object({
      order                  = number
      status                 = string
      classification         = string
      classification_comment = string
      labels                 = list(string)
      owner_id               = string
      severity               = string
    })
    action_playbook = object({
      logic_app_id = string
      order        = number
      tenant_id    = string
    })
    condition = object({
      operator = string
      property = string
      values   = list(string)
    })
    enabled    = bool
    expiration = string
  })
  default = {
    action_incident = {
      classification         = null
      classification_comment = null
      labels                 = null
      order                  = null
      owner_id               = null
      severity               = null
      status                 = null
    }
    action_playbook = {
      logic_app_id = null
      order        = null
      tenant_id    = null
    }
    condition = {
      operator = null
      property = null
      values   = null
    }
    display_name = null
    enabled      = true
    expiration   = null
    log_analytics_workspace_id = null
    name         = null
    order        = null
  }
  description = "Manages a Sentinel Automation Rule."
}
