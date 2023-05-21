#-------------------------------------------OUTPUT VALUES------------------------------------------------#
variable "resource_id" {
  type        = string
  description = "Reading DNS resource ID from DNS Zone module "
}

variable "resource_group_name" {
  type        = string
  description = "Reading Resource group name from DNS Zone module"
}

variable "resource_group_id" {
  type        = string
  description = "Reading Resource group ID from DNS Zone module "
}

variable "resource_group_location" {
  type        = string
  description = "Reading Resource group location from DNS Zone module "
}


#-----------------------------------------VARIABLES: ACTION GROUP---------------------------------------#

variable "action_group_name" {
  type        = string
  default     = "example-action-group"
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  default     = "actiongroup"
  description = "The short name of the action group. "
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE---------------------------------#

variable "action_group_rule_name" {
  type        = string
  default     = "example-aabya"
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  default     = "Resource"
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

#------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------------#

variable "activity_log_alert_name" {
  type        = string
  default     = "example-activitylogalert"
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}

variable "operation_name_log_alert" {
  type        = string
  default     = "Microsoft.Network/networkSecurityGroups/write"
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  default     = "Security"
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

#---------------------------------------------------------------------------------------------------------#
