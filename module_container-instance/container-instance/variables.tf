variable "container_group" {
  type        = string
  description = "The name of the container group"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group"
}


variable "ip_address_type" {
  type        = string
  description = " Specifies the ip address type of the container"
}

variable "dns_name_label" {
  type        = string
  description = "The DNS label/name for the container groups IP"
}

variable "os_type" {
  type        = string
  description = "The OS for the container group. Allowed values are Linux and Windows"
}

variable "container_name" {
  type        = string
  description = "The name of the container"
}

variable "image_name" {
  type        = string
  description = "The container image name"
}

variable "cpu_core_number" {
  type        = string
  description = "The required number of CPU cores of the containers"
}

variable "memory_size" {
  type        = string
  description = "The required memory of the containers in GB"
}

variable "port_number" {
  type        = string
  description = "A public port for the container"
}

variable "protocol" {
  type        = string
  description = "The network protocol associated with port"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}