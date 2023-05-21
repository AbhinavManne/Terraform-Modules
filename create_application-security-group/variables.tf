variable resource_group_name {
  type        = string
  description = "Name of the resource group in which to create the Application Security Group"
  default = ""
}

variable "location" {
  type = string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}

variable application_security_group {
  type        = string
  description = "Name of the Application Security Group"
}

variable tags {
  type        = map
  description = "Tags"
}

