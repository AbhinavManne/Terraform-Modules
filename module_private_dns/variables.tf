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
  description = "name - (Required) The name of the DNS A Record. TTL - (Required) The Time To Live (TTL) of the DNS record in seconds.records - (Required) List of IPv4 Addresses."
}

variable "aaaa_records" {
  type = object({
    name    = string
    ttl     = number
    records = list(string)
  })
  description = "name - (Required) The name of the DNS A Record. TTL - (Required) The Time To Live (TTL) of the DNS record in seconds. records - (Required) A list of IPv6 Addresses."
}

variable "cname_records" {
  type = object({
    name    = string
    ttl     = number
    records = string
  })
  description = "name - (Required) The name of the DNS CNAME Record.ttl - (Required) The Time To Live (TTL) of the DNS record in seconds.record - (Required) The target of the CNAME."
}

variable "mx_record" {
  type = object({
    name = string
    ttl  = number
  })
  description = "name - (Optional) The name of the DNS MX Record. Changing this forces a new resource to be created. Default to '@' for root zone entry.record - (Required) One or more record blocks. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds."
}

variable "ptr_record" {
  type = object({
    name    = string
    ttl     = number
    records = list(string)
  })
  description = "name - (Required) The name of the DNS PTR Record. Changing this forces a new resource to be created. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds. records - (Required) List of Fully Qualified Domain Names."
}

variable "srv_records" {
  type = object({
    name = string
    ttl  = number
  })
  description = "name - (Required) The name of the DNS SRV Record. Changing this forces a new resource to be created. record - (Required) One or more record blocks. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds."
}

variable "txt_record" {
  type = object({
    name = string
    ttl  = number
  })
  description = "name - (Required) The name of the DNS TXT Record. Changing this forces a new resource to be created. record - (Required) One or more record blocks. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds. "
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
