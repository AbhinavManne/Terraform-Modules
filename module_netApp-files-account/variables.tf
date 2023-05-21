variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the NetApp Account should be created"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "netapp_account_name" {
  type        = string
  description = "The name of the NetApp Account. Changing this forces a new resource to be created."
}


variable "username" {
  type        = string
  description = "The Username of Active Directory Domain Administrator."
}

variable "password" {
  type        = string
  description = "The password associated with the username."
  sensitive   = true
}

variable "smb_server_name" {
  type        = string
  description = "The NetBIOS name which should be used for the NetApp SMB Server, which will be registered as a computer account in the AD and used to mount volumes."
}

variable "dns_servers" {
  type        = list(any)
  description = "A list of DNS server IP addresses for the Active Directory domain. Only allows IPv4 address."
}

variable "domain" {
  type        = string
  description = "he name of the Active Directory domain"
}

variable "organizational_unit" {
  type        = string
  description = "The Organizational Unit (OU) within the Active Directory Domain."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}