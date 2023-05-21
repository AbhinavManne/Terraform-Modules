resource "azurerm_eventgrid_system_topic" "systemtopic" {
  name                   = var.eventgrid_system_topic_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  source_arm_resource_id = var.source_arm_resource_id
  topic_type             = var.topic_type
  tags                   = var.tags

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" ? var.managed_identity_ids : null
    }
  }
}

resource "azurerm_eventgrid_system_topic_event_subscription" "egstes" {
  name                                 = var.eventgrid_system_topic_event_subscription_name
  system_topic                         = azurerm_eventgrid_system_topic.systemtopic.name
  resource_group_name                  = var.resource_group_name
  expiration_time_utc                  = var.expiration_time_utc
  event_delivery_schema                = var.event_delivery_schema
  eventhub_endpoint_id                 = var.eventhub_endpoint_id
  hybrid_connection_endpoint_id        = var.hybrid_connection_endpoint_id
  service_bus_queue_endpoint_id        = var.service_bus_queue_endpoint_id
  service_bus_topic_endpoint_id        = var.service_bus_topic_endpoint_id
  included_event_types                 = var.included_event_types
  labels                               = var.labels
  advanced_filtering_on_arrays_enabled = var.advanced_filtering_on_arrays_enabled

  dynamic "azure_function_endpoint" {
    for_each = var.function_id != null ? [1] : []
    content {
      function_id                       = var.function_id
      max_events_per_batch              = var.max_events_per_batch
      preferred_batch_size_in_kilobytes = var.preferred_batch_size_in_kilobytes
    }
  }

  dynamic "storage_queue_endpoint" {
    for_each = var.queue_name != null ? [1] : []
    content {
      queue_name                            = var.queue_name
      storage_account_id                    = var.storage_account_id
      queue_message_time_to_live_in_seconds = var.queue_message_time_to_live_in_seconds
    }
  }

  dynamic "webhook_endpoint" {
    for_each = var.url != null ? [1] : []
    content {
      url                               = var.url
      base_url                          = var.base_url
      max_events_per_batch              = var.webhook_endpoint_max_events_per_batch
      preferred_batch_size_in_kilobytes = var.webhook_endpoint_preferred_batch_size_in_kilobytes
      active_directory_tenant_id        = var.active_directory_tenant_id
      active_directory_app_id_or_uri    = var.active_directory_app_id_or_uri
    }
  }

  dynamic "subject_filter" {
    for_each = var.enable_subject_filter != null ? [1] : []
    content {
      subject_begins_with = var.subject_begins_with
      subject_ends_with   = var.subject_ends_with
      case_sensitive      = var.case_sensitive
    }
  }
  dynamic "string_not_contains" {
                for_each = var.advanced_filter.value.string_not_contains[*]
                content {
                    key   = each.value.key
                    values = each.value.values
                }
            }
        }
        dynamic "advanced_filter" {
        for_each = var.advanced_filter[*]
        content {
            dynamic "string_contains" {
                for_each = var.advanced_filter.value.string_contains[*]
                content {
                    key   = each.value.key
                    values = each.value.values
                }
            }

  dynamic "delivery_identity" {
    for_each = var.delivery_identity_type != null ? [1] : []
    content {
      type                   = var.delivery_identity_type
      user_assigned_identity = var.delivery_user_assigned_identity
    }
  }

  dynamic "delivery_property" {
    for_each = var.delivery_property != null ? var.delivery_property : []
    content {
      header_name  = delivery_property.value.header_name
      type         = delivery_property.value.type
      value        = delivery_property.value.value
      source_field = delivery_property.value.source_field
      secret       = delivery_property.value.secret
    }
  }

  dynamic "dead_letter_identity" {
    for_each = var.dead_letter_identity_type != null ? [1] : []
    content {
      type                   = var.dead_letter_identity_type
      user_assigned_identity = var.dead_letter_user_assigned_identity
    }
  }

  dynamic "storage_blob_dead_letter_destination" {
    for_each = var.storage_blob_container_name != null ? [1] : []
    content {
      storage_account_id          = var.storage_account_id
      storage_blob_container_name = var.storage_blob_container_name
    }
  }

  dynamic "retry_policy" {
    for_each = var.max_delivery_attempts != null ? [1] : []
    content {
      max_delivery_attempts = var.max_delivery_attempts
      event_time_to_live    = var.event_time_to_live
    }
  }
}