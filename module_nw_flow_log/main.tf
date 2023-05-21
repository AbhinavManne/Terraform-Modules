resource "azurerm_network_watcher_flow_log" "nw_flow_log" {
  for_each                  = var.nw_flow_log
  network_watcher_name      = lookup(each.value, "network_watcher_name")
  resource_group_name       = var.resource_group_name
  name                      = each.key
  network_security_group_id = lookup(each.value, "network_security_group_id")
  storage_account_id        = lookup(each.value, "storage_account_id")
  enabled                   = lookup(each.value, "network_watcher_flow_logs_enabled")
  tags                      = lookup(each.value, "tags")
  //----------------------------optional arguments--------------------------------------
  location = var.location
  version  = lookup(each.value, "version")

  retention_policy {
    enabled = lookup(each.value, "retention_policy_enabled")
    days    = lookup(each.value, "retention_policy_days")
  }

  dynamic "traffic_analytics" {
    for_each = lookup(each.value, "traffic_analytics_enabled") ? [1] : []

    content {
      enabled               = lookup(each.value, "traffic_analytics_enabled")
      workspace_id          = lookup(each.value, "log_analytics_workspace_id")
      workspace_region      = lookup(each.value, "log_analytics_workspace_region")
      workspace_resource_id = lookup(each.value, "log_analytics_workspace_resource_id")
      interval_in_minutes   = lookup(each.value, "interval_in_minutes")


    }
  }
}

locals {
  nw_flow_log_name_and_nw_flow_log_id = {
    for index, s in azurerm_network_watcher_flow_log.nw_flow_log :
    s.name => s.id
  }
  nw_flow_log_name = [
    for n in azurerm_network_watcher_flow_log.nw_flow_log : n.name
  ]
  network_watcher_flow_log_id = [
    for n in azurerm_network_watcher_flow_log.nw_flow_log : n.id
  ]
}
