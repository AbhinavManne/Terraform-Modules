variable "resource_group" {
  type        = string
  description = "The name of the resource group"
}

variable "cdn_profile" {
  type        = string
  description = "Specifies the name of the CDN Profile"
}

variable "cdn_endpoint" {
  type        = string
  description = " Specifies the name of the CDN Endpoint"
}

variable "sku" {
  type        = string
  description = " The pricing related information of current CDN profile"
}

variable "origin" {
  type        = string
  description = " name of the origin"
}

variable "host_name" {
  type        = string
  description = "string that determines the hostname/IP address of the origin server"
}

variable "optimization_type" {
  type        = string
  description = "What types of optimization should this CDN Endpoint optimize for"
}

variable "relative_path" {
  type        = string
  description = "The relative path applicable to geo filter"
}

variable "action" {
  type        = string
  description = "The Action of the Geo Filter."
}

variable "delivery_rule" {
  type        = string
  description = " The Name which should be used for this Delivery Rule. "
}

variable "order" {
  type        = string
  description = "The order used for this rule, which must be larger than 1. "
}

variable "behavior" {
  type        = string
  description = "The behavior of the cache"
}

variable "duration" {
  type        = string
  description = "Duration of the cache"
}

variable "country_codes" {
  type        = list(string)
  description = "A List of two letter country codes "
}

variable "operator" {
  type        = string
  description = "Operator required for url file extension"
}

variable "match_values" {
  type        = list(any)
  description = "A List of two letter country codes "
}

variable "transforms" {
  type        = list(string)
  description = "Valid values are Lowercase and Uppercase "
}

variable "querystring_caching_behaviour" {
  type        = string
  description = "Sets query string caching behavior"
}

variable "is_compression_enabled" {
  type        = string
  description = "indicates whether compression is to be enabled. "
}

variable "content_types_to_compress" {
  type        = list(string)
  description = " An array of strings that indicates a content types on which compression will be applied"
}

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}

#--------------------------------------------Resource Group--------------------------------------------#

variable "resource_group_name" {
  type        = string
  description = "value"
}
variable "location" {
  type        = string
  description = "value"
}
variable "create_resource_group" {
  type        = bool
  description = "value"
}

#---------variables for Storage Account--------#

variable "storage_account_name" {
  type        = string
  description = "Resource Group Name"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage Account Tier"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage Account Replication Type"
}