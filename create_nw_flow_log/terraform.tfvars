resource_group_name = "resourcegroup"
location            = "East US"


nw_flow_log = {
  "key" = {
    interval_in_minutes                 = 10
    log_analytics_workspace             = "claw"
    log_analytics_workspace_id          = "63681214-807e-49aa-a971-32ba0f513c75"
    log_analytics_workspace_region      = "East US"
    log_analytics_workspace_resource_id = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourcegroups/resourcegroup/providers/microsoft.operationalinsights/workspaces/claw"
    network_security_group_id           = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/resourcegroup/providers/Microsoft.Network/networkSecurityGroups/nsg"
    network_watcher_flow_logs_enabled   = false
    network_watcher_name                = "nw"
    retention_policy_days               = 7
    retention_policy_enabled            = true
    storage_account_id                  = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/resourcegroup/providers/Microsoft.Storage/storageAccounts/san67"
    tags = {
      Contact_name     = "ABC"
      Cost_Center      = "111"
      Application_name = "Dev"
    }
    traffic_analytics_enabled = false
    version                   = 1
  }
}
