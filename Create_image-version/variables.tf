#-----------------------------------------------------RBAC Variables-----------------------------------------------------
variable "role_definition_name" {
  type        = list(string)
  default     = ["reader", "contributor"]
  description = "List of Role Definitions"
}

#----------------------------------------------------resource group variables--------------------------------------------
variable "resource_group" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}
variable "create_resource_group" {
  type        = bool
  description = "Need Resource group resource or resource group data source ? "
}

#-------------------------------------------------------Image variables--------------------------------------------------
variable "image_name" {
  type        = string
  description = "Name of the custom image that is created."
}

#-----------------------------------------------------Shared Image variables----------------------------------------------
variable "shared_image_name" {
  type        = string
  description = "Name of the shared image."
}
variable "os_type" {
  type        = string
  description = "A string indicating the Operating System type for the VM."
}

variable "hyper_v_generation" {
  type        = string
  description = "Hyper v generation" # Kept V2
}
variable "publisher" {
  type        = string
  description = "publisher name"
}
variable "offer" {
  type        = string
  description = "offername"
}
variable "sku" {
  type        = string
  description = "sku"
}

#------------------------------------------------Shared Image Gallery variables------------------------------------------
variable "shared_image_gallery_name" {
  type        = string
  description = "Name of the shared image gallery"
}

#-------------------------------------------------Shared Image Version variables-----------------------------------------
variable "shared_image_version_name" {
  type        = string
  description = "Name of the shared image version" # Use "1.0.0" kind of names(values) else it will produce an error
}
variable "tags" {
  type        = map(any)
  description = "Tags"
}
variable "regional_replica_count" {
  type        = number
  description = "regional replica count"
}
variable "storage_account_type" {
  type        = string
  description = "type of storage account"
}
