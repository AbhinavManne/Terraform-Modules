
#---------------------------------------------resource group variables---------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}

#----------------------------------------------Data Factory variables----------------------------------------------
#----------------------------------------------Data Factory variables----------------------------------------------
variable "data_factory_name" {
  type        = string
  description = "Specifies the name of the Data Factory"
}
variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "identity_type" {
  type        = string
  description = "Identity type (system assigned or user assigned)"
}

variable "identity_ids" {
  type        = list(string)
  description = "id of user assigned managed identity"
  default     = null
}

variable "github_configuration" {
  type        = map(any)
  description = " github_configuration block "
  default     = null
}

variable "global_parameter" {
  type = list(object({
    name  = string
    type  = string
    value = number
  }))
  default = null
}

variable "vsts_configuration" {
  type        = map(any)
  description = " vsts_configuration block ."
  default     = null
}

variable "public_network_enabled" {
  type        = bool
  description = "Is the Data Factory visible to the public network? "
  default     = true
}

variable "managed_virtual_network_enabled" {
  type        = bool
  description = "Is Managed Virtual Network enabled?"
  default     = false
}

variable "customer_managed_key_id" {
  type        = string
  description = "Specifies the Azure Key Vault Key ID to be used as the Customer Managed Key (CMK) for double encryption. Required with user assigned identity."
  default     = null
}

variable "customer_managed_key_identity_id" {
  type        = string
  description = "Specifies the ID of the user assigned identity associated with the Customer Managed Key."
  default     = null
}

# #--------------------------------Diagnostic settings varaiable---------------------------------
# variable "enable_log_monitoring" {
#   type  = bool
#   description = "enable log monitoring"
# }

# variable "diag_name" {
#   type        = string
#   description = "Specifies the name of the Diagnostic Setting."
# }



# variable "log_analytics_workspace_id" {
#   description = "ID of log anaytics workspace"
# }

# variable "log_analytics_destination_type" {
#   type = string
#   description = "log_analytics_destination_type"
# }

# variable "storage_account_id" {
#   description = "ID of target resource"
# }

# variable "eventhub_name" {
#   description = "eventhub_name"
# }

# variable "eventhub_authorization_rule_id" {
#   description = "eventhub_authorization_rule_id"
# }

# variable "log_enabled" {
#   type  = bool
#   description = "log_enabled"
# }

# variable "log_retention_policy_enabled" {
#   type  = bool
#   description = "log_retention_policy_enabled"
# }

# variable "log_retention_days" {
#   type  = number
#   description = "log_retention_days"
# }

# variable "metric_retention_policy_enabled" {
#   type  = bool
#   description = "metric_retention_policy_enabled"
# }

# variable "metric_retention_days" {
#   type  = number
#   description = "log_retention_days"
# }

# #-------------------------Alerts----------------------------------------------------

# variable "resource_group_id" {
#   type        = string
#   description = "Reading Resource group ID from other module "
# }

# #-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#

# variable "action_group_name" {
#   type        = string
#   description = "The name of the Action Group. Changing this forces a new resource to be created. "
# }

# variable "short_name" {
#   type        = string
#   description = "The short name of the action group. "
# }

# #-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#

# variable "action_group_rule_name" {
#   type        = string
#   description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
# }

# variable "scope_type" {
#   type        = string
#   description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
# }

# #---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

# variable "activity_log_alert_name" {
#   type        = string
#   description = "The name of the activity log alert. Changing this forces a new resource to be created. "
# }

# variable "operation_name_log_alert" {
#   type        = string
#   description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
# }

# variable "category_log_alert" {
#   type        = string
#   description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
# }

# #----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#

# variable "metric_alert_name" {
#   type        = string
#   description = "The name of the Metric Alert. Changing this forces a new resource to be created "
# }

# variable "metric_namespace" {
#   type        = string
#   description = "One of the metric namespaces to be monitored. "
# }

# variable "metric_name" {
#   type        = string
#   description = "One of the metric names to be monitored. "
# }

# variable "aggregation" {
#   type        = string
#   description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
# }

# variable "operator" {
#   type        = string
#   description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
# }

# variable "threshold" {
#   type        = number
#   description = "The criteria threshold value that activates the alert "
# }

# variable "dimension_name" {
#   type        = string
#   description = "One of the dimension names "
# }

# variable "dimension_operator" {
#   type        = string
#   description = "The dimension operator. Possible values are Include, Exclude and StartsWith. "
# }

# variable "values" {
#   type        = list(string)
#   description = "The list of dimension values. "
# }





