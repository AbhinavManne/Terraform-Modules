resource_group_name            = "rg_win"
virtual_machine_scale_set_name = "vmss-win"
monitor_autoscale_setting_name = "myAutoscaleSetting"
profile_name                   = "defaultprofile"
capacity_default               = "1"
capacity_maximum               = "10"
capacity_minimum               = "1"
rules = {
  "rule-1" = {
    cooldown = "PT1M"
    dimensions = {
      "d-1" = {
        name = "AppName"
        operator = "Equals"
        values = [ "App1" ]
      }
    }
    direction = "Increase"
    divide_by_instance_count = false
    metric_name = "Percentage CPU"
    metric_namespace = "microsoft.compute/virtualmachinescalesets"
    metric_resource_id = "/subscriptions/d9eb170f-fa4b-49e2-916a-446a6c074b1a/resourceGroups/rg_win/providers/Microsoft.Compute/virtualMachineScaleSets/vmss-win"
    operator = "GreaterThan"
    statistic = "Average"
    threshold = 75
    time_aggregation = "Average"
    time_grain = "PT1M"
    time_window = "PT1M"
    type = "ChangeCount"
    value = "1"
  }
}
fixed_date = {
  end = "2022-12-31T23:59:59Z"
  start = "2022-12-01T00:00:00Z"
  timezone = "Pacific Standard Time"
}
recurrence = null
#{
#   days     = ["Saturday", "Sunday"]
#   hours    = [12]
#   minutes  = [0]
#   timezone = "Pacific Standard Time"
# }
enabled      = false
notification = {
  custom_emails = [ "admin@contoso.com" ]
  send_to_subscription_administrator = true
  send_to_subscription_co_administrator = true
  webhook = null
}
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Autoscale Policy"
}
