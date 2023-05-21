variable "kusto_database" {
  type        = string
  description = "The name of the Kusto Database to create. Changing this forces a new resource to be created."

}
variable "hot_cache_period" {
  type        = string
  description = "The time the data that should be kept in cache for fast queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan"
  default     = null
}
variable "soft_delete_period" {
  type        = string
  description = "The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan"
  default     = null
}
variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(any)
}
variable "resource_group_name" {
  type        = string
  description = "Resource Group for the Data Explorer"
}

variable "location" {
  type        = string
  description = "Location for the Data Explorer"
}

variable "kusto_cluster" {
  type        = string
  description = "Name of of Data Explorer"
}
