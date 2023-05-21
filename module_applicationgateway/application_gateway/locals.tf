locals {
  frontend_port_name             = "appgw-${var.app_gateway_name}-${var.location}-feport"
  frontend_ip_configuration_name = "appgw-${var.app_gateway_name}-${var.location}-feip"
  gateway_ip_configuration_name  = "appgw-${var.app_gateway_name}-${var.location}-gwipc"

}