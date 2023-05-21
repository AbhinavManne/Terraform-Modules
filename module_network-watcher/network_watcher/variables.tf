variable "network_watcher" {
  type        = string
  description = "The name of the Network Watcher. Changing this forces a new resource to be created."


}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}
variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Network Watcher was deployed. Changing this forces a new resource to be created."

}



