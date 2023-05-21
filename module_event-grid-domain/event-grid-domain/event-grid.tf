
#------------------------------------------Event Grid Domain------------------------------------------------------
resource "azurerm_eventgrid_domain" "eventgrid" {
  name                                      = var.eventgrid_name
  location                                  = var.location
  resource_group_name                       = var.resource_group_name
  input_schema                              = var.input_schema
  public_network_access_enabled             = var.public_network_access_enabled
  local_auth_enabled                        = var.local_auth_enabled
  auto_create_topic_with_first_subscription = var.auto_create_topic_with_first_subscription
  auto_delete_topic_with_last_subscription  = var.auto_delete_topic_with_last_subscription
  tags                                      = var.tags

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" ? var.managed_identity_ids : null
    }
  }

  dynamic "input_mapping_fields" {
    for_each = var.enable_input_mapping_fields != null ? [1] : []
    content {
      id           = var.input_mapping_fields_id
      topic        = var.input_mapping_fields_topic
      event_type   = var.input_mapping_fields_event_type
      event_time   = var.input_mapping_fields_time
      data_version = var.input_mapping_fields_data_version
      subject      = var.input_mapping_fields_subject
    }
  }

  dynamic "input_mapping_default_values" {
    for_each = var.enable_input_mapping_default_values != null ? [1] : []
    content {
      event_type   = var.input_mapping_default_values_event_type
      data_version = var.input_mapping_default_values_data_version
      subject      = var.input_mapping_default_values_data_subject
    }
  }

  dynamic "inbound_ip_rule" {
    for_each = var.inbound_ip_rule != null ? var.inbound_ip_rule : []
    content {
      ip_mask = inbound_ip_rule.value.ip_mask
      action  = inbound_ip_rule.value.action
    }
  }
}

resource "azurerm_eventgrid_domain_topic" "domaintopic" {
  name                = var.eventgrid_domain_topic_name
  domain_name         = azurerm_eventgrid_domain.eventgrid.name
  resource_group_name = var.resource_group_name
}