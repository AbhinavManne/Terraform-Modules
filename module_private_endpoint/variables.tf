#-------------RESOURCE GROUP-----------#
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}
#----------------TAGS------------------#

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}


# #---------------END POINT----------------#
variable "private_dns_zone_group" {
  description = "private dns zone group block"
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })

}


variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"

}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"

}

variable "subresource_names" {
  type        = list(string)
  description = "sub resources names in Azure"

}

variable "is_manual_connection" {
  type        = string
  description = "Status of manual connection "

}

variable "request_message" {
  type        = string
  description = "request msg"
  default     = "PL"
}


variable "private_connection_resource_id" {
  type        = string
  description = "ID of resource to be associated"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "Id of subnet"


}

variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
  default     = null
}

