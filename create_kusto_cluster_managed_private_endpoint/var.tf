variable "kusto_cluster_managed_private_endpoint" {
  type        = string
  description = "The name of the Managed Private Endpoints to create. Changing this forces a new resource to be created."

}
variable "private_link_resource_id" {
  type        = string
  description = "The ARM resource ID of the resource for which the managed private endpoint is created. Changing this forces a new resource to be created."

}
variable "private_link_resource_region" {
  type        = string
  description = "The region of the resource to which the managed private endpoint is created. Changing this forces a new resource to be created."
  default     = null
}

variable "group_id" {
  type        = string
  description = "The group id in which the managed private endpoint is created. Changing this forces a new resource to be created."

}
variable "request_message" {
  type        = string
  description = "The user request message."
  default     = null

}
variable "resource_group_name" {
  type        = string
  description = "Resource Group for the Data Explorer"
}
variable "kusto_cluster" {
  type        = string
  description = "Name of of Data Explorer"
}
variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(any)
}