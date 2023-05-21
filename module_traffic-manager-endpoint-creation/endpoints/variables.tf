
#-----------------------------------------------RESOURCE GROUP----------------------------------------------------#

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}
variable "resource_group_location" {
  type        = string
  description = "Resource Group Location"
}

#------------------------------------------------PUBLIC IP-------------------------------------------------------#

variable "public_ip1_name" {
  type        = string
  description = "Public IP Name"
}
variable "public_ip1_allocation_method" {
  type        = string
  description = "Public IP Allocation Method"
}
variable "domain_name_label" {
  type        = string
  description = "Domain Name Label"
}
variable "public_ip2_name" {
  type        = string
  description = "Public IP Name"
}
variable "public_ip2_allocation_method" {
  type        = string
  description = "Public IP Allocation Method"
}
variable "domain_name_label1" {
  type        = string
  description = "Domain Name Label"
}

#----------------------------------------------TRAFFIC MANAGER----------------------------------------------------#

variable "traffic_manager_profile_name" {
  type        = string
  description = "Traffic Manager Profile Name"
}
variable "traffic_routing_method" {
  type        = string
  description = "Define the Rounting Method"
}
variable "traffic_view_enabled" {
  type        = bool
  description = "Enable/Disable Traffic View"
}
variable "dns_config_name" {
  type        = string
  description = "DNS config name"
}

#------------------------------------------------END POINTS-------------------------------------------------------#

variable "azure_end_point1_name" {
  type        = string
  description = "value"
}
variable "azure_end_point2_name" {
  type        = string
  description = "value"
}


#------------------------------------------------TAGS--------------------------------------------------#

variable "tags" {
  type        = map(string)
  description = "tags for traffic manager profile"
}

#-------------------------------------------STORAGE ACCOUNT---------------------------------------------#

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