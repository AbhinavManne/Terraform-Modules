#-------------------------------Parent profile-----------------------------------------------#
resource "azurerm_traffic_manager_profile" "parent" {
  name                   = var.parent_profile_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  max_return             = var.max_return

  dns_config {
    relative_name       = var.parent_profile_name
    ttl                 = var.ttl
  }

  monitor_config {
    protocol                     = var.protocol
    port                         = var.port
    path                         = var.protocol == "TCP" ? null : var.path // Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP.
    interval_in_seconds          = var.interval_in_seconds 
    timeout_in_seconds           = var.timeout_in_seconds
    tolerated_number_of_failures = var.tolerated_number_of_failures
  }

  tags = var.tags
}

#-------------------------------nested profile-----------------------------------------------#
resource "azurerm_traffic_manager_profile" "nested" {
  name                    = var.nested_profile_name
  resource_group_name     = var.resource_group_name
  traffic_routing_method  = var.nested_traffic_routing_method
  max_return              = var.nested_max_return

  dns_config {
    relative_name = var.nested_profile_name
    ttl           = var.nested_ttl
  }

  monitor_config {
    protocol = var.nested_protocol
    port     = var.nested_port
    path     = var.nested_protocol == "TCP" ? null : var.nested_path // Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP.
  }
}

#--------------------------------nested endpoint---------------------------------------------#
resource "azurerm_traffic_manager_nested_endpoint" "traffic_manager_nested_endpoint" {
  name                                  = var.name
  target_resource_id                    = azurerm_traffic_manager_profile.nested.id
  priority                              = var.priority
  profile_id                            = azurerm_traffic_manager_profile.parent.id
  minimum_child_endpoints               = var.minimum_child_endpoints
  weight                                = var.weight
  enabled                               = var.enabled
  endpoint_location                     = var.endpoint_location 
  minimum_required_child_endpoints_ipv4 = var.minimum_required_child_endpoints_ipv4
  minimum_required_child_endpoints_ipv6 = var.minimum_required_child_endpoints_ipv6
  geo_mappings                          = var.geo_mappings    
  
  dynamic "custom_header" {
    for_each = var.custom_header != null ? var.custom_header : []
    content {
        name  = custom_header.value.name
        value = custom_header.value.value
    }
  }

  dynamic "subnet" {
    for_each = var.traffic_routing_method != "Weighted" ? var.subnet : []    // Weighted traffic routing method does not support subnet overides
    content {
        first = subnet.value.first
        last  = subnet.value.last
        scope = subnet.value.scope
    }
  }

}