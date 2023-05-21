module "Traffic_Manager_External_Endpoint" {
    source                   = "../modules/module_traffic_manager_external_endpoint/external_endpoint"
    external_endpoint_name   = var.external_endpoint_name
    weight                   = var.weight
    target                   = var.target
    endpoint_location        = var.endpoint_location
    enabled                  = var.enabled
    priority                 = var.priority
    custom_header            = var.custom_header
    subnet                   = var.subnet
    profile_name             = var.profile_name
    traffic_routing_method   = var.traffic_routing_method
    ttl                      = var.ttl
    protocol                 = var.protocol
    port                     = var.port
    path                     = var.path
    interval_in_seconds      = var.interval_in_seconds
    timeout_in_seconds       = var.timeout_in_seconds
    tolerated_number_of_failures = var.tolerated_number_of_failures
    tags                     = var.tags
    resource_group_name      = var.resource_group_name
    geo_mappings             = var.geo_mappings
    max_return               = var.max_return
}