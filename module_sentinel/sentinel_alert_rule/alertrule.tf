resource "azurerm_sentinel_alert_rule_fusion" "alert_rule_fusion" {
  name                       = var.alert_rule_fusion_config.name
  log_analytics_workspace_id = var.alert_rule_fusion_config.log_analytics_workspace_id
  alert_rule_template_guid   = var.alert_rule_fusion_config.alert_rule_template_guid
  enabled                    = var.alert_rule_fusion_config.enabled
}

resource "azurerm_sentinel_alert_rule_machine_learning_behavior_analytics" "alert_rule_machine_learning_behavior_analytics" {
  name                       = var.alert_rule_machine_learning_behavior_analytics_config.name
  log_analytics_workspace_id = var.alert_rule_machine_learning_behavior_analytics_config.log_analytics_workspace_id
  alert_rule_template_guid   = var.alert_rule_machine_learning_behavior_analytics_config.alert_rule_template_guid
  enabled                    = var.alert_rule_machine_learning_behavior_analytics_config.enabled
}

resource "azurerm_sentinel_alert_rule_ms_security_incident" "alert_rule_ms_security_incident" {
  name                        = var.alert_rule_ms_security_incident_config.name
  log_analytics_workspace_id = var.alert_rule_ms_security_incident_config.log_analytics_workspace_id
  display_name                = var.alert_rule_ms_security_incident_config.display_name
  product_filter              = var.alert_rule_ms_security_incident_config.product_filter
  severity_filter             = var.alert_rule_ms_security_incident_config.severity_filter
  alert_rule_template_guid    = var.alert_rule_ms_security_incident_config.alert_rule_template_guid
  description                 = var.alert_rule_ms_security_incident_config.description
  enabled                     = var.alert_rule_ms_security_incident_config.enabled
  display_name_filter         = var.alert_rule_ms_security_incident_config.display_name_filter
  display_name_exclude_filter = var.alert_rule_ms_security_incident_config.display_name_exclude_filter
}

resource "azurerm_sentinel_alert_rule_nrt" "alert_rule_nrt" {
  name                       = var.alert_rule_nrt_config.name
  log_analytics_workspace_id = var.alert_rule_nrt_config.log_analytics_workspace_id
  display_name               = var.alert_rule_nrt_config.display_name
  severity                   = var.alert_rule_nrt_config.severity
  query                      = var.alert_rule_nrt_config.query
  dynamic "alert_details_override" {
    for_each = var.alert_rule_nrt_config.alert_details_override != null ? [1] : []
    content {
      description_format   = var.alert_rule_nrt_config.alert_details_override.description_format
      display_name_format  = var.alert_rule_nrt_config.alert_details_override.display_name_format
      severity_column_name = var.alert_rule_nrt_config.alert_details_override.severity_column_name
      tactics_column_name  = var.alert_rule_nrt_config.alert_details_override.tactics_column_name
    }
  }
  alert_rule_template_guid    = var.alert_rule_nrt_config.alert_rule_template_guid
  alert_rule_template_version = var.alert_rule_nrt_config.alert_rule_template_version
  custom_details              = var.alert_rule_nrt_config.custom_details
  description                 = var.alert_rule_nrt_config.description
  enabled                     = var.alert_rule_nrt_config.enabled
  dynamic "entity_mapping" {
    for_each = var.alert_rule_nrt_config.entity_mapping != null ? [1] : []
    content {
      entity_type = var.alert_rule_nrt_config.entity_mapping.entity_type
      dynamic "field_mapping" {
        for_each = var.alert_rule_nrt_config.entity_mapping.field_mapping != null ? [1] : []
        content {
          identifier  = var.alert_rule_nrt_config.entity_mapping.field_mapping.identifier
          column_name = var.alert_rule_nrt_config.entity_mapping.field_mapping.column_name
        }
      }
    }
  }
  dynamic "incident" {
    for_each = var.alert_rule_nrt_config.incident != null ? [1] : []
    content {
      create_incident_enabled = var.alert_rule_nrt_config.incident.create_incident_enabled
      dynamic "grouping" {
        for_each = var.alert_rule_nrt_config.incident.grouping != null ? [1] : []
        content {
          enabled                 = var.alert_rule_nrt_config.incident.grouping.enabled
          lookback_duration       = var.alert_rule_nrt_config.incident.grouping.lookback_duration
          reopen_closed_incidents = var.alert_rule_nrt_config.incident.grouping.reopen_closed_incidents
          entity_matching_method  = var.alert_rule_nrt_config.incident.grouping.entity_matching_method
          by_entities             = var.alert_rule_nrt_config.incident.grouping.by_entities
          by_alert_details        = var.alert_rule_nrt_config.incident.grouping.by_alert_details
          by_custom_details       = var.alert_rule_nrt_config.incident.grouping.by_custom_details
        }
      }
    }
  }
  suppression_duration = var.alert_rule_nrt_config.suppression_duration
  suppression_enabled  = var.alert_rule_nrt_config.suppression_enabled
  tactics              = var.alert_rule_nrt_config.tactics
}

resource "azurerm_sentinel_alert_rule_scheduled" "alert_rule_scheduled" {
  name                       = var.alert_rule_scheduled_config.name
  log_analytics_workspace_id = var.alert_rule_scheduled_config.log_analytics_workspace_id
  display_name               = var.alert_rule_scheduled_config.display_name
  severity                   = var.alert_rule_scheduled_config.severity
  query                      = var.alert_rule_scheduled_config.query
  dynamic "alert_details_override" {
    for_each = var.alert_rule_scheduled_config.alert_details_override != null ? [1] : []
    content {
      description_format   = var.alert_rule_scheduled_config.alert_details_override.description_format
      display_name_format  = var.alert_rule_scheduled_config.alert_details_override.display_name_format
      severity_column_name = var.alert_rule_scheduled_config.alert_details_override.severity_column_name
      tactics_column_name  = var.alert_rule_scheduled_config.alert_details_override.tactics_column_name
    }
  }
  alert_rule_template_guid    = var.alert_rule_scheduled_config.alert_rule_template_guid
  alert_rule_template_version = var.alert_rule_scheduled_config.alert_rule_template_version
  custom_details              = var.alert_rule_scheduled_config.custom_details
  description                 = var.alert_rule_scheduled_config.description
  enabled                     = var.alert_rule_scheduled_config.enabled
  dynamic "entity_mapping" {
    for_each = var.alert_rule_scheduled_config.entity_mapping != null ? [1] : []
    content {
      entity_type = var.alert_rule_scheduled_config.entity_mapping.entity_type
      dynamic "field_mapping" {
        for_each = var.alert_rule_scheduled_config.entity_mapping.field_mapping != null ? [1] : []
        content {
          identifier  = var.alert_rule_scheduled_config.entity_mapping.field_mapping.identifier
          column_name = var.alert_rule_scheduled_config.entity_mapping.field_mapping.column_name
        }
      }
    }
  }
  dynamic "event_grouping" {
    for_each = var.alert_rule_scheduled_config.event_grouping != null ? [1] : []
    content {
      aggregation_method = var.alert_rule_scheduled_config.event_grouping.aggregation_method
    }
  }
  dynamic "incident_configuration" {
    for_each = var.alert_rule_scheduled_config.incident_configuration != null ? [1] : []
    content {
      create_incident = var.alert_rule_scheduled_config.incident_configuration.create_incident
      dynamic "grouping" {
        for_each = var.alert_rule_scheduled_config.incident_configuration.grouping != null ? [1] : []
        content {
          enabled                 = var.alert_rule_scheduled_config.incident_configuration.grouping.enabled
          lookback_duration       = var.alert_rule_scheduled_config.incident_configuration.grouping.lookback_duration
          reopen_closed_incidents = var.alert_rule_scheduled_config.incident_configuration.grouping.reopen_closed_incidents
          entity_matching_method  = var.alert_rule_scheduled_config.incident_configuration.grouping.entity_matching_method
          group_by_entities       = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_entities
          group_by_alert_details  = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_alert_details
          group_by_custom_details = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_custom_details
        }
      }
    }
  }
  query_frequency      = var.alert_rule_scheduled_config.query_frequency
  query_period         = var.alert_rule_scheduled_config.query_period
  suppression_duration = var.alert_rule_scheduled_config.suppression_duration
  suppression_enabled  = var.alert_rule_scheduled_config.suppression_enabled
  tactics              = var.alert_rule_scheduled_config.tactics
  techniques           = var.alert_rule_scheduled_config.techniques
  trigger_threshold    = var.alert_rule_scheduled_config.trigger_threshold
  trigger_operator     = var.alert_rule_scheduled_config.trigger_operator
}
