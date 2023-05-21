#---------------------------------- RESOURCE GROUP----------------------------------------------#
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

#--------------------------------RESOURCE: LOG ANALYTICS WORKSPACE ------------------------------#
variable "log_analytics_workspace" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}

variable "log_sku" {
  type        = string
  description = " Specifies the Sku of the Log Analytics Workspace."
  default     = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  default     = 7
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = " Internet ingestion enable or not"
  default     = true
}

variable "internet_query_enabled" {
  type        = bool
  description = "Interent quet enable or not"
  default     = true
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  description = " The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000."
  default     = 100
  validation {
  condition     = var.reservation_capacity_in_gb_per_day >=100 && var.reservation_capacity_in_gb_per_day <=5000 && var.reservation_capacity_in_gb_per_day%100==0
  error_message = "Must be in increments of 100 between 100 and 5000."
  }
}

variable "daily_quota_gb" {
  type        = number
  description = " The workspace daily quota for ingestion in GB."
  default     = -1
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}


#--------------------------------RESOURCE: LOG ANALYTICS SOLUTION ------------------------------#
variable "create_log_analytics_solution" {
  type        = bool
  description = "If you wants to create a log analytics solution resource or not"
  default     =  false
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
