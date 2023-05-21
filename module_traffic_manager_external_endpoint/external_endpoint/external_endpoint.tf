#--------------------------------Traffic manager profile--------------------------------------#

resource "azurerm_traffic_manager_profile" "manager_profile" {
  name                   = var.profile_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  max_return             = var.max_return

  dns_config {
    relative_name = var.profile_name
    ttl           = var.ttl
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
    
#---------------------------------external endpoint---------------------------------------------#
resource "azurerm_traffic_manager_external_endpoint" "external_endpoint" {
  name                = var.external_endpoint_name
  profile_id          = azurerm_traffic_manager_profile.manager_profile.id
  weight              = var.weight
  target              = var.target
  endpoint_location   = var.endpoint_location
  enabled             = var.enabled
  priority            = var.priority
  geo_mappings        = var.geo_mappings
  
  dynamic "custom_header" {
    for_each = var.custom_header != null ? var.custom_header : []
    content {
        name  = custom_header.value.name
        value = custom_header.value.value
    }
  }

  dynamic "subnet" {
    for_each = var.traffic_routing_method == "Weighted" || var.traffic_routing_method == "MultiValue" ? [] : var.subnet         // Weighted and MultiValue traffic routing method does not support subnet overrides
    content {
        first = subnet.value.first
        last  = subnet.value.last
        scope = subnet.value.scope
    }
  }

  }
  
