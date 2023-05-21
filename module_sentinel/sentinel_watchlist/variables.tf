#--------------------------------RESOURCE: LOG ANALYTICS WORKSPACE----------------------------------#
variable "log_analytics_workspace" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "log_sku" {
  type        = string
  description = " Specifies the Sku of the Log Analytics Workspace."
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = " Internet ingestion enabled or not"
}

variable "internet_query_enabled" {
  type        = bool
  description = " Interent query enable or not"
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  description = " The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000."
}

variable "daily_quota_gb" {
  type        = number
  description = " The workspace daily quota for ingestion in GB."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

#--------------------------------RESOURCE: LOG ANALYTICS SOLUTION----------------------------------#
variable "create_log_analytics_solution" {
  type        = bool
  description = "If you want to create a log analytics solution resource or not"
}

variable "solution_name" {
  type        = string
  description = "Specifies the name of the solution to be deployed."
}

variable "plan_publisher" {
  type        = string
  description = "The publisher of the solution. For example Microsoft"
}

variable "plan_product" {
  type        = string
  description = "The product name of the solution. For example OMSGallery/Containers"
}

variable "promotion_code" {
  type        = string
  description = "A promotion code to be used with the solution."
}

#----------------------------------RESOURCE: SENTINEL WATCHLIST------------------------------------#

variable "watchlist_config" {
  type = object({
    name             = string
    log_analytics_workspace_id = string
    display_name     = string
    item_search_key  = string
    default_duration = string
    description      = string
    labels           = list(string)
  })
  default = {
    default_duration = null
    description      = null
    display_name     = ""
    item_search_key  = ""
    labels           = null
    log_analytics_workspace_id = null
    name             = ""
  }
  description = "Manages a Sentinel Watchlist."
}

#--------------------------------RESOURCE: SENTINEL WATCHLIST ITEM--------------------------------#

variable "watchlist_item_config" {
  type = object({
    properties = map(string)
    name       = string
  })
  default = {
    name       = null
    properties = null
  }
  description = "Manages a Sentinel Watchlist Item."
}
