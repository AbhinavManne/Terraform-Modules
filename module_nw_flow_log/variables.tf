variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Network Watcher was deployed."

}
variable "location" {
  type        = string
  description = "The location where the Network Watcher Flow Log resides."
  default     = null

}
variable "nw_flow_log" {
  type = map(object({
    network_watcher_name                = string
    network_security_group_id           = string
    storage_account_id                  = string
    tags                                = map(string)
    version                             = number
    retention_policy_enabled            = bool
    retention_policy_days               = number
    traffic_analytics_enabled           = bool
    log_analytics_workspace_id          = string
    log_analytics_workspace_region      = string
    log_analytics_workspace_resource_id = string
    interval_in_minutes                 = number
    network_watcher_flow_logs_enabled   = bool
    log_analytics_workspace             = string

  }))
  description = "Map of network watcher flow log.  Parameters used to configure:traffic_analytics (optional, defaults to false),version (optional, defaults to 1),interval_in_minutes (optional, defaults to 10),log_analytics_workspace_id (optional),log_analytics_workspace_region(optional),log_analytics_workspace_resource_id(optional).tags(optional),location(optional),"


}












