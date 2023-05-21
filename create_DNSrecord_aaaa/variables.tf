#----------------------------------VARIABLES: DATA SOURCE: RESOURCE GROUP-------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#------------------------------------VARIABLES: DNS ZONE--------------------------------------------------#
variable "DNSZone_name" {
  type        = string
  description = "DNSZone name in Azure"
}

variable "email" {
  type        = string
  description = "The email contact for the SOA record"
}

variable "host_name" {
  type        = string
  description = "The domain name of the authoritative name server for the SOA record. Defaults to ns1-03.azure-dns.com."
}

variable "expire_time" {
  type        = number
  description = "The expire time for the SOA record. Defaults to 2419200."
}

variable "minimum_ttl" {
  type        = number
  description = "The minimum Time To Live for the SOA record. By convention, it is used to determine the negative caching duration. Defaults to 300."
}

variable "refresh_time" {
  type        = number
  description = " The refresh time for the SOA record. Defaults to 3600."
}

variable "retry_time" {
  type        = number
  description = "The retry time for the SOA record. Defaults to 300."
}

variable "serial_number" {
  type        = number
  description = "The serial number for the SOA record. Defaults to 1."
}

variable "ttl" {
  type        = number
  description = "The Time To Live of the SOA Record in seconds. Defaults to 3600."
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#------------------------------VARIABLE: RESOURCE: DNS AAAA RECORD----------------------------------------#
variable "DNSrecord_name" {
  type        = string
  description = "DNSrecord name in Azure"
}

variable "dns_aaaa_ttl" {
  type        = number
  description = "Time To Live of the DNS record in seconds"
}

variable "dns_aaaa_records" {
  type        = list(string)
  description = "List of IPv4 Addresses"
}

#----------------------------------VARIABLE: PRIVATE DNS ZONE-------------------------------------------#
variable "private_dns_zone_name" {
  type        = string
  description = "Private DNSZone name in Azure"
}

#----------------------------------VARIABLES: RBAC MODULE----------------------------------------------#

variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}

#------------------------------------------------------------------------------------------------------#