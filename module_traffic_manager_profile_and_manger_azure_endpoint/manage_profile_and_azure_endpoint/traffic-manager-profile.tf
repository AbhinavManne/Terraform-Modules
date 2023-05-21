# -------------------------------------TRAFFIC MANAGER PROFILE-------------------------------------------#

resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  name                   = var.traffic_manager_profile_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  profile_status         = var.profile_status
  traffic_view_enabled   = var.traffic_view_enabled
  max_return             = var.max_return
  

  dns_config {
    relative_name = var.traffic_manager_profile_name
    ttl           = var.ttl
  }

  monitor_config {
    protocol                     = var.protocol
    port                         = var.port
    path                         = var.protocol == "TCP" ? null : var.path // Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP.
    interval_in_seconds          = var.interval_in_seconds 
    timeout_in_seconds           = var.timeout_in_seconds
    tolerated_number_of_failures = var.tolerated_number_of_failures
    expected_status_code_ranges = var.expected_status_code_ranges
    
    dynamic "custom_header" {
    for_each = var.custom_header != null ? var.custom_header : []
    content {
        name  = custom_header.value.name
        value = custom_header.value.value
            }
      }
  }

  tags = var.tags
}

# ------------------------------------Azure End Points ------------------------------------------#

resource "azurerm_traffic_manager_azure_endpoint" "manager_azure_endpoint" {
  name               = var.azure_end_point_name
  profile_id         = azurerm_traffic_manager_profile.traffic_manager_profile.id
  weight             = var.azure_end_point_weight
  enabled            = var.enabled
  priority           = var.priority
  target_resource_id = var.target_resource_id
  geo_mappings       = var.geo_mappings
  
  dynamic "subnet" {
    for_each = var.traffic_routing_method != "Weighted" ? var.subnet : []    // Weighted traffic routing method does not support subnet overides
    content {
        first = subnet.value.first
        last  = subnet.value.last
        scope = subnet.value.scope
      }
    }
  
  dynamic "custom_header" {
    for_each = var.endpoint_custom_header != null ? var.endpoint_custom_header : []
    content {
        name  = custom_header.value.name
        value = custom_header.value.value
            }
      }
    

}

