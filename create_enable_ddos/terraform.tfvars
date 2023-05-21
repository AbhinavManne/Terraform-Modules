create_resource_group = false
location              = "East US"
resource_group_name   = "rg-01"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Dev"
}
ddos = {
  "ddos1" = {
    location            = "east us"
    tags = {
      Contact_name     = "ABC"
      Cost_Center      = "999"
      Application_name = "DEV"
    }
  },
  "ddos2" = {
    location            = "west us"
    tags = {
      Contact_name     = "ABC"
      Cost_Center      = "999"
      Application_name = "DEV"
    }
  }
}

storage_account_id       = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg-01/providers/Microsoft.Storage/storageAccounts/dcdc"
action_group_name        = "example-action-groupq"
short_name               = "act"
action_group_rule_name   = "example-q"
scope_type               = "Resource"
activity_log_alert_name  = "example-activitylogalertq"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "example-metricalertq"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]