variable "csv_file_name_for_Route_Table" {
  type        = string
  description = "Name of the CSV file where Route Table details defined."
}
variable "location" {
  type        = string
  description = "Location of Route Table"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group in which Route Table present"
}

variable "disable_bgp_route_propagation" {
  type = bool
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  default = false
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}
