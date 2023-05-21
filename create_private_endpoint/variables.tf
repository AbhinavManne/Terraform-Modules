variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}


#----------------Tags------------------#

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}


variable "subnet_id" {
  description = "Id of subnet"
  #default = ""
}




#---------------END POINT----------------#

variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"
}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"
}
variable "private_connection_resource_id" {
  description= "ID of resource to be associated"
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
}
variable "private_dns_zone_group" {
 
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = null
}


#----------------------------------------------------------------
variable "private_connection_resource_alias" {
  type=string
  description = "alias name"
}