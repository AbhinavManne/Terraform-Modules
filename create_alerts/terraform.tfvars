resource_id = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/cil-testing-as/providers/Microsoft.KeyVault/vaults/kv-resources-as-001"
# storage_account_id               = null
resource_group_name = "cil-testing-as"
resource_group_id   = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/cil-testing-as"
# resource_group_location          = null
action_group_name                = "CriticalAlertsAction"
short_name                       = "actiongsa"
action_group_enabled             = true
arm_role_receiver_name           = null
arm_role_receiver_role_id        = null
armrr_use_common_alert_schema    = null
automation_runbook_receiver_name = null
automation_account_id            = null
runbook_name                     = null
webhook_resource_id              = null
is_global_runbook                = null
service_uri                      = null
arr_use_common_alert_schema      = null
azure_app_push_receiver = [{
  email_address = "admin@contoso.com"
  name          = "pushtoadmin"
}]
azure_function_receiver_name = null
function_app_resource_id     = null
function_name                = null
http_trigger_url             = null
afr_use_common_alert_schema  = null
email_receiver = [{
  email_address           = "devops@contoso.com"
  name                    = "sendtodevops"
  use_common_alert_schema = true
}]
event_hub_receiver_name     = null
event_hub_name              = null
event_hub_namespace         = null
subscription_id             = null
tenant_id                   = null
ehr_use_common_alert_schema = null
itsm_receiver_name          = null
workspace_id                = null
itsm_receiver_connection_id = null
ticket_configuration        = null
log_workspace_region        = null
logic_app_receiver_name     = null
logic_app_resource_id       = null
callback_url                = null
lar_use_common_alert_schema = null
sms_receiver = [{
  country_code = "1"
  name         = "oncallmsg"
  phone_number = "1231231234"
}]
voice_receiver = [{
  country_code = "1"
  name         = "remotesupport"
  phone_number = "13888888888"
}]
webhook_receiver = [{
  name                    = "callmyapiaswell"
  service_uri             = "http://example.com/alert"
  use_common_alert_schema = true
}]
aad_auth = null
tags = {
  Application_name = "Alerts"
  Cost_Center      = 999
  Contact_name     = "xyz"
}

action_group_rule_name  = "example-z"
action_rule_description = "actionrd"
action_rule_enabled     = true //false
scope_type              = "Resource"
action_rule_condition   = null


activity_log_alert_name          = "example-activitylogalertz"
log_alert_description            = "This alert will monitor a specific resource updates."
log_alert_enabled                = true
category_log_alert               = "Security"
operation_name_log_alert         = "Microsoft.Network/networkSecurityGroups/write"
log_alert_resource_provider      = null
resource_type                    = null
criteria_caller                  = null
criteria_level                   = "Verbose"
criteria_status                  = "Succeeded"
criteria_sub_status              = null
criteria_recommendation_type     = null
criteria_recommendation_category = "Performance"
criteria_recommendation_impact   = "Low"
resource_health = {
  current  = "Available"
  previous = "Available"
  reason   = "UserInitiated"
}
service_health = {
  events    = "Security"
  locations = "Global"
  services  = "Activity Logs & Alerts"
}
log_alert_action = true
action_webhook_properties = {
  from = "terraform"
}


metric_alert_name                     = "Overall Vault Availability"
metric_alert_scopes                   = ["/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/cil-testing-as/providers/Microsoft.KeyVault/vaults/kv-resources-as-001"] //stracct
metric_alert_description              = "Whenever the average Overall Vault Availability is greater than 50%"
metric_alert_enabled                  = true
metric_alert_auto_mitigate            = true
metric_alert_frequency                = "PT1M"
metric_alert_severity                 = "3"
metric_alert_target_resource_type     = null
metric_alert_target_resource_location = null
metric_alert_window_size              = "PT5M"
dynamic_criteria                      = null
criteria_metric_namespace             = "Microsoft.KeyVault/vaults"//"Microsoft.Storage/storageAccounts"
criteria_metric__name                 = "Overall Vault Availability"//"Transactions"
criteria_aggregation                  = "Total"
criteria_operator                     = "GreaterThan"
criteria_threshold                    = "50"
criteria_dimension = [{
  name     = "ApiName"
  operator = "Include"
  values   = ["*"]
}]
criteria_skip_metric_validation   = false
application_insights_web_test_lac = null
metric_alert_action               = true
metric_action_webhook_properties = {
  from = "terraform"
}




