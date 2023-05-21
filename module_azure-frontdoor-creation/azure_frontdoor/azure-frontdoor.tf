#locals
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group)
  location = var.location
}

#Creating an azure front door instance
resource "azurerm_frontdoor" "example" {
  name                                         = var.frontdoor_name
  resource_group_name                          = local.resource_group_name
  enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check

  frontend_endpoint {
    name                                    = var.frontend_endpoint_name
    host_name                               = "${var.frontdoor_name}.azurefd.net"
    web_application_firewall_policy_link_id = var.frontdoor_waf_policy_id
  }

  backend_pool_load_balancing {
    name = var.load_balancing_name
  }

  backend_pool_health_probe {
    name = var.health_probe_name
  }

  backend_pool {
    name = var.backend_pool_name
    #Multiple backend blocks can be added here
    backend {
      host_header = var.first_backend_host
      address     = var.first_backend_host
      http_port   = var.http_port
      https_port  = var.https_port
    }
    backend {
      host_header = var.second_backend_host
      address     = var.second_backend_host
      http_port   = var.http_port
      https_port  = var.https_port
    }

    load_balancing_name = var.load_balancing_name
    health_probe_name   = var.health_probe_name
  }

  routing_rule {
    name               = var.routing_rule_name
    accepted_protocols = var.accepted_protocols
    patterns_to_match  = var.patterns_to_match
    frontend_endpoints = [var.frontend_endpoint_name]
    forwarding_configuration {
      forwarding_protocol = var.forwarding_protocol
      backend_pool_name   = var.backend_pool_name
    }
  }
  tags = var.tags
}