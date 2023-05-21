
module "app_gateway" {

  source = "../../modules/module_applicationgateway/application_gateway"

  resource_group_name         = var.resource_group_name
  location                    = var.location
  app_gateway_name            = var.app_gateway_name
  enable_http2                = var.enable_http2
  zones                       = var.zones
  firewall_policy_id          = var.firewall_policy_id
  sku                         = var.sku
  autoscale_configuration     = var.autoscale_configuration
  gateway_ip_configuration    = var.gateway_ip_configuration
  frontend_ip_configuration   = var.frontend_ip_configuration
  request_routing_rules       = var.request_routing_rules
  frontend_port               = var.frontend_port
  http_listeners              = var.http_listeners
  backend_http_settings       = var.backend_http_settings
  backend_address_pools       = var.backend_address_pools
  identity_type               = var.identity_type
  identity_ids                = var.identity_ids
  authentication_certificates = var.authentication_certificates
  trusted_root_certificates   = var.trusted_root_certificates
  ssl_policy                  = var.ssl_policy
  ssl_certificates            = var.ssl_certificates
  health_probes               = var.health_probes
  url_path_maps               = var.url_path_maps
  redirect_configuration      = var.redirect_configuration
  custom_error_configuration  = var.custom_error_configuration
  rewrite_rule_set            = var.rewrite_rule_set
  waf_configuration           = var.waf_configuration
  tags                        = var.tags

}




