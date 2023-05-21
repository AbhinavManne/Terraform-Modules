variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in the AutoScale Setting should be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the AutoScale Setting should exist. Changing this forces a new resource to be created."
}

variable "monitor_autoscale_setting_name" {
  type        = string
  description = "The name of the AutoScale Setting. Changing this forces a new resource to be created."
}

variable "profile_name" {
  type        = string
  description = "Specifies the name of the profile."
}

variable "target_resource_id" {
  type        = string
  description = "Specifies the resource ID of the resource that the autoscale setting should be added to."
}

variable "capacity_default" {
  type        = string
  description = "The number of instances that are available for scaling if metrics are not available for evaluation. The default is only used if the current instance count is lower than the default. Valid values are between 0 and 1000."
}

variable "capacity_minimum" {
  type        = string
  description = "The minimum number of instances for this resource. Valid values are between 0 and 1000."
}

variable "capacity_maximum" {
  type        = string
  description = "The maximum number of instances for this resource. Valid values are between 0 and 1000."
}

variable "rules" {
  type = map(object({
    metric_name        = string
    metric_resource_id = string
    operator           = string
    statistic          = string
    time_aggregation   = string
    time_grain         = string
    time_window        = string
    threshold          = number
    metric_namespace   = string
    dimensions = map(object({
      name     = string
      operator = string
      values   = list(string)
    }))
    divide_by_instance_count = bool
    cooldown                 = string
    direction                = string
    type                     = string
    value                    = string
  }))
  description = "One or more (up to 10) rule blocks can be defined."
}
variable "fixed_date" {
  type = object({
    end      = string
    start    = string
    timezone = string
  })
  description = "A fixed_date block as defined below. This cannot be specified if a recurrence block is specified."
}
variable "recurrence" {
  type = object({
    timezone = string
    minutes  = list(number)
    hours    = list(number)
    days     = list(string)
  })
  description = "A recurrence block as defined below. This cannot be specified if a fixed_date block is specified."
}
variable "enabled" {
  type        = bool
  description = "Specifies whether automatic scaling is enabled for the target resource. Defaults to true."
  default     = true
}
variable "notification" {
  type = object({
    send_to_subscription_administrator    = bool
    send_to_subscription_co_administrator = bool
    custom_emails                         = list(string)
    webhook = map(object({
      service_uri = string
      properties  = map(string)
    }))
  })
  description = "Specifies a notification block."
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}
