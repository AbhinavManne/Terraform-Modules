variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "ddos_name" {
  type        = string
  description = "Name of the DDoS Plan"
}
variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}
variable "address_space" {
  type        = list
  description = "Address Space for the Virtual Network"
}
variable "enable" {
  type        = bool
  description = "Value for enabling DDoS Plan in a VNET; either true or false"
}