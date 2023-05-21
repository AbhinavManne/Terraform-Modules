#-----------------------------------------REOURCE GROUP-----------------------------------------------#
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

#------------------------------------------------TAGS--------------------------------------------------#

variable "tags" {
  type        = map(string)
  description = "tags for traffic manager profile"
}

#--------------------------------------TRAFFIC MANAGER PROFILE-------------------------------------------#

variable "traffic_manager_profile_name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "traffic_routing_method" {
  type        = string
  description = "Algorithm used to route traffic"
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
  description = "The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP"
}

variable "interval_in_seconds" {
  type        = number
  description = "The interval used to check the endpoint health from a Traffic Manager probing agent. You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30"
  validation {
    condition     = var.interval_in_seconds == 30 || var.interval_in_seconds == 10
    error_message = "You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30."
  }
}

variable "timeout_in_seconds" {
  type        = number
  description = "The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint"
  validation {
    condition      =  var.timeout_in_seconds >= 5 && var.timeout_in_seconds <= 10
    error_message  = "Interval_in_seconds is set to 30, then timeout_in_seconds can be between 5 and 10 and If interval_in_seconds is set to 10, then valid values are between 5 and 9."
  }
}

variable "tolerated_number_of_failures" {
  type        = number
  description = "Valid values are between 0 and 9. The default value is 3."
}

variable "profile_status" {
  type        = string
  description = "The status of the profile, can be set to either Enabled or Disabled. Defaults to Enabled"
}

variable "traffic_view_enabled" {
  type        = bool
  description = "Indicates whether Traffic View is enabled for the Traffic Manager profile"
}

variable "max_return" {
  type        = number
  description = "The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8"
}

variable "expected_status_code_ranges" {
  type        = list(string)
  description = "A list of status code ranges in the format of 100-101"
}

variable "custom_header" {
  type = list(object({

    name  = string
    value = string
  }))
}

# -----------------------------------azure end points -------------------------------------- #

variable "azure_end_point_name" {
  type        = string
  description = "value"
}

variable "azure_end_point_weight" {
  type        = number
  description = "value"
}

variable "enabled" {
  type        = bool
  description = "Is the endpoint enabled? Defaults to true"
}

variable "priority" {
  type        = number
  description = "Specifies the priority of this Endpoint, this must be specified for Profiles using the Priority traffic routing method. Supports values between 1 and 1000, with no Endpoints sharing the same value. If omitted the value will be computed in order of creation"
}

variable "subnet" {
  type = list(object({

    first = string
    last  = string
    scope = number
  }))

}

variable "target_resource_id" {
  type        = string
  description = "ID of the public ip calling from other module"

}

variable "geo_mappings" {
    type        = list(string)
    description = "A list of Geographic Regions used to distribute traffic, such as WORLD, UK or DE"
}

variable "endpoint_custom_header" {
    type = list(object({
           
        name    = string
        value   = string
    }))
}


