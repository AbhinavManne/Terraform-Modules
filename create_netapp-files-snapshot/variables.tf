variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"

}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "account_name" {
  type        = string
  description = "netapp account name in Azure"
}
variable "pool_name" {
  type        = string
  description = "netapp pool name in Azure"
}
variable "virtual_network_name" {
  type        = string
  description = "vnet name in Azure"
}
 
variable "subnet_name" {
  type        = string
  description = "subnet name in Azure"
}

variable "service_level" {
  type        = string
  description = "the target performance of the file system."
}

variable "size_in_tb" {
  type        = number
  description = "Provisioned size of the pool in TB"
}

variable "volume_name" {
  type        = string
  description = "The name of the NetApp Volume."
}
variable "volume_path"{
  type = string
  description = "A unique file path for the volume."
}

# variable "protocols" {
#   type        = list
#   description = "The target volume protocol expressed as a list."
# }
variable "security_style" {
  type        = string
  description = "Volume security style, accepted values are Unix or Ntfs"
}
variable "storage_quota_in_gb" {
  type        = number
  description = "The maximum Storage Quota allowed for a file system in Gigabytes."
}


variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network."
}

variable "address_prefixes"{
  type=list(string)
  description="The address prefix to use for the subnet."
}

variable "delegation_name" {
  type=string
  description="delegation name"
}

variable "service_delegation_name" {
  type=string
  description="service delegation for subnet"
}

variable "actions" {
  type=list
  description= "A list of Actions which should be delegated."
}

variable "netapp_snapshot" {
  type=string
  description="The name of the NetApp Snapshot"
}

variable tags {
  type        = map(any)
  description = "Tags"
}
