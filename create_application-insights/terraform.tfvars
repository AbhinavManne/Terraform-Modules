resource_group_name                   = "rg"
application_insights_name             = "appinsights0123"
application_insights_type             = "web" #valid values are ios,java,MobileCenter,Node.JS,other,phone,store,web
sku                                   = "PerGB2018"
log_analytics_workspace               = "workspace-test"
retention_in_days                     = 30
daily_data_cap_in_gb                  = 20
daily_data_cap_notifications_disabled = false
sampling_percentage                   = 100
disable_ip_masking                    = false
tags = {
  APP_NAME     = "INSIGHTS"
  Cost_center  = "999"
  Contact_Name = "xyz"
}
authenticate_sdk_control_channel = "tf-test-appinsights-authenticate-sdk-control-channel-api-key"
smart_detection_rule             = "Slow server response time"
enabled                          = false
read_telemetry                   = "tf-test-appinsights-read-telemetry-api-key"
read_permissions1                = ["aggregate", "api", "draft", "extendqueries", "search"]
read_permissions2                = ["agentconfig"]
write_annotations                = "tf-test-appinsights-write-annotations-api-key"
write_permissions                = ["annotations"]
full_permissions                 = "tf-test-appinsights-full-permissions-api-key"
read_permissions                 = ["agentconfig", "aggregate", "api", "draft", "extendqueries", "search"]
role_definition_name             = ["Reader"]
private_link_scope               = "privatelink12"
private_link_scoped_service      = "privatescoped45"