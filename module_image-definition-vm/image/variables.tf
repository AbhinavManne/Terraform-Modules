#-------------------------------------------------Resource group variables-----------------------------------------------------
variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}
#-------------------------------------------------Virtual Machine variables-----------------------------------------------------
variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}
#-------------------------------------------------Managed Disk variables-----------------------------------------------------

variable "managed_disk" {
  type        = string
  description = "Name of the managed disk"
}
#-----------------------------------------------------Image variables--------------------------------------------------------
variable "image_name" {
  type        = string
  description = "Name of the custom image that is created."
}
variable "tags" {
  type        = map(any)
  description = "Tags"
}
variable "img_location" {
  type        = string
  description = "location of the custom image that is created."
}
variable "os_type" {
  type        = string
  description = "A string indicating the Operating System type for the VM."
}
variable "os_state" {
  type        = string
  description = "Specifies the state of the operating system contained in the blob. Currently, the only value is Generalized."
}