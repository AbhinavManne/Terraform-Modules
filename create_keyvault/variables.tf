#--------------------------------------VARIABLES: RESOURCE: KEYVAULT-----------------------------------#
variable "keyvault_name" {
  type        = string
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

# variable "tenant_id" {
#   type        = string
#   description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
# }

variable "kv_sku" {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Purge Protection enabled for this Key Vault? Defaults to false."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for this Key Vault. Defaults to true."
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
}

variable "default_action" {
  type        = string
  description = " The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
}

variable "bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None"
}

variable "ip_rules" {
  type        = list(string)
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault"
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "One or more Subnet IDs which should be able to access this Key Vault."
}

variable "contact_email" {
  type        = string
  description = "E-mail address of the contact."
}

variable "contact_name" {
  type        = string
  description = "Name of the contact."
}

variable "contact_phone" {
  type        = string
  description = "Phone number of the contact."
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with your network and subnets."
}

#------------------------------------VARIABLES: RESOURCE: KEYVAULT ACCESS POLICY--------------------------------#
variable "enable_access_policy" {
  type        = bool
  description = "Want to add access policy?"
}

# variable "object_id" {
#   type        = string
#   description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
# }

variable "application_id" {
  type        = string
  description = "The object ID of an Application in Azure Active Directory."
}

variable "keyvault_key_permissions" {
  type        = list(string)
  description = " List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy."
}

variable "keyvault_secret_permissions" {
  type        = list(string)
  description = " List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
}

variable "keyvault_certificate_permissions" {
  type        = list(string)
  description = " List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
}

variable "keyvault_storage_permissions" {
  type        = list(string)
  description = " List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
}


#------------------------Variables: Module:Keyvault Access Policy -------------------------------------------#
variable "create_keyvault_access_policies" {
  type = bool
  description = "Want to add multiple access policies?"
}

variable "policies" {
  type = map(object({
    tenant_id          = string
    object_id          = string
    application_id     = string
    key_permissions    = list(string)
    secret_permissions = list(string)
    certificate_permissions = list(string) 
    storage_permissions     = list(string)
    }))
}


#------------------------Variables: Module:Private Endpoint -------------------------------------------#
variable "create_private-endpoint" {
  type        = bool
  description = "Wants to create private endpoint or not"
  default     = false
}

variable "private_dns_zone_group" {
  description = "block for dns zone group"
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = {
    name                 = "xyz"
    private_dns_zone_ids = ["null"]
  }
}

variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"
}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"
}

variable "subresource_names" {
  type        = list(string)
  description = "sub resources names in Azure"
}

variable "is_manual_connection" {
  type        = string
  description = "Status of manual connection "
}

variable "request_message" {
  type        = string
  description = "request msg"
  default     = "PL"
}

variable "private_connection_resource_id" {
  description = "ID of resource to be associated"
  default     = null
}

variable "subnet_id" {
  description = "Id of subnet"
}

variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
  default     = null
}


#--------------------------------VARIABLES:MODULE: ALERTS -----------------------------------------------#
variable "storage_account_id" {
  type        = string
  description = "Reading Storage account ID "
}

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID "
}

variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

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


#--------------------------------VARIABLES:MODULE: DIAGNOSTIC -----------------------------------------------#
variable "enable_log_monitoring" {
  type  = bool
  description = "enable log monitoring"
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}

variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
}

variable "log_analytics_destination_type" {
  type = string
  description = "log_analytics_destination_type"
}

variable "eventhub_name" {
  description = "eventhub_name"
}

variable "eventhub_authorization_rule_id" {
  description = "eventhub_authorization_rule_id"
}

variable "log_enabled" {
  type  = bool
  description = "log_enabled"
}

variable "log_retention_policy_enabled" {
  type  = bool
  description = "log_retention_policy_enabled"
}

variable "log_retention_days" {
  type  = number
  description = "log_retention_days"
}

variable "metric_retention_policy_enabled" {
  type  = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type  = number
  description = "log_retention_days"
}