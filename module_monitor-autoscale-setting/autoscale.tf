resource "azurerm_monitor_autoscale_setting" "autoscale_setting_policy" {
  name                = var.monitor_autoscale_setting_name
  resource_group_name = var.resource_group_name
  location            = var.location
  profile {
    name = var.profile_name
    capacity {
      default = var.capacity_default
      minimum = var.capacity_minimum
      maximum = var.capacity_maximum
    }
    dynamic "rule" {
      for_each = var.rules != null ? var.rules : {}
      content {
        metric_trigger {
          metric_name        = lookup(rule.value, "metric_name")
          metric_resource_id = lookup(rule.value, "metric_resource_id")
          operator           = lookup(rule.value, "operator")
          statistic          = lookup(rule.value, "statistic")
          time_aggregation   = lookup(rule.value, "time_aggregation")
          time_grain         = lookup(rule.value, "time_grain")
          time_window        = lookup(rule.value, "time_window")
          threshold          = lookup(rule.value, "threshold")
          metric_namespace   = lookup(rule.value, "metric_namespace")
          dynamic "dimensions" {
            for_each = lookup(rule.value, "dimensions", {})
            content {
              name     = lookup(dimensions.value, "name")
              operator = lookup(dimensions.value, "operator")
              values   = lookup(dimensions.value, "values")
            }
          }
          divide_by_instance_count = lookup(rule.value, "divide_by_instance_count")
        }
        scale_action {
          direction = lookup(rule.value, "direction")
          type      = lookup(rule.value, "type")
          value     = lookup(rule.value, "value")
          cooldown  = lookup(rule.value, "cooldown")
        }
      }
    }
    dynamic "fixed_date" {
      for_each = var.fixed_date != null ? [1] : []
      content {
        end      = lookup(var.fixed_date, "end")
        start    = lookup(var.fixed_date, "start")
        timezone = lookup(var.fixed_date, "timezone")
      }
    }
    dynamic "recurrence" {
      for_each = var.recurrence != null ? [1] : []
      content {
        timezone = lookup(var.recurrence, "timezone")
        minutes  = lookup(var.recurrence, "minutes")
        hours    = lookup(var.recurrence, "hours")
        days     = lookup(var.recurrence, "days")
      }
    }
  }
  target_resource_id = var.target_resource_id
  enabled            = var.enabled
  dynamic "notification" {
    for_each = var.notification != null ? [1] : []
    content {
      email {
        send_to_subscription_administrator    = lookup(var.notification, "send_to_subscription_administrator")
        send_to_subscription_co_administrator = lookup(var.notification, "send_to_subscription_co_administrator")
        custom_emails                         = lookup(var.notification, "custom_emails")
      }
      dynamic "webhook" {
        for_each = lookup(var.notification, "webhook") != null ? lookup(var.notification, "webhook") : {}
        content {
          service_uri = webhook.value["service_uri"]
          properties  = webhook.value["properties"]
        }
      }

    }
  }
  tags = var.tags
}
