variable "private_dns_name" {
  type        = string
  description = "Name of private dns on azure portal "
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name on Azure Portal "
}

variable "soa_record" {
  type = object({
    email        = string
    expire_time  = string
    minimum_ttl  = number
    refresh_time = string
    retry_time   = string
    ttl          = number
  })
  description = "email - (Required) The email contact for the SOA record. expire_time - (Optional) The expire time for the SOA record. Defaults to 2419200. minimum_ttl - (Optional) The minimum Time To Live for the SOA record. By convention, it is used to determine the negative caching duration. Defaults to 10. refresh_time - (Optional) The refresh time for the SOA record. Defaults to 3600.retry_time - (Optional) The retry time for the SOA record. Defaults to 300. ttl - (Optional) The Time To Live of the SOA Record in seconds. Defaults to 3600.  "
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "a_records" {
  type = object({
    name    = string
    ttl     = number
    records = list(string)
  })
}

variable "aaaa_records" {
  type = object({
    name    = string
    ttl     = number
    records = list(string)
  })
}

variable "cname_records" {
  type = object({
    name    = string
    ttl     = number
    records = string
  })
}

variable "mx_record" {
  type = object({
    name = string
    ttl  = number
  })
}

variable "ptr_record" {
  type = object({
    name    = string
    ttl     = number
    records = list(string)
  })
}

variable "srv_records" {
  type = object({
    name = string
    ttl  = number
  })
}

variable "txt_record" {
  type = object({
    name = string
    ttl  = number
  })
}

variable "add_pdns_vnet_link" {
  type        = bool
  description = "Wants to add private dns virtual network link?"
}

variable "private_dns_zone_vnet_link_name" {
  type        = string
  description = "Name of the Private DNS Zone Virtual Network Link "
}

variable "virtual_network_id" {
  type        = string
  description = "Virtual Network ID "
}

variable "registration_enabled" {
  type        = bool
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
}
