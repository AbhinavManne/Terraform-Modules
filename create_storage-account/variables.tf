#-----------------------------------Resource Group--------------------------------------------------------------
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

#------------------------------------Random String-----------------------------------------------------------

variable "length" {
  description = "length of string"
  type        = string
}

variable "special" {
  description = "special character"
}

variable "upper" {
  description = "uppercase alphabet character"
}

#------------------------------------- Storage Account ---------------------------------------------------
variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account (Standard or Premium)."
  type        = string
}

variable "replication_type" {
  description = "Storage account replication type - i.e. LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  type        = string
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account."
  type        = string
  default     = "TLS1_2"
}

variable "tags" {
  description = "tags to be applied to resources"
  type        = map(string)
}

variable "account_kind" {
  description = "Defines the kind of Storage Account possible values are: BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  type        = string
  default     = "StorageV2"
}

variable "cross_tenant_replication_enabled" {
  description = "For enabling cross Tenant replication"
  type        = bool
  default     = true
}

variable "access_tier" {
  description = "It defines the access tier for the storage account i.e., Hot,Cool"
  type        = string
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Storage Account should exist"
  type        = string
  default     = null
}

variable "enable_https_traffic_only" {
  description = "Enabling this will force HTTPS traffic only"
  type        = bool
  default     = true
}

variable "allow_nested_items_to_be_public" {
  description = "Allow or disallow nested items within this Account to opt into being public"
  type        = bool
  default     = true
}

variable "shared_access_key_enabled" {
  description = "enable shared access key"
  type        = bool
  default     = true
}

variable "is_hns_enabled" {
  description = "to enable hierarchical namespace"
  type        = bool
  default     = null
}

variable "nfsv3_enabled" {
  description = "to enable NFSv3 protocol"
  type        = bool
  default     = false
}

variable "large_file_share_enabled" {
  description = "to enable large file share"
  type        = bool
  default     = false
}
#---------------------------custom domain-------------------------
variable "custom_domain_name" {
  description = "The Custom Domain Name to use for the Storage Account"
  type        = string
}
variable "use_subdomain" {
  description = "Should the Custom Domain Name be validated by using indirect CNAME validation?"
  type        = string
  default     = null
}
#------------------------customer managed key-------------------
variable "key_vault_key_id" {
  description = "The ID of the Key Vault Key"
  type        = string
}
variable "user_assigned_identity_id" {
  description = "The ID of a user assigned identity"
  type        = string
}
#---------------------identity-----------------------------------
variable "managed_identity_type" {
  description = "type of identity"
  type        = string
  default     = null
}
#--------------------------static website---------------------------
variable "enable_static_website" {
  description = "to enable static website"
  type        = bool
  default     = null
}
variable "static_website_index_document" {
  description = "The webpage that Azure Storage serves for requests to the root of a website or any subfolder"
  type        = string
  default     = null
}
variable "static_website_error_doc" {
  description = "webpage path to an non exixting file"
  type        = string
  default     = null
}
#----------------------------share properties----------------------------
variable "enable_share_properties" {
  description = "To enable share properties block"
  type        = bool
}
############################ cors rule
variable "shared_properties_allowed_headers" {
  description = "list of headers that are allowed to be a part of the cross-origin request"
  type        = list(string)
}
variable "shared_properties_allowed_methods" {
  description = "list of HTTP methods that are allowed to be executed by the origin. Options are: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH."
  type        = list(string)
}
variable "shared_properties_allowed_origins" {
  description = "list of origin domains that will be allowed by CORS"
  type        = list(string)
}
variable "shared_properties_exposed_headers" {
  description = "list of response headers that are exposed to CORS clients"
  type        = list(string)
}
variable "shared_properties_max_age_in_sec" {
  description = "number of seconds the client should cache a preflight response"
  type        = number
}
############################# retention policy
variable "retention_policy_days" {
  description = "Specifies the number of days that the azurerm_storage_share should be retained, between 1 and 365 days."
  type        = number
  default     = 7
}
############################ smb
variable "smb_versions" {
  description = "A set of SMB protocol versions. Possible values are SMB2.1, SMB3.0, and SMB3.1.1"
  type        = string
  default     = "SMB3.1.1"
}
variable "smb_authentication_types" {
  description = "A set of SMB authentication methods. Possible values are NTLMv2, and Kerberos"
  type        = string
  default     = "Kerberos"
}
variable "smb_kerberos_ticket_encryption_type" {
  description = "A set of Kerberos ticket encryption. Possible values are RC4-HMAC, and AES-256"
  type        = string
  default     = "AES-256"
}
variable "channel_encryption_type" {
  description = "A set of SMB channel encryption. Possible values are AES-128-CCM, AES-128-GCM, and AES-256-GCM"
  type        = string
  default     = "AES-256-GCM"
}


#--------------------------------------Azure files authentication---------------------------
variable "directory_type" {
  description = "Specifies the directory service used. Possible values are AADDS and AD"
  type        = string
}
######################## active directory
variable "storage_sid" {
  description = "Specifies the security identifier (SID)"
  type        = string
}
variable "domain_name" {
  description = "Specifies the primary domain that the AD DNS server is authoritative for"
  type        = string
}
variable "domain_sid" {
  description = "Specifies the security identifier (SID"
  type        = string
}
variable "domain_guid" {
  description = "Specifies the domain GUID"
  type        = string
}
variable "forest_name" {
  description = "Specifies the Active Directory forest"
  type        = string
}
variable "netbios_domain_name" {
  description = "Specifies the NetBIOS domain name"
  type        = string
}
#------------------------------------------------routing----------------------------------------
variable "enable_routing" {
  description = "to enable routing"
  type        = bool
}
variable "publish_internet_endpoints" {
  description = "to publish internet routing storage endpoints"
  type        = bool
  default     = false
}
variable "publish_microsoft_endpoints" {
  description = "to publish Microsoft routing storage endpoints"
  type        = bool
  default     = false
}
variable "routing_choice" {
  description = "Specifies the kind of network routing opted by the user. Possible values are InternetRouting and MicrosoftRouting"
  type        = string
  default     = "MicrosoftRouting"
}
#--------------------------------------------blob_properties-------------------------------------
variable "enable_blob_properties" {
  description = "to enable blob properties"
  type        = bool
}
variable "enable_versioning" {
  description = "to enable versioning"
  type        = bool
  default     = false
}
variable "last_access_time_enabled" {
  description = "to enable last access time based tracking"
  type        = bool
  default     = false
}
variable "change_feed_enabled" {
  description = "to enable blob service properties for change feed events"
  type        = bool
  default     = false
}
variable "change_feed_retention_in_days" {
  description = "The duration of change feed events retention in days. The possible values are between 1 and 146000 days (400 years)."
  type        = number
  default     = 7
}
variable "default_service_version" {
  description = "service version"
  type        = string
  default     = "2020-06-12"
}
################################### cors rule
variable "blob_properties_allowed_headers" {
  description = "list of headers that are allowed to be a part of the cross-origin request"
  type        = list(string)
}
variable "blob_properties_allowed_methods" {
  description = "list of HTTP methods that are allowed to be executed by the origin. Options are: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH."
  type        = list(string)
}
variable "blob_properties_allowed_origins" {
  description = "list of origin domains that will be allowed by CORS"
  type        = list(string)
}
variable "blob_properties_exposed_headers" {
  description = "list of response headers that are exposed to CORS clients"
  type        = list(string)
}
variable "blob_properties_max_age_in_seconds" {
  description = "number of seconds the client should cache a preflight response"
  type        = number
}
##################################### delete retention policy
variable "blob_soft_delete_retention_days" {
  description = "Retention days for deleted blob. Valid value is between 1 and 365 (set to 0 to disable)."
  type        = number
  default     = 7
}
##################################### container delete retention policy
variable "container_soft_delete_retention_days" {
  description = "Specifies the number of days that the blob should be retained, between `1` and `365` days. Defaults to `7`"
  type        = number
  default     = 7
}
#----------------------------------------- queue properties --------------
##################################### cors rule
variable "queue_properties_allowed_headers" {
  description = "list of headers that are allowed to be a part of the cross-origin request"
  type        = list(string)
}
variable "queue_properties_allowed_methods" {
  description = "list of HTTP methods that are allowed to be executed by the origin. Options are: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH."
  type        = list(string)
}
variable "queue_properties_allowed_origins" {
  description = "list of origin domains that will be allowed by CORS"
  type        = list(string)
}
variable "queue_properties_exposed_headers" {
  description = "list of response headers that are exposed to CORS clients"
  type        = list(string)
}
variable "queue_properties_max_age_in_seconds" {
  description = "number of seconds the client should cache a preflight response"
  type        = number
}
################################### logging
variable "logging_delete" {
  description = "Indicates whether all delete requests should be logged"
  type        = bool
}
variable "logging_read" {
  description = "Indicates whether all read requests should be logged"
  type        = bool
}
variable "logging_version" {
  description = "The version of storage analytics to configure"
  type        = string
}
variable "logging_write" {
  description = "Indicates whether all write requests should be logged"
  type        = bool
}
variable "logging_retention_policy_days" {
  description = "Specifies the number of days that logs will be retained"
  type        = number
  default     = null
}
################################ minute metrics
variable "minute_metrics_enabled" {
  description = "Indicates whether minute metrics are enabled for the Queue service"
  type        = bool
}
variable "minute_metrics_version" {
  description = "The version of storage analytics to configure"
  type        = string
}
variable "minute_metrics_include_apis" {
  description = "Indicates whether metrics should generate summary statistics for called API operations"
  type        = bool
  default     = null
}
variable "minute_metrics_retention_policy_days" {
  description = "Specifies the number of days that logs will be retained"
  type        = number
  default     = null
}
################################# hour metrics
variable "hour_metrics_enabled" {
  description = "Indicates whether minute metrics are enabled for the Queue service"
  type        = bool
}
variable "hour_metrics_version" {
  description = "The version of storage analytics to configure"
  type        = string
}
variable "hour_metrics_include_apis" {
  description = "Indicates whether metrics should generate summary statistics for called API operations"
  type        = bool
  default     = null
}
variable "hour_metrics_retention_policy_days" {
  description = "Specifies the number of days that logs will be retained"
  type        = number
  default     = null
}
#--------------------------------------------------------- storage account network rules--------------------------------------
variable "network_rule_default_action" {
  description = "Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow"
  type        = string
}
variable "ip_rules" {
  description = " List of public IP or IP ranges in CIDR Format."
  type        = list(string)
  default     = null
}
variable "subnet_id" {
  description = "list of subnet IDs"
  type        = string
  default     = null
}
variable "bypass" {
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None"
  type        = list(string)
  default     = ["None"]
}
#################################### private link access
variable "endpoint_resource_id" {
  description = "The resource id of the resource access rule to be granted access"
  type        = string
}
variable "endpoint_tenant_id" {
  description = "he tenant id of the resource of the resource access rule to be granted access"
  type        = string
  default     = null
}
#------------------------------storage encryption scope---------
variable "encryption_scopes" {
  description = "Encryption scopes, keys are scope names. more info https://docs.microsoft.com/en-us/azure/storage/common/infrastructure-encryption-enable?tabs=portal"
  type = map(object({
    enable_infrastructure_encryption = bool
    source_encryption                = string
  }))

}
#-----------------------------------------------------------threat protection--------------------------------------------------
variable "enable_advanced_threat_protection" {
  description = "to enable threat protection"
  type        = bool
}

#-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#

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

#----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#

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

##############################################################################################
##############################################################################################

#--------------Private Endpoint----------------------------

variable "create_private-endpoint" {
  type        = string
  description = "pvt endpoint count"
}

variable "storage_account_id" {
  type = string

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
}

variable "private_dns_zone_group" {

  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = null
}

#----------------------------------------------------------------
variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
}