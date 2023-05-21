#-----------------------------VARIABLE: DATA SOURCE: RESOURCE GROUP---------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#---------------------------VARIABLE: RESOURCE: AZURE FRONTDOOR-------------------------------------------#
variable "frontdoor_name" {
  type        = string
  description = "Name of the azure frontdoor"
}

variable "enforce_backend_pools_certificate_name_check" {
  type        = bool
  description = "Whether to enforce certificate name check in backend pools"
}

variable "frontend_endpoint_name" {
  type        = string
  description = "Name of the frontend endpoint"
}

 variable "frontdoor_waf_policy_id" {
   type        = string
   description = "ID of the frontdoor web application firewall policy"
 }

variable "load_balancing_name" {
  type        = string
  description = "Name of the load balancer"
}

variable "health_probe_name" {
  type        = string
  description = "Name of the health probe"
}

variable "backend_pool_name" {
  type        = string
  description = "Name of the backend pool"
}

variable "first_backend_host" {
  type        = string
  description = "URL of a backend host"
}

variable "second_backend_host" {
  type        = string
  description = "URL of another backend host"
}

variable "http_port" {
  type        = number
  description = "HTTP port no."
}

variable "https_port" {
  type        = number
  description = "HTTPS port no."
}

variable "routing_rule_name" {
  type        = string
  description = "Name of the routing rule"
}

variable "accepted_protocols" {
  type        = list(string)
  description = "List of Protocol schemes to match for the Backend Routing Rule"
}

variable "patterns_to_match" {
  type        = list(string)
  description = "List of route patterns for the Backend Routing Rule"
}

variable "forwarding_protocol" {
  type        = string
  description = "Protocol to use when redirecting"
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}