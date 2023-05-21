module "log_analytics_module" {
  source                        = "../../../modules/module_log-analytics-workspace-creation/log_analytics"
  log_analytics_workspace       = var.log_analytics_workspace  
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  log_sku                       = var.log_sku
  retention_in_days             = var.retention_in_days
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  internet_query_enabled        = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  daily_quota_gb                = var.daily_quota_gb
  tags                          = var.tags
  create_log_analytics_solution = var.create_log_analytics_solution
  solution_name                 = var.solution_name
  plan_publisher                = var.plan_publisher
  plan_product                  = var.plan_product
  promotion_code                = var.promotion_code
}

module "sentinel_alert_rule_module" {
  source = "../../../modules/module_sentinel/sentinel_alert_rule"

  log_analytics_workspace       = var.log_analytics_workspace  
  resource_group_name           = var.resource_group_name
  resource_group_location = var.resource_group_location
  log_sku                       = var.log_sku
  retention_in_days             = var.retention_in_days
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  internet_query_enabled        = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  daily_quota_gb                = var.daily_quota_gb
  tags                          = var.tags
  create_log_analytics_solution = var.create_log_analytics_solution
  solution_name                 = var.solution_name
  plan_publisher                = var.plan_publisher
  plan_product                  = var.plan_product
  promotion_code                = var.promotion_code

  alert_rule_fusion_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_rule_template_guid = var.alert_rule_fusion_config.alert_rule_template_guid
    enabled                  = var.alert_rule_fusion_config.enabled
    name                     = var.alert_rule_fusion_config.name
  }

  alert_rule_machine_learning_behavior_analytics_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_rule_template_guid = var.alert_rule_machine_learning_behavior_analytics_config.alert_rule_template_guid
    enabled                  = var.alert_rule_machine_learning_behavior_analytics_config.enabled
    name                     = var.alert_rule_machine_learning_behavior_analytics_config.name
  }

  alert_rule_ms_security_incident_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_rule_template_guid    = var.alert_rule_ms_security_incident_config.alert_rule_template_guid
    description                 = var.alert_rule_ms_security_incident_config.description
    display_name                = var.alert_rule_ms_security_incident_config.display_name
    display_name_exclude_filter = var.alert_rule_ms_security_incident_config.display_name_exclude_filter
    display_name_filter         = var.alert_rule_ms_security_incident_config.display_name_filter
    enabled                     = var.alert_rule_ms_security_incident_config.enabled
    name                        = var.alert_rule_ms_security_incident_config.name
    product_filter              = var.alert_rule_ms_security_incident_config.product_filter
    severity_filter             = var.alert_rule_ms_security_incident_config.severity_filter
  }

  alert_rule_nrt_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_details_override = {
      description_format   = var.alert_rule_nrt_config.alert_details_override.description_format
      display_name_format  = var.alert_rule_nrt_config.alert_details_override.display_name_format
      severity_column_name = var.alert_rule_nrt_config.alert_details_override.severity_column_name
      tactics_column_name  = var.alert_rule_nrt_config.alert_details_override.tactics_column_name
    }
    alert_rule_template_guid    = var.alert_rule_nrt_config.alert_rule_template_guid
    alert_rule_template_version = var.alert_rule_nrt_config.alert_rule_template_version
    custom_details              = var.alert_rule_nrt_config.custom_details
    description                 = var.alert_rule_nrt_config.description
    display_name                = var.alert_rule_nrt_config.display_name
    enabled                     = var.alert_rule_nrt_config.enabled
    entity_mapping = {
      entity_type = var.alert_rule_nrt_config.entity_mapping.entity_type
      field_mapping = {
        identifier  = var.alert_rule_nrt_config.entity_mapping.field_mapping.identifier
        column_name = var.alert_rule_nrt_config.entity_mapping.field_mapping.column_name
      }
    }
    incident = {
      create_incident_enabled = var.alert_rule_nrt_config.incident.create_incident_enabled
      grouping = {
        enabled                 = var.alert_rule_nrt_config.incident.grouping.enabled
        lookback_duration       = var.alert_rule_nrt_config.incident.grouping.lookback_duration
        reopen_closed_incidents = var.alert_rule_nrt_config.incident.grouping.reopen_closed_incidents
        entity_matching_method  = var.alert_rule_nrt_config.incident.grouping.entity_matching_method
        by_entities             = var.alert_rule_nrt_config.incident.grouping.by_entities
        by_alert_details        = var.alert_rule_nrt_config.incident.grouping.by_alert_details
        by_custom_details       = var.alert_rule_nrt_config.incident.grouping.by_custom_details
      }
    }
    name                 = var.alert_rule_nrt_config.name
    display_name         = var.alert_rule_nrt_config.display_name
    severity             = var.alert_rule_nrt_config.severity
    query                = var.alert_rule_nrt_config.query
    suppression_duration = var.alert_rule_nrt_config.suppression_duration
    suppression_enabled  = var.alert_rule_nrt_config.suppression_enabled
    tactics              = var.alert_rule_nrt_config.tactics
  }

  alert_rule_scheduled_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_details_override = {
      description_format   = var.alert_rule_scheduled_config.alert_details_override.description_format
      display_name_format  = var.alert_rule_scheduled_config.alert_details_override.display_name_format
      severity_column_name = var.alert_rule_scheduled_config.alert_details_override.severity_column_name
      tactics_column_name  = var.alert_rule_scheduled_config.alert_details_override.tactics_column_name
    }
    alert_rule_template_guid    = var.alert_rule_scheduled_config.alert_rule_template_guid
    alert_rule_template_version = var.alert_rule_scheduled_config.alert_rule_template_version
    custom_details              = var.alert_rule_scheduled_config.custom_details
    description                 = var.alert_rule_scheduled_config.description
    display_name                = var.alert_rule_scheduled_config.display_name
    enabled                     = var.alert_rule_scheduled_config.enabled
    entity_mapping = {
      entity_type = var.alert_rule_scheduled_config.entity_mapping.entity_type
      field_mapping = {
        identifier  = var.alert_rule_scheduled_config.entity_mapping.field_mapping.identifier
        column_name = var.alert_rule_scheduled_config.entity_mapping.field_mapping.column_name
      }
    }
    event_grouping = {
      aggregation_method = var.alert_rule_scheduled_config.event_grouping.aggregation_method
    }
    incident_configuration = {
      create_incident = var.alert_rule_scheduled_config.incident_configuration.create_incident
      grouping = {
        enabled                 = var.alert_rule_scheduled_config.incident_configuration.grouping.enabled
        lookback_duration       = var.alert_rule_scheduled_config.incident_configuration.grouping.lookback_duration
        reopen_closed_incidents = var.alert_rule_scheduled_config.incident_configuration.grouping.reopen_closed_incidents
        entity_matching_method  = var.alert_rule_scheduled_config.incident_configuration.grouping.entity_matching_method
        group_by_entities       = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_entities
        group_by_alert_details  = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_alert_details
        group_by_custom_details = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_custom_details
      }
    }
    name                 = var.alert_rule_scheduled_config.name
    display_name         = var.alert_rule_scheduled_config.display_name
    severity             = var.alert_rule_scheduled_config.severity
    query                = var.alert_rule_scheduled_config.query
    query_frequency      = var.alert_rule_scheduled_config.query_frequency
    query_period         = var.alert_rule_scheduled_config.query_period
    suppression_duration = var.alert_rule_scheduled_config.suppression_duration
    suppression_enabled  = var.alert_rule_scheduled_config.suppression_enabled
    tactics              = var.alert_rule_scheduled_config.tactics
    techniques           = var.alert_rule_scheduled_config.techniques
    trigger_operator     = var.alert_rule_scheduled_config.trigger_operator
    trigger_threshold    = var.alert_rule_scheduled_config.trigger_threshold
  }
}