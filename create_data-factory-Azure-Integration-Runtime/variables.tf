#-------------------------------Integration runtime variables ------------------------#
variable "location" {
  type        = string
  description = "Resource group location"
}

variable "data_factory_id" {
  type        = string
  description = "Data afctory id"
}

variable "integration_runtime_custom_name" {
  type        = string
  description = "Name of the integration_runtime resource"
}


variable "integration_runtime_description" {
  description = "Integration runtime description"
  type        = string
  default     = null
}

variable "integration_runtime_configuration" {
  description = "(All arguments are Optional)Azure runtime integration"
  type        = map(any)
  default     = {}
}
