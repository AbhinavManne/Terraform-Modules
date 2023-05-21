variable "kusto_database_principal_assignment" {
  type        = string
  description = "name of kusto database principal assignment"

}
variable "role" {
  type        = string
  description = "The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created."
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
variable "kusto_database" {
  type        = string
  description = "The name of the Kusto Database to create. Changing this forces a new resource to be created."

}
#variable "tenant_id" {
  #type        = string
  #description = "The tenant id in which the principal resides. Changing this forces a new resource to be created."

#}
#variable "principal_id" {
  #type        = string
  #description = "The object id of the principal. Changing this forces a new resource to be created."

#}
variable "principal_type" {
  type        = string
  description = "The type of the principal. Valid values include App, Group, User. Changing this forces a new resource to be created."

}
