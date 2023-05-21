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
variable "kusto_attached_database_configuration" {
  type        = string
  description = "The name of the Kusto Attached Database Configuration to create. Changing this forces a new resource to be created."

}
variable "cluster_id" {
  type        = string
  description = "The resource id of the cluster where the databases you would like to attach reside."

}
variable "external_tables_to_exclude" {
  type        = list(string)
  description = "List of external tables exclude from the follower database."
  default     = null

}
variable "external_tables_to_include" {
  type        = list(string)
  description = "List of external tables to include in the follower database."
  default     = null
}
variable "materialized_views_to_exclude" {
  type        = list(string)
  description = "List of materialized views exclude from the follower database."
  default     = null
}
variable "materialized_views_to_include" {
  type        = list(string)
  description = "List of materialized views to include in the follower database."
  default     = null
}
variable "tables_to_exclude" {
  type        = list(string)
  description = "List of tables to exclude from the follower database."
  default     = null
}
variable "tables_to_include" {
  type        = list(string)
  description = "List of tables to include in the follower database."
  default     = null
}
variable "kusto_database" {
  type        = string
  description = "The name of the Kusto Database to create. Changing this forces a new resource to be created."

}
variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(any)
}