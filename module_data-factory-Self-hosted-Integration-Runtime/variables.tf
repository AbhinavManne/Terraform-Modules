variable "data_factory_id" {
  type        = string
  description = "Data factory id"
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

variable "resource_id" {
  type        = string
  description = "The resource identifier of the integration runtime to be shared. Changing this forces a new Data Factory to be created."
  default     = null
}