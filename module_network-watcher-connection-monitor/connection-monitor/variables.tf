variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "vnet_name" {
  type        = string
  description = "VNET name in Azure"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

variable "application_gateway_name" {
  type = string
}
variable "network_interface_name" {
  type        = string
  description = "Network interface name in Azure"
}


variable "network_watcher_name" {
  type        = string
  description = "Network interface name in Azure"
}

variable "virtual_machine" {
  type        = string
  description = "Name of the virtual machine"
}

variable "publisher" {
  type        = string
  description = "Specifies the publisher of the image."

}

variable "virtual_machine_extension_name" {
  type        = string
  description = "name of vm extension"
}

variable "type" {
  type        = string
  description = "the type of extension, available types for a publisher can be found using the Azure CLI."
}

variable "type_handler_version" {
  type        = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
}

variable "auto_upgrade_minor_version" {
  type        = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "name of workspace"
}

variable "connection_monitor_name" {
  type        = string
  description = "The name which should be used for this Network Connection Monitor."
}

variable "endpoint_name1" {
  type        = string
  description = "The name of the endpoint for the Network Connection Monitor(source) "
}

variable "endpoint_name2" {
  type        = string
  description = "The name of the endpoint for the Network Connection Monitor(destination)"
}
variable "item_type" {
  type        = string
  description = "The type of items included in the filter"
}

variable "filter_type" {
  type        = string
  description = "The behaviour type of this endpoint filter"
}

variable "endpoint_address" {
  type        = string
  description = "The IP address or domain name of the Network Connection Monitor endpoint."
}

variable "tc_name" {
  type        = string
  description = "The name of test configuration for the Network Connection Monitor."
}

variable "tc_protocol" {
  type        = string
  description = "The protocol used to evaluate tests."
}

variable "tc_frequency" {
  type        = string
  description = "the time interval in seconds at which the test evaluation will happen"
}

variable "tc_port" {
  type = string
}

variable "test_group_name" {
  type        = string
  description = "The name of the test group for the Network Connection Monitor."
}

variable "destination_endpoints" {
  type        = list(any)
  description = "A list of destination endpoint names."
}

variable "source_endpoints" {
  type        = list(any)
  description = " A list of source endpoint names."
}

variable "test_configuration_names" {
  type        = list(any)
  description = "A list of test configuration names."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

