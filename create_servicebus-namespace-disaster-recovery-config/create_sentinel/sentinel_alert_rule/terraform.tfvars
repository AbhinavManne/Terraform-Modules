#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
resource_group_name = "sentinelrg"
resource_group_location = "East US"
log_analytics_workspace = "alertrule-sentinel-law"
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

#------DEFAULT VALUES: RESOURCE: SENTINEL ALERT RULES-----#
alert_rule_fusion_config = {
  alert_rule_template_guid = "f71aba3d-28fb-450b-b192-4e76a83015c8"
  enabled                  = true
  log_analytics_workspace_id = null
  name                     = "fusion-alert-rule-001"
}

alert_rule_machine_learning_behavior_analytics_config = {
  alert_rule_template_guid = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
  enabled                  = true
  log_analytics_workspace_id = null
  name                     = "machine-learning-behavior-analytics-alert-rule-001"
}

alert_rule_ms_security_incident_config = {
  alert_rule_template_guid    = null
  description                 = "MS Security Incident Alert"
  display_name                = "AAD IdentityProtection rule"
  display_name_exclude_filter = null
  display_name_filter         = null
  enabled                     = true
  log_analytics_workspace_id = null
  name                        = "ms_security-incident-alert-rule-001"
  product_filter              = "Microsoft Defender Advanced Threat Protection"
  severity_filter             = ["Informational"]
}

alert_rule_nrt_config = {
  alert_details_override = {
    description_format   = null
    display_name_format  = null
    severity_column_name = null
    tactics_column_name  = null
  }

  alert_rule_template_guid    = null
  alert_rule_template_version = null
  custom_details = {
    "alert_value" = "dcount_ResourceId"
  }
  description  = "NRT Alert Rule"
  display_name = "Sentinel NRT Alert Rule"
  enabled      = true
  entity_mapping = {
    entity_type = "AzureResource"
    field_mapping = {
      column_name = "EventSubmissionTimestamp"
      identifier  = "ResourceId"
    }
  }
  incident = {
    create_incident_enabled = true
    grouping = {
      by_alert_details        = null
      by_custom_details       = null
      by_entities             = null
      enabled                 = true
      entity_matching_method  = "AnyAlert"
      lookback_duration       = "PT5M"
      reopen_closed_incidents = false
    }
  }
  log_analytics_workspace_id = null
  name                 = "nrt-alert-rule-001"
  query                = <<QUERY
AzureActivity |
where OperationName == "Create or Update Virtual Machine" or OperationName =="Create Deployment" |
where ActivityStatus == "Succeeded" |
make-series dcount(ResourceId) default=0 on EventSubmissionTimestamp in range(ago(7d), now(), 1d) by Caller
QUERY
  severity             = "High"
  suppression_duration = "PT5H"
  suppression_enabled  = false
  tactics              = null
}

alert_rule_scheduled_config = {
  alert_details_override = {
    description_format   = null
    display_name_format  = null
    severity_column_name = null
    tactics_column_name  = null
  }
  alert_rule_template_guid    = null
  alert_rule_template_version = null
  custom_details = {
    "alert_value" = "dcount_ResourceId"
  }
  description  = "NRT Alert Rule"
  display_name = "Sentinel NRT Alert Rule"
  enabled      = true
  entity_mapping = {
    entity_type = "AzureResource"
    field_mapping = {
      column_name = "EventSubmissionTimestamp"
      identifier  = "ResourceId"
    }
  }
  event_grouping = {
    aggregation_method = "AlertPerResult" //can be SingleAlert or AlertPerResult
  }
  incident_configuration = {
    create_incident = true
    grouping = {
      group_by_alert_details  = null
      group_by_custom_details = null
      group_by_entities       = null
      enabled                 = true
      entity_matching_method  = "AnyAlert"
      lookback_duration       = "PT5M"
      reopen_closed_incidents = false
    }
  }
  log_analytics_workspace_id = null
  name                 = "scheduled-alert-rule-001"
  query                = <<QUERY
AzureActivity |
  where OperationName == "Create or Update Virtual Machine" or OperationName =="Create Deployment" |
  where ActivityStatus == "Succeeded" |
  make-series dcount(ResourceId) default=0 on EventSubmissionTimestamp in range(ago(7d), now(), 1d) by Caller
QUERY
  query_frequency      = "PT5H"
  query_period         = "PT6H"
  severity             = "High"
  suppression_duration = "PT5H"
  suppression_enabled  = false
  tactics              = null
  techniques           = null
  trigger_threshold    = null
  trigger_operator     = null
}