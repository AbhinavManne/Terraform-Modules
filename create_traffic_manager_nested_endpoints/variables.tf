#-----------------------------------parent profile---------------------------------------#
variable "resource_group_name" {
    type        = string
    description = "name of the resource group"
}

variable "parent_profile_name" {
    type        = string
    description = "name of the parent profile name"
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

#------------------------------------nested profile----------------------------------------#
variable "nested_profile_name" {
  type = string
  description = "name of the nested profile name"
}

variable "nested_traffic_routing_method" {
  type        = string
  description = "Specifies the algorithm used to route traffic, possible values are:Geographic,MultiValue, MultiValue, Performance, Priority, Subnet, Weighted"
}

variable "nested_ttl" {
  type        = number
  description = "The TTL value of the Profile used by Local DNS resolvers and clients."
}

variable "nested_protocol" {
  type        = string
  description = "The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP"
}

variable "nested_port" {
  type        = number
  description = "Port number used by the monitoring checks"
}

variable "nested_path" {
  type        = string
  description = "The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP."
}

variable "nested_max_return" {
  type        = number
  description = "Possible values range from 1 to 8"
  
}

#------------------------------------Tags--------------------------------------------------#

variable "tags" {
  type        = map(string)
  description = "tags for traffic manager profile"
}

#------------------------------------nested endpoint required arguments------------------#
variable "name" {
    type          = string
    description   = "name of the nested endpoint"
}

variable "minimum_child_endpoints" {
    type          = number
    description   = "This argument specifies the minimum number of endpoints and his value must be larger than 0"
  
}



#--------------------------------------nested endpoint optional arguments--------------------------------#
variable "custom_header" {
    type = list(object({
           
        name = string
        value = string
    }))
}

variable "subnet" {
    type = list(object({

        first = string
        last  = string
        scope = number
    }))
  
}

variable "minimum_required_child_endpoints_ipv4" {
    type        = number
    description = "value"
  
}

variable "minimum_required_child_endpoints_ipv6" {
    type        = number
    description = "value"
  
}

variable "endpoint_location" {
    type          = string
    description   = "location of the endpoint"
}

variable "enabled" {
    type         = bool
    description   = "Is the endpoint enabled"
}

variable "weight" {
    type = number
    description   = "Profiles using the Weighted traffic routing method. Valid values are between 1 and 1000"
  
}

variable "priority" {
    type          = number
    description   = "Supports values between 1 and 1000"
  
}

variable "geo_mappings" {
  type        = list(string)
  description = "A list of Geographic Regions used to distribute traffic, such as WORLD, UK or DE"
}

