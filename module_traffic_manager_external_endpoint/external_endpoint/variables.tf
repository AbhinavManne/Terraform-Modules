variable "resource_group_name" {
    type        = string
    description = "resource group name"
}

#------------------------------resource group name-----------------------------------------#
variable "profile_name" {
    type        = string
    description = "name of the traffic manager profile"
}

variable "traffic_routing_method" {
    type        = string
    description = "Specifies the algorithm used to route traffic, possible values are:Geographic,MultiValue, MultiValue, Performance, Priority, Subnet, Weighted"
}

variable "ttl" {
  type        = number
  description = "The TTL value of the Profile used by Local DNS resolvers and clients."
}

variable "protocol" {
  type        = string
  description = "The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP"
}

variable "port" {
  type        = number
  description = "Port number used by the monitoring checks"
}

variable "path" {
  type        = string
  description = "The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP."
}

variable "interval_in_seconds" {
  type        = number
  description = "The interval used to check the endpoint health from a Traffic Manager probing agent. You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30"
  validation {
    condition     = var.interval_in_seconds == 30 || var.interval_in_seconds == 10
    error_message = "You can specify two values here: 30 (normal probing) and 10 (fast probing).The default value is 30."
  }
}

variable "timeout_in_seconds" {
  type        = number
  description = "The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint. If interval_in_seconds is set to 30, then timeout_in_seconds can be between 5 and 10. The default value is 10. If interval_in_seconds is set to 10, then valid values are between 5 and 9 and timeout_in_seconds is required"
  validation {
    condition      =  var.timeout_in_seconds >= 5 && var.timeout_in_seconds <= 10
    error_message  = "Interval_in_seconds is set to 30, then timeout_in_seconds can be between 5 and 10 and If interval_in_seconds is set to 10, then valid values are between 5 and 9."
  }
}

variable "tolerated_number_of_failures" {
  type        = number
  description = "Valid values are between 0 and 9. The default value is 3."
}

variable "max_return" {
  type        = number
  description = "Possible values range from 1 to 8"
}

#------------------------------------------------TAGS--------------------------------------------------#

variable "tags" {
  type        = map(string)
  description = "tags for traffic manager profile"
}

#---------------------------------External endpoint arguments------------------------------#
variable "external_endpoint_name" {
    type        = string
    description = "Name of the endpoint"
}

variable "weight" {
    type        = number
    description = "valid values are between 1 and 1000."
}

variable "target" {
    type        = string
    description = "The FQDN DNS name of the target"
}

variable "endpoint_location" {
    type        = string
    description = "location of the endpoint"
}

variable "enabled" {
    type        = bool
    description = "enable value"  
}

variable "priority" {
    type        = number
    description = "valid values are between 1 and 1000"  
}

variable "custom_header" {
    type = list(object({
           
        name = string
        value = string
    }))
    description = "One or more custom_header blocks"
}

variable "subnet" {
    type = list(object({

        first = string
        last  = string
        scope = number
    }))
    description = "One or more subnet blocks"
}

variable "geo_mappings" {
    type        = list(string)
    description = "A list of Geographic Regions used to distribute traffic, such as WORLD, UK or DE"
}