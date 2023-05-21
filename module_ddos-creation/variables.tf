variable "ddos_plan_name" {
  type = string
  description = "Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created."
}
variable "location" {
  type = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type = string
  description = "The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "tags" {
  type = map(string)
  description = "A mapping of tags to assign to the resource."
}
