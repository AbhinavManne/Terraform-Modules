#------------------------------------resource group variables-------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource group location"
}

#-------------------------------------IP Group Variables------------------------------------
variable "ip_group" {
  type        = string
  description = " IP Group Name"
}

variable "cidrs" {
  type        = list(string)
  description = "cidr block"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}