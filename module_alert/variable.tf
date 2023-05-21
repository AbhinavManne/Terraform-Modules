#-------------------------------OUTPUT VALUES----------------------------------------#

variable "resource_id" {
  type        = string
  description = "Reading resource IDs from other module "
}

# variable "storage_account_id" {
#   type        = string
#   description = "Reading Storage account ID from other module"
# }

variable "resource_group_name" {
  type        = string
  description = "Reading Resource group name from other module"
}

variable "resource_group_id" {
  type        = string
  description = "Reading Resource group ID from other module "
}

# variable "resource_group_location" {
#   type        = string
#   description = "Reading Resource group location from other module "
# }


#-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#
variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

variable "action_group_enabled" {
  type        = bool
  description = "Whether this action group is enabled. If an action group is not enabled, then none of its receivers will receive communications. Defaults to true."
}

variable "arm_role_receiver_name" {
  type        = string
  description = "The name of the ARM role receiver."
}

variable "arm_role_receiver_role_id" {
  type        = string
  description = "The arm role id."
}

variable "armrr_use_common_alert_schema" {
  type        = bool
  description = "Enables or disables the common alert schema."
}

variable "automation_runbook_receiver_name" {
  type        = string
  description = "The name of the automation runbook receiver."
}

variable "automation_account_id" {
  type        = string
  description = "The automation account ID which holds this runbook and authenticates to Azure resources."
}

variable "runbook_name" {
  type        = string
  description = "The name for this runbook."
}

variable "webhook_resource_id" {
  type        = string
  description = " The resource id for webhook linked to this runbook."
}

variable "is_global_runbook" {
  type        = string
  description = "Indicates whether this instance is global runbook."
}

variable "service_uri" {
  type        = string
  description = " The URI where webhooks should be sent."
}

variable "arr_use_common_alert_schema" {
  type        = bool
  description = "Enables or disables the common alert schema."
}

variable "azure_app_push_receiver" {
  type = list(object({
    name          = string
    email_address = string
  }))
  description = "name: The name of the Azure app push receiver. email_address: The email address of the user signed into the mobile app who will receive push notifications from this receiver."
}

variable "azure_function_receiver_name" {
  type        = string
  description = "The name of the Azure Function receiver."
}

variable "function_app_resource_id" {
  type        = string
  description = " The Azure resource ID of the function app."
}

variable "function_name" {
  type        = string
  description = "The function name in the function app."
}

variable "http_trigger_url" {
  type        = string
  description = " The HTTP trigger url where HTTP request sent to."
}

variable "afr_use_common_alert_schema" {
  type        = bool
  description = "Enables or disables the common alert schema."
}

variable "email_receiver" {
  type = list(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = bool
  }))
  description = "The name of the email receiver. Names must be unique (case-insensitive) across all receivers within an action group.The email address of this receiver."
}

variable "event_hub_receiver_name" {
  type        = string
  description = "The name of the EventHub Receiver, must be unique within action group."
}

variable "event_hub_name" {
  type        = string
  description = "The name of the specific Event Hub queue."
}

variable "event_hub_namespace" {
  type        = string
  description = "The namespace name of the Event Hub."
}

variable "subscription_id" {
  type        = string
  description = "The ID for the subscription containing this Event Hub. Default to the subscription ID of the Action Group."
}

variable "tenant_id" {
  type        = string
  description = "The Tenant ID for the subscription containing this Event Hub."
}

variable "ehr_use_common_alert_schema" {
  type        = bool
  description = "Indicates whether to use common alert schema."
}

variable "itsm_receiver_name" {
  type        = string
  description = "The name of the ITSM receiver."
}

variable "workspace_id" {
  type        = string
  description = "The Azure Log Analytics workspace ID where this connection is defined. Format is <subscription id>|<workspace id>, for example 00000000-0000-0000-0000-000000000000|00000000-0000-0000-0000-000000000000."
}

variable "itsm_receiver_connection_id" {
  type        = string
  description = "The unique connection identifier of the ITSM connection."
}

variable "ticket_configuration" {
  type        = string
  description = "A JSON blob for the configurations of the ITSM action. CreateMultipleWorkItems option will be part of this blob as well."
}

variable "log_workspace_region" {
  type        = string
  description = "The region of the workspace."
}

variable "logic_app_receiver_name" {
  type        = string
  description = "The name of the logic app receiver."
}

variable "logic_app_resource_id" {
  type        = string
  description = "The Azure resource ID of the logic app."
}

variable "callback_url" {
  type        = string
  description = "The callback url where HTTP request sent to."
}

variable "lar_use_common_alert_schema" {
  type        = bool
  description = "Enables or disables the common alert schema."
}

variable "sms_receiver" {
  type = list(object({
    name         = string
    country_code = string
    phone_number = string
  }))
  description = "The name of the SMS receiver. Names must be unique (case-insensitive) across all receivers within an action group.The country code of the SMS receiver.The phone number of the SMS receiver."
}

variable "voice_receiver" {
  type = list(object({
    name         = string
    country_code = string
    phone_number = string
  }))
  description = "The name of the voice receiver.The country code of the voice receiver.The phone number of the voice receiver."
}

variable "webhook_receiver" {
  type = list(object({
    name                    = string
    service_uri             = string
    use_common_alert_schema = string
  }))
  description = " The name of the webhook receiver. Names must be unique (case-insensitive) across all receivers within an action group.The URI where webhooks should be sent."
}

variable "aad_auth" {
  type = object({
    object_id      = string
    identifier_uri = string
    tenant_id      = string
  })
  description = "The webhook application object Id for AAD auth. The identifier URI for AAD auth. The tenant id for AAD auth."
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#
variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "action_rule_description" {
  type        = string
  description = "Specifies a description for the Action Rule."
}

variable "action_rule_enabled" {
  type        = bool
  description = " Is the Action Rule enabled? Defaults to true."
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

variable "action_rule_condition" {
  type = object({
    alert_context = object({
      operator = string
      values   = list(string)
    })
    alert_rule_id = object({
      operator = string
      values   = list(string)
    })
    description = object({
      operator = string
      values   = list(string)
    })
    monitor = object({
      operator = string
      values   = list(string)
    })
    monitor_service = object({
      operator = string
      values   = list(string)
    })
    severity = object({
      operator = string
      values   = list(string)
    })
    target_resource_type = object({
      operator = string
      values   = list(string)
    })

  })
  description = "The operator for a given condition. A list of values to match for a given condition."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#
variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}

variable "log_alert_description" {
  type        = string
  description = " The description of this activity log alert."
  default     = null
}

variable "log_alert_enabled" {
  type        = bool
  description = "Should this Activity Log Alert be enabled? Defaults to true."
  default     = true
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
  default     = "Security"
}

variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
  default     = null
}

variable "log_alert_resource_provider" {
  type        = string
  description = "The name of the resource provider monitored by the activity log alert."
  default     = null
}

variable "resource_type" {
  type        = string
  description = "The resource type monitored by the activity log alert."
  default     = null
}

variable "criteria_caller" {
  type        = string
  description = "The email address or Azure Active Directory identifier of the user who performed the operation."
  default     = null
}

variable "criteria_level" {
  type        = string
  description = " The severity level of the event. Possible values are Verbose, Informational, Warning, Error, and Critical."
  default     = "Verbose"
}

variable "criteria_status" {
  type        = string
  description = "The status of the event. For example, Started, Failed, or Succeeded."
  default     = "Succeeded"
}

variable "criteria_sub_status" {
  type        = string
  description = "The sub status of the event."
  default     = null
}

variable "criteria_recommendation_type" {
  type        = string
  description = "The recommendation type of the event. It is only allowed when category is Recommendation."
  default     = null
}

variable "criteria_recommendation_category" {
  type        = string
  description = "The recommendation category of the event. Possible values are Cost, Reliability, OperationalExcellence and Performance. It is only allowed when category is Recommendation."
  default     = "Performance"
}

variable "criteria_recommendation_impact" {
  type        = string
  description = " The recommendation impact of the event. Possible values are High, Medium and Low. It is only allowed when category is Recommendation."
  default     = "Low"
}

variable "resource_health" {
  type = object({
    current  = string
    previous = string
    reason   = string
  })
  description = "The current resource health statuses that will log an alert. Possible values are Available, Degraded, Unavailable and Unknown. The previous resource health statuses that will log an alert. Possible values are Available, Degraded, Unavailable and Unknown. The reason that will log an alert. Possible values are PlatformInitiated (such as a problem with the resource in an affected region of an Azure incident), UserInitiated (such as a shutdown request of a VM) and Unknown. "
  # default = {
  #   current  = "Available"
  #   previous = "Available"
  #   reason   = "UserInitiated"
  # }
}

variable "service_health" {
  type = object({
    events    = string
    locations = string
    services  = string
  })
  description = "Events this alert will monitor Possible values are Incident, Maintenance, Informational, ActionRequired and Security.Locations this alert will monitor. For example, West Europe. Defaults to Global.Services this alert will monitor. For example, Activity Logs & Alerts, Action Groups. Defaults to all Services."
  # default = {
  #   events    = "Security"
  #   locations = "Global"
  #   services  = "all Services"
  # }
}

variable "log_alert_action" {
  type        = bool
  description = "Wants to enable action block in log alert resource?"
}

variable "action_webhook_properties" {
  type        = map(any)
  description = "The map of custom string properties to include with the post operation. These data are appended to the webhook payload."
}

#----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#
variable "metric_alert_name" {
  type        = string
  description = "The name of the Metric Alert. Changing this forces a new resource to be created "
}

variable "metric_alert_scopes" {
  type        = list(string)
  description = "A set of strings of resource IDs at which the metric criteria should be applied."
}

variable "metric_alert_description" {
  type        = string
  description = "The description of this Metric Alert."
}

variable "metric_alert_enabled" {
  type        = bool
  description = "Should this Metric Alert be enabled? Defaults to true."
}

variable "metric_alert_auto_mitigate" {
  type        = bool
  description = "Should the alerts in this Metric Alert be auto resolved? Defaults to true."
}

variable "metric_alert_frequency" {
  type        = string
  description = " The evaluation frequency of this Metric Alert, represented in ISO 8601 duration format. Possible values are PT1M, PT5M, PT15M, PT30M and PT1H. Defaults to PT1M."
}

variable "metric_alert_severity" {
  type        = string
  description = "The severity of this Metric Alert. Possible values are 0, 1, 2, 3 and 4. Defaults to 3."
}

variable "metric_alert_target_resource_type" {
  type        = string
  description = "The resource type (e.g. Microsoft.Compute/virtualMachines) of the target resource."
}

variable "metric_alert_target_resource_location" {
  type        = string
  description = " The location of the target resource."
}

variable "metric_alert_window_size" {
  type        = string
  description = "The period of time that is used to monitor alert activity, represented in ISO 8601 duration format. This value must be greater than frequency. Possible values are PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H and P1D. Defaults to PT5M."
}

variable "dynamic_criteria" {
  type = list(object({
    metric_namespace  = string
    metric_name       = string
    aggregation       = string
    operator          = string
    alert_sensitivity = string
    dimension = list(object({
      name     = string
      operator = string
      values   = list(string)
    }))
    evaluation_total_count   = string
    evaluation_failure_count = string
    ignore_data_before       = string
    skip_metric_validation   = string
  }))
  description = "dynamic criteria block"
}

variable "criteria_metric_namespace" {
  type        = string
  description = "One of the metric namespaces to be monitored. "
}

variable "criteria_metric__name" {
  type        = string
  description = "One of the metric names to be monitored. "
}

variable "criteria_aggregation" {
  type        = string
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
}

variable "criteria_operator" {
  type        = string
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
}

variable "criteria_threshold" {
  type        = number
  description = "The criteria threshold value that activates the alert "
}

variable "criteria_dimension" {
  type = list(object({
    name     = string
    operator = string
    values   = list(string)
  }))
  description = "One of the dimension names "
}

variable "criteria_skip_metric_validation" {
  type        = bool
  description = "Skip the metric validation to allow creating an alert rule on a custom metric that isn't yet emitted? Defaults to false."
}

variable "application_insights_web_test_lac" {
  type = object({
    web_test_id           = string
    component_id          = string
    failed_location_count = string
  })
  description = "The ID of the Application Insights Web Test. The ID of the Application Insights Resource. The number of failed locations. "
}

variable "metric_alert_action" {
  type        = bool
  description = "Wants to enable metric action block?"
}

variable "metric_action_webhook_properties" {
  type        = map(string)
  description = " The map of custom string properties to include with the post operation. These data are appended to the webhook payload."
}
#---------------------------------------------------------------------------------------------------#
