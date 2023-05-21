#--------------------------------------------------Resource Group Variables--------------------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Resource group name"
}
variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Name of the location"
}

#--------------------------------------------------Image Gallery Variables--------------------------------------------------
variable "gallery_name" {
  type        = string
  description = "The name of the Shared Image Gallery in which the Shared Image exists"
}
variable "tags" {
  type        = map(any)
  description = "Tags"
}

#--------------------------------------------------Shared Image Variables--------------------------------------------------
variable "shared_image_name" {
  type        = string
  description = "Name of the shared image name"
}
variable "os_type" {
  type        = string
  description = "type of os"
}
variable "publisher" {
  type        = string
  description = "publisher"
}
variable "offer" {
  type        = string
  description = "offer"
}
variable "sku" {
  type        = string
  description = "sku"
}