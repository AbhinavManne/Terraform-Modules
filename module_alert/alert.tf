
#----RESOURCE: ACTION GROUP----#
resource "azurerm_monitor_action_group" "mactiong" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.short_name
  enabled             = var.action_group_enabled

  dynamic "arm_role_receiver" {
    for_each = var.arm_role_receiver_name != null ? [1] : []
    content {
      name                    = var.arm_role_receiver_name
      role_id                 = var.arm_role_receiver_role_id
      use_common_alert_schema = var.armrr_use_common_alert_schema
    }
  }

  dynamic "automation_runbook_receiver" {
    for_each = var.automation_runbook_receiver_name != null ? [1] : []
    content {
      name                    = var.automation_runbook_receiver_name
      automation_account_id   = var.automation_account_id
      runbook_name            = var.runbook_name
      webhook_resource_id     = var.webhook_resource_id
      is_global_runbook       = var.is_global_runbook
      service_uri             = var.service_uri
      use_common_alert_schema = var.arr_use_common_alert_schema
    }
  }

  dynamic "azure_app_push_receiver" {
    for_each = var.azure_app_push_receiver != null ? var.azure_app_push_receiver : []
    content {
      name          = azure_app_push_receiver.value.name
      email_address = azure_app_push_receiver.value.email_address
    }
  }

  dynamic "azure_function_receiver" {
    for_each = var.azure_function_receiver_name != null ? [1] : []
    content {
      name                     = var.azure_function_receiver_name
      function_app_resource_id = var.function_app_resource_id
      function_name            = var.function_name
      http_trigger_url         = var.http_trigger_url
      use_common_alert_schema  = var.afr_use_common_alert_schema
    }
  }

  dynamic "email_receiver" {
    for_each = var.email_receiver != null ? var.email_receiver : []
    content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.email_address
      use_common_alert_schema = email_receiver.value.use_common_alert_schema
    }
  }

  dynamic "event_hub_receiver" {
    for_each = var.event_hub_receiver_name != null ? [1] : []
    content {
      name                    = var.event_hub_receiver_name
      event_hub_name          = var.event_hub_name
      event_hub_namespace     = var.event_hub_namespace
      subscription_id         = var.subscription_id
      tenant_id               = var.tenant_id
      use_common_alert_schema = var.ehr_use_common_alert_schema
    }
  }

  dynamic "itsm_receiver" {
    for_each = var.itsm_receiver_name != null ? [1] : []
    content {
      name                 = var.itsm_receiver_name
      workspace_id         = var.workspace_id
      connection_id        = var.itsm_receiver_connection_id
      ticket_configuration = var.ticket_configuration
      region               = var.log_workspace_region
    }
  }

  dynamic "logic_app_receiver" {
    for_each = var.logic_app_receiver_name != null ? [1] : []
    content {
      name                    = var.logic_app_receiver_name
      resource_id             = var.logic_app_resource_id
      callback_url            = var.callback_url
      use_common_alert_schema = var.lar_use_common_alert_schema
    }
  }

  dynamic "sms_receiver" {
    for_each = var.sms_receiver != null ? var.sms_receiver : []
    content {
      name         = sms_receiver.value.name
      country_code = sms_receiver.value.country_code
      phone_number = sms_receiver.value.phone_number
    }
  }

  dynamic "voice_receiver" {
    for_each = var.voice_receiver != null ? var.voice_receiver : []
    content {
      name         = voice_receiver.value.name
      country_code = voice_receiver.value.country_code
      phone_number = voice_receiver.value.phone_number
    }
  }

  dynamic "webhook_receiver" {
    for_each = var.webhook_receiver != null ? var.webhook_receiver : []
    content {
      name                    = webhook_receiver.value.name
      service_uri             = webhook_receiver.value.service_uri
      use_common_alert_schema = webhook_receiver.value.use_common_alert_schema
      dynamic "aad_auth" {
        for_each = var.aad_auth != null && var.webhook_receiver != null ? var.aad_auth : {}
        content {
          object_id      = aad_auth.value.object_id
          identifier_uri = aad_auth.value.identifier_uri
          tenant_id      = aad_auth.value.tenant_id
        }
      }
    }
  }
  tags = var.tags
}

#----RESOURCE: ACTION RULE----#
resource "azurerm_monitor_action_rule_action_group" "mactionrg" {
  name                = var.action_group_rule_name
  resource_group_name = var.resource_group_name
  action_group_id     = azurerm_monitor_action_group.mactiong.id
  description         = var.action_rule_description
  enabled             = var.action_rule_enabled

  dynamic "scope" {
    for_each = var.scope_type != null ? [1] : []
    content {
      type         = var.scope_type
      resource_ids = [var.resource_id]
    }
  }

  dynamic "condition" {
    for_each = var.action_rule_condition != null ? var.action_rule_condition : {}
    content {
      dynamic "alert_context" {
        for_each = condition.value.alert_context != null ? condition.value.alert_context : {}
        content {
          operator = alert_context.value.operator
          values   = alert_context.value.values
        }
      }
      dynamic "alert_rule_id" {
        for_each = condition.value.alert_rule_id != null ? condition.value.alert_rule_id : {}
        content {
          operator = alert_rule_id.value.operator
          values   = alert_rule_id.value.values
        }
      }
      dynamic "description" {
        for_each = condition.value.description != null ? condition.value.description : {}
        content {
          operator = description.value.operator
          values   = description.value.values
        }
      }
      dynamic "monitor" {
        for_each = condition.value.monitor != null ? condition.value.monitor : {}
        content {
          operator = monitor.value.operator
          values   = monitor.value.values
        }
      }
      dynamic "monitor_service" {
        for_each = condition.value.monitor_service != null ? condition.value.monitor_service : {}
        content {
          operator = monitor_service.value.operator
          values   = monitor_service.value.values
        }
      }
      dynamic "severity" {
        for_each = condition.value.severity != null ? condition.value.severity : {}
        content {
          operator = severity.value.operator
          values   = severity.value.values
        }
      }
      dynamic "target_resource_type" {
        for_each = condition.value.target_resource_type != null ? condition.value.target_resource_type : {}
        content {
          operator = target_resource_type.value.operator
          values   = target_resource_type.value.values
        }
      }
    }
  }
  tags = var.tags
}

#----RESOURCE: ACTIVITY LOG ALERT----#
resource "azurerm_monitor_activity_log_alert" "log_alert" {
  name                = var.activity_log_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.resource_group_id]
  description         = var.log_alert_description != null ? var.log_alert_description : null
  enabled             = var.log_alert_enabled != null ? var.log_alert_enabled : null

  criteria {
    category                = var.category_log_alert
    operation_name          = var.operation_name_log_alert != null ? var.operation_name_log_alert : null
    resource_provider       = var.log_alert_resource_provider != null ? var.log_alert_resource_provider : null
    resource_type           = var.resource_type != null ? var.resource_type : null
    resource_group          = var.resource_group_name != null ? var.resource_group_name : null
    resource_id             = var.resource_id != null ? var.resource_id : null #to_monitor
    caller                  = var.criteria_caller != null ? var.criteria_caller : null
    level                   = var.criteria_level != null ? var.criteria_level : null
    status                  = var.criteria_status != null ? var.criteria_status : null
    sub_status              = var.criteria_sub_status != null ? var.criteria_sub_status : null
    recommendation_type     = var.category_log_alert == "Recommendation" && var.criteria_recommendation_type != null ? var.criteria_recommendation_type : null
    recommendation_category = var.category_log_alert == "Recommendation" && var.criteria_recommendation_category != null ? var.criteria_recommendation_category : null
    recommendation_impact   = var.category_log_alert == "Recommendation" && var.criteria_recommendation_impact != null ? var.criteria_recommendation_impact : null

    # dynamic "resource_health" {
    #   for_each = var.resource_health != null ? var.resource_health : {}
    #   content {
    #     current  = resource_health.value.current
    #     previous = resource_health.value.previous
    #     reason   = resource_health.value.reason
    #   }
    # }
    # dynamic "service_health" {
    #   for_each = var.service_health //!= null ? var.service_health : {}
    #   content {
    #     events    = service_health.value.events
    #     locations = service_health.value.locations
    #     services  = service_health.value.services
    #   }
    # }
  }

  dynamic "action" {
    for_each = var.log_alert_action ? [1] : []
    content {
      action_group_id    = azurerm_monitor_action_group.mactiong.id
      webhook_properties = var.action_webhook_properties
    }
  }
  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "metric_alert" {
  name                     = var.metric_alert_name
  resource_group_name      = var.resource_group_name
  scopes                   = var.metric_alert_scopes
  description              = var.metric_alert_description
  enabled                  = var.metric_alert_enabled
  auto_mitigate            = var.metric_alert_auto_mitigate
  frequency                = var.metric_alert_frequency
  severity                 = var.metric_alert_severity
  target_resource_type     = var.metric_alert_target_resource_type
  target_resource_location = var.metric_alert_target_resource_location
  window_size              = var.metric_alert_window_size

  criteria {
    metric_namespace = var.criteria_metric_namespace
    metric_name      = var.criteria_metric__name
    aggregation      = var.criteria_aggregation
    operator         = var.criteria_operator
    threshold        = var.criteria_threshold
    dynamic "dimension" {
      for_each = var.criteria_dimension != null && var.criteria_metric_namespace != null ? var.criteria_dimension : null
      content {
        name     = dimension.value.name
        operator = dimension.value.operator
        values   = dimension.value.values
      }
    }
    skip_metric_validation = var.criteria_skip_metric_validation
  }

  dynamic "dynamic_criteria" {
    for_each = var.dynamic_criteria != null ? var.dynamic_criteria : []
    content {
      metric_namespace  = dynamic_criteria.value.metric_namespace
      metric_name       = dynamic_criteria.value.metric_name
      aggregation       = dynamic_criteria.value.aggregation
      operator          = dynamic_criteria.value.operator
      alert_sensitivity = dynamic_criteria.value.alert_sensitivity
      dynamic "dimension" {
        for_each = dynamic_criteria.value.dimension != null ? dynamic_criteria.value.dimension : []
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
      evaluation_total_count   = dynamic_criteria.value.evaluation_total_count
      evaluation_failure_count = dynamic_criteria.value.evaluation_failure_count
      ignore_data_before       = dynamic_criteria.value.ignore_data_before
      skip_metric_validation   = dynamic_criteria.value.skip_metric_validation
    }
  }

  dynamic "application_insights_web_test_location_availability_criteria" {
    for_each = var.application_insights_web_test_lac != null ? var.application_insights_web_test_lac : {}
    content {
      web_test_id           = application_insights_web_test_location_availability_criteria.value.web_test_id
      component_id          = application_insights_web_test_location_availability_criteria.value.component_id
      failed_location_count = application_insights_web_test_location_availability_criteria.value.failed_location_count
    }
  }

  dynamic "action" {
    for_each = var.metric_alert_action ? [1] : []
    content {
      action_group_id    = azurerm_monitor_action_group.mactiong.id
      webhook_properties = var.metric_action_webhook_properties
    }
  }

  tags = var.tags
}

