#-----------------------------------------REOURCE GROUP-----------------------------------------------#

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "resource_group_location" {
  type        = string
  description = "Locarion of the resource group"
}

#--------------------------------------TAGS AND ROLE DEFINITION------------------------------------------#

variable "tags" {
  type        = map(string)
  description = "tags for traffic manager profile"
}

variable "role_definition" {
  type    = list(any)
  default = ["reader"]
}

#--------------------------------------TRAFFIC MANAGER PROFILE-------------------------------------------#

variable "traffic_manager_profile_name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "traffic_routing_method" {
  type        = string
  description = "Algorithm used to route traffic"
}

variable "traffic_view_enabled" {
  type        = bool
  description = "Indicates whether Traffic View is enabled for the Traffic Manager profile"
}

variable "ttl" {
  type        = number
  description = "The TTL value of the Profile used by Local DNS resolvers and clients."
}

variable "protocol" {
  type        = string
  description = "Protocol used by the monitoring checks"
}

variable "port" {
  type        = number
  description = "Port number used by the monitoring checks"
}

variable "path" {
  type        = string
  description = "Path used by the monitoring checks"
}

variable "interval_in_seconds" {
  type        = number
  description = "The interval used to check the endpoint health from a Traffic Manager probing agent"
}

variable "timeout_in_seconds" {
  type        = number
  description = "The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint"
}

variable "tolerated_number_of_failures" {
  type        = number
  description = "The number of failures a Traffic Manager probing agent tolerates before marking that endpoint as unhealthy"
}

#--------------------------------------STORAGE ACCOUNT--------------------------------------------------#

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