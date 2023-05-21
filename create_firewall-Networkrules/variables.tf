#-----------------------------------Resource Group--------------------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group?"
}
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}
#-----------------------------------csv file--------------------------------------------------
variable "csv_file_name" {
  type        = string
  description = "csv file name"
}
#--------------------------------Firewall----------------------------------
variable "firewall_name" {
  type        = string
  description = "Firewall name in Azure"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "sku_name" {
  type        = string
  description = "sku name in Azure"
}

variable "sku_tier" {
  type        = string
  description = "Sku tier in Azure"
}

variable "firewall_policy_id" {
  type        = string
  description = "The ID of the Firewall Policy applied to the Firewall"
}

variable "dns_servers" {
  type        = list(string)
  description = "A list of DNS servers that the Azure Firewall will direct DNS traffic to the for name resolution"
}

variable "private_ip_ranges" {
  type        = list(string)
  description = "A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges"
}

variable "threat_intel_mode" {
  type        = string
  description = "The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert,Deny and (empty string (generally used by double quotes))."
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Azure Firewall should be located."
}

######################## IP configuration 
variable "ip_configuration_name" {
  type        = string
  description = "Specifies the name of the IP Configuration."
}

variable "subnet_id_ip_configuration" {
  type        = string
  description = "Reference to the subnet associated with the IP Configuration."
}

variable "public_ip_address_id_ip_configuration" {
  type        = string
  description = " The ID of the Public IP Address associated with the firewall."
}
######################## Management ip configuration
variable "management_ip_configuration_name" {
  type        = string
  description = "Specifies the name of the IP Configuration."
}

variable "subnet_id_management_ip_configuration" {
  type        = string
  description = "Reference to the subnet associated with the IP Configuration."
}

variable "public_ip_address_id_management_ip_configuration" {
  type        = string
  description = " The ID of the Public IP Address associated with the firewall."
}


######################### Virtual Hub
variable "virtual_hub_id" {
  type        = string
  description = "Specifies the ID of the Virtual Hub where the Firewall resides in."
}

variable "public_ip_count" {
  type        = number
  description = "Specifies the number of public IPs to assign to the Firewall."
}

#-------------------------------------------- Alerts ----------------------------------------------- 

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}

variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

#------------------VARIABLES: METRIC ALERT-------------------------------#

variable "metric_alert_name" {
  type        = string
  description = "The name of the Metric Alert. Changing this forces a new resource to be created "
}

variable "metric_namespace" {
  type        = string
  description = "One of the metric namespaces to be monitored. "
}

variable "metric_name" {
  type        = string
  description = "One of the metric names to be monitored. "
}

variable "aggregation" {
  type        = string
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
}

variable "operator" {
  type        = string
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
}

variable "threshold" {
  type        = number
  description = "The criteria threshold value that activates the alert "
}

variable "dimension_name" {
  type        = string
  description = "One of the dimension names "
}

variable "dimension_operator" {
  type        = string
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith. "
}

variable "values" {
  type        = list(string)
  description = "The list of dimension values. "
}

#------------------------------ diag settings ----------------------
variable "enable_log_monitoring" {
  type        = bool
  description = "enable log monitoring"
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}

variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
}

variable "log_retention_days" {
  description = "log retention days"
  type        = number
}

variable "log_analytics_destination_type" {
  type        = string
  description = "log_analytics_destination_type"
}

variable "storage_account_id" {
  description = "ID of the storage account"
}

variable "eventhub_name" {
  description = "eventhub_name"
}

variable "eventhub_authorization_rule_id" {
  description = "eventhub_authorization_rule_id"
}

variable "log_enabled" {
  type        = bool
  description = "log_enabled"
}

variable "log_retention_policy_enabled" {
  type        = bool
  description = "log_retention_policy_enabled"
}


variable "metric_retention_policy_enabled" {
  type        = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type        = number
  description = "log_retention_days"
}
