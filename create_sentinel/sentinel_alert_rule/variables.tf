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

#--------------------------------------RESOURCE: ALERT RULES---------------------------------------#
variable "alert_rule_fusion_config" {
  type = object({
    name                     = string
    log_analytics_workspace_id = string
    alert_rule_template_guid = string
    enabled                  = bool
  })
  default = {
    alert_rule_template_guid = null
    log_analytics_workspace_id = null
    enabled                  = true
    name                     = null
  }
  description = "Manages a Sentinel Fusion Alert Rule."
}

variable "alert_rule_machine_learning_behavior_analytics_config" {
  type = object({
    name                     = string
    log_analytics_workspace_id = string
    alert_rule_template_guid = string
    enabled                  = bool
  })
  default = {
    alert_rule_template_guid = null
    log_analytics_workspace_id = null
    enabled                  = false
    name                     = null
  }
  description = "Manages a Sentinel Machine Learning Behavior Analytics Alert Rule."
}

variable "alert_rule_ms_security_incident_config" {
  type = object({
    name                        = string
    log_analytics_workspace_id = string
    display_name                = string
    product_filter              = string
    severity_filter             = list(string)
    alert_rule_template_guid    = string
    description                 = string
    enabled                     = bool
    display_name_filter         = list(string)
    display_name_exclude_filter = list(string)
  })
  default = {
    alert_rule_template_guid    = null
    description                 = null
    display_name                = null
    display_name_exclude_filter = null
    display_name_filter         = null
    enabled                     = true
    name                        = null
    log_analytics_workspace_id = null
    product_filter              = null
    severity_filter             = null
  }
  description = "Manages a Sentinel MS Security Incident Alert Rule."
}

variable "alert_rule_nrt_config" {
  type = object({
    name         = string
    log_analytics_workspace_id = string
    display_name = string
    severity     = string
    query        = string
    alert_details_override = object({
      description_format   = string
      display_name_format  = string
      severity_column_name = string
      tactics_column_name  = string
    })
    alert_rule_template_guid    = string
    alert_rule_template_version = string
    custom_details              = map(string)
    description                 = string
    enabled                     = bool
    entity_mapping = object({
      entity_type = string
      field_mapping = object({
        identifier  = string
        column_name = string
      })
    })
    incident = object({
      create_incident_enabled = bool
      grouping = object({
        enabled                 = bool
        lookback_duration       = string
        reopen_closed_incidents = bool
        entity_matching_method  = string
        by_entities             = list(string)
        by_alert_details        = list(string)
        by_custom_details       = list(string)
      })
    })
    suppression_duration = string
    suppression_enabled  = bool
    tactics              = list(string)
  })
  default = {
    alert_details_override = {
      description_format   = null
      display_name_format  = null
      severity_column_name = null
      tactics_column_name  = null
    }
    alert_rule_template_guid    = null
    alert_rule_template_version = null
    custom_details = {
      "alert_value" = "event_value"
    }
    description  = null
    display_name = null
    enabled      = true
    entity_mapping = {
      entity_type = null
      field_mapping = {
        column_name = null
        identifier  = null
      }
    }
    incident = {
      create_incident_enabled = true
      grouping = {
        by_alert_details        = null
        by_custom_details       = null
        by_entities             = null
        enabled                 = true
        entity_matching_method  = "AnyAlert"
        lookback_duration       = "PT5M"
        reopen_closed_incidents = false
      }
    }
    name                 = null
    log_analytics_workspace_id = null
    query                = null
    severity             = null
    suppression_duration = "PT5H"
    suppression_enabled  = false
    tactics              = null
  }
  description = "Manages a Sentinel NRT Alert Rule."
}

variable "alert_rule_scheduled_config" {
  type = object({
    name         = string
    log_analytics_workspace_id = string
    display_name = string
    severity     = string
    query        = string
    alert_details_override = object({
      description_format   = string
      display_name_format  = string
      severity_column_name = string
      tactics_column_name  = string
    })
    alert_rule_template_guid    = string
    alert_rule_template_version = string
    custom_details              = map(string)
    description                 = string
    enabled                     = bool
    entity_mapping = object({
      entity_type = string
      field_mapping = object({
        identifier  = string
        column_name = string
      })
    })
    event_grouping = object({
      aggregation_method = string
    })
    incident_configuration = object({
      create_incident = bool
      grouping = object({
        enabled                 = bool
        lookback_duration       = string
        reopen_closed_incidents = bool
        entity_matching_method  = string
        group_by_entities       = list(string)
        group_by_alert_details  = list(string)
        group_by_custom_details = list(string)
      })
    })
    query_frequency      = string
    query_period         = string
    suppression_duration = string
    suppression_enabled  = bool
    tactics              = list(string)
    techniques           = list(string)
    trigger_operator     = string
    trigger_threshold    = number
  })
  default = {
    alert_details_override = {
      description_format   = null
      display_name_format  = null
      severity_column_name = null
      tactics_column_name  = null
    }
    alert_rule_template_guid    = null
    alert_rule_template_version = null
    custom_details = {
      "alert_value" = "event_value"
    }
    description  = null
    display_name = null
    enabled      = true
    entity_mapping = {
      entity_type = null
      field_mapping = {
        column_name = null
        identifier  = null
      }
    }
    event_grouping = {
      aggregation_method = "SingleAlert"
    }
    incident_configuration = {
      create_incident = true
      grouping = {
        group_by_alert_details  = null
        group_by_custom_details = null
        group_by_entities       = null
        enabled                 = true
        entity_matching_method  = "AnyAlert"
        lookback_duration       = "PT5M"
        reopen_closed_incidents = false
      }
    }
    name                 = null
    log_analytics_workspace_id = null
    query                = null
    query_frequency      = null
    query_period         = null
    severity             = null
    suppression_duration = "PT5H"
    suppression_enabled  = false
    tactics              = null
    techniques           = null
    trigger_operator     = null
    trigger_threshold    = null
  }
  description = "Manages a Sentinel Scheduled Alert Rule."
}
