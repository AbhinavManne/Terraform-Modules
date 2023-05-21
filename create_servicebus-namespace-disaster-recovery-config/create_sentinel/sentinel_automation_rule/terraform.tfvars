#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
resource_group_name = "sentinelrg"
resource_group_location = "East US"
log_analytics_workspace = "automationrule-sentinel-law"
log_sku                 = "PerGB2018"
retention_in_days       = 30
internet_ingestion_enabled = true
internet_query_enabled     = true
reservation_capacity_in_gb_per_day = 100
daily_quota_gb = -1
tags = null

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS SOLUTION-----#
create_log_analytics_solution = true
solution_name                 = "SecurityInsights"
plan_publisher                = "Microsoft"
plan_product                  = "OMSGallery/SecurityInsights"
promotion_code                = null

#----DEFAULT VALUES: RESOURCE: SENTINEL AUTOMATION RULE---#
automation_rule_config = {
  action_incident = {
    classification         = "Undetermined"
    classification_comment = "Random Testing"
    labels                 = ["Name"]
    order                  = 1
    owner_id               = null
    severity               = "Low"
    status                 = "Closed"
  }
  action_playbook = {
    logic_app_id = null
    order        = null
    tenant_id    = null
  }
  condition = {
    operator = "Contains"
    property = "IncidentTitle"
    values   = ["TestIncidentTitle", "Test", "IncidentTitle"]
  }
  display_name = "automation-rule-001"
  log_analytics_workspace_id = null
  name         = "56094f72-ac3f-40e7-a0c0-47bd95f70336"
  order        = 1
  enabled      = true
  expiration   = "2022-11-30T00:00:00.00Z"
}