create_resource_group = false
resource_group_name   = "rg1"
location              = "east us"
disable_bgp_route_propagation = false
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Dev"
}
storage_account_id     = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Storage/storageAccounts/avguw"
action_group_name      = "example-action-groupz"
short_name             = "actiongz"
action_group_rule_name = "example-z"
scope_type             = "Resource"
activity_log_alert_name  = "example-activitylogalertz"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert     = "Security"
metric_alert_name      = "example-metricalertz"
metric_namespace       = "Microsoft.Storage/storageAccounts"
metric_name            = "Transactions"
aggregation            = "Total"
operator               = "GreaterThan"
threshold              = 50
dimension_name         = "ApiName"
dimension_operator     = "Include"
values                 = ["*"]

