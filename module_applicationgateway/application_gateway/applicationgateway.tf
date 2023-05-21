#----------------------------------------------
# Application Gateway with all optional blocks
#----------------------------------------------
resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  enable_http2        = var.enable_http2 != null ? var.enable_http2 : null
  zones               = var.zones != null ? var.zones : null
  firewall_policy_id  = var.firewall_policy_id != null ? var.firewall_policy_id : null
  tags                = var.tags

  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    capacity = var.autoscale_configuration == null ? var.sku.capacity : null
  }

  dynamic "autoscale_configuration" {
    for_each = var.autoscale_configuration != null ? [var.autoscale_configuration] : []
    content {
      min_capacity = lookup(autoscale_configuration.value, "min_capacity")
      max_capacity = lookup(autoscale_configuration.value, "max_capacity", 2)
    }
  }

  dynamic "gateway_ip_configuration" {
    for_each = var.gateway_ip_configuration 
    content {
      name      = local.gateway_ip_configuration_name
      subnet_id = gateway_ip_configuration.value.subnet_id
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configuration 
    content {
      name                            = local.frontend_ip_configuration_name
      public_ip_address_id            = lookup(frontend_ip_configuration.value, "public_ip_address_id", null)
      private_ip_address              = lookup(frontend_ip_configuration.value, "private_ip_address") != null ? lookup(frontend_ip_configuration.value, "private_ip_address") : null
      private_ip_address_allocation   = lookup(frontend_ip_configuration.value, "private_ip_address") != null ? lookup(frontend_ip_configuration.value, "private_ip_address_allocation") : null
      subnet_id                       = lookup(frontend_ip_configuration.value, "private_ip_address") != null ? lookup(frontend_ip_configuration.value, "subnet_id") : null
      private_link_configuration_name = lookup(frontend_ip_configuration.value, "private_link_configuration_name", null)
    }
  }



  dynamic "frontend_port" {
    for_each = var.frontend_port
    content {
      name = local.frontend_port_name
      port = frontend_port.value.port
    }
  }



  #----------------------------------------------------------
  # Backend Address Pool Configuration (Required)
  #----------------------------------------------------------
  dynamic "backend_address_pool" {
    for_each = var.backend_address_pools
    content {
      name         = lookup(backend_address_pool.value, "name")
      fqdns        = lookup(backend_address_pool.value, "fqdns", null)
      ip_addresses = lookup(backend_address_pool.value, "ip_addresses", null)
    }
  }

  #----------------------------------------------------------
  # Backend HTTP Settings (Required)
  #----------------------------------------------------------
  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings
    content {
      name                                = lookup(backend_http_settings.value, "name")
      cookie_based_affinity               = lookup(backend_http_settings.value, "cookie_based_affinity", "Disabled")
      affinity_cookie_name                = lookup(backend_http_settings.value, "affinity_cookie_name", null)
      path                                = lookup(backend_http_settings.value, "path", "/")
      port                                = lookup(backend_http_settings.value, "enable_https") ? 443 : 80
      probe_name                          = lookup(backend_http_settings.value, "probe_name", null)
      protocol                            = lookup(backend_http_settings.value, "enable_https") ? "Https" : "Http"
      request_timeout                     = lookup(backend_http_settings.value, "request_timeout", 30)
      host_name                           = lookup(backend_http_settings.value, "pick_host_name_from_backend_address") == false ? lookup(backend_http_settings.value, "host_name") : null
      pick_host_name_from_backend_address = lookup(backend_http_settings.value, "pick_host_name_from_backend_address", false)

      dynamic "authentication_certificate" {
        for_each = backend_http_settings.value.authentication_certificate[*]
        content {
          name = authentication_certificate.value.name
        }
      }

      trusted_root_certificate_names = lookup(backend_http_settings.value, "trusted_root_certificate_names", null)

      dynamic "connection_draining" {
        for_each = backend_http_settings.value.connection_draining[*]
        content {
          enabled           = connection_draining.value.enable_connection_draining
          drain_timeout_sec = connection_draining.value.drain_timeout_sec
        }
      }
    }
  }

  #----------------------------------------------------------
  # HTTP Listener Configuration (Required)
  #----------------------------------------------------------
  dynamic "http_listener" {
    for_each = var.http_listeners
    content {
      name                           = lookup(http_listener.value, "name")
      frontend_ip_configuration_name = local.frontend_ip_configuration_name
      frontend_port_name             = local.frontend_port_name
      host_name                      = lookup(http_listener.value, "host_name", null)
      host_names                     = lookup(http_listener.value, "host_names", null)
      protocol                       = lookup(http_listener.value, "ssl_certificate_name") == null ? "Http" : "Https"
      require_sni                    = lookup(http_listener.value, "ssl_certificate_name") != null ? http_listener.value.require_sni : null
      ssl_certificate_name           = lookup(http_listener.value, "ssl_certificate_name")
      firewall_policy_id             = lookup(http_listener.value, "firewall_policy_id")
      ssl_profile_name               = lookup(http_listener.value, "ssl_profile_name")

      dynamic "custom_error_configuration" {
        for_each = http_listener.value.custom_error_configuration != null ? lookup(http_listener.value, "custom_error_configuration", {}) : []
        content {
          custom_error_page_url = lookup(custom_error_configuration.value, "custom_error_page_url", null)
          status_code           = lookup(custom_error_configuration.value, "status_code", null)
        }
      }
    }
  }

  #----------------------------------------------------------
  # Request routing rules Configuration (Required)
  #----------------------------------------------------------
  dynamic "request_routing_rule" {
    for_each = var.request_routing_rules
    content {
      name                        = lookup(request_routing_rule.value, "name")
      rule_type                   = lookup(request_routing_rule.value, "rule_type")
      http_listener_name          = lookup(request_routing_rule.value, "http_listener_name")
      backend_address_pool_name   = lookup(request_routing_rule.value, "redirect_configuration_name") == null ? lookup(request_routing_rule.value, "backend_address_pool_name") : null
      backend_http_settings_name  = lookup(request_routing_rule.value, "redirect_configuration_name") == null ? lookup(request_routing_rule.value, "backend_http_settings_name") : null
      redirect_configuration_name = lookup(request_routing_rule.value, "redirect_configuration_name", null)
      rewrite_rule_set_name       = lookup(request_routing_rule.value, "rewrite_rule_set_name", null)
      url_path_map_name           = lookup(request_routing_rule.value, "url_path_map_name", null)
      priority                    = lookup(request_routing_rule.value, "priority", null)
    }
  }

  #---------------------------------------------------------------
  # Identity block Configuration (Optional)
  # A list with a single user managed identity id to be assigned
  #---------------------------------------------------------------
  dynamic "identity" {
    for_each = var.identity_ids != null ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  #----------------------------------------------------------
  # Authentication SSL Certificate Configuration (Optional)
  #----------------------------------------------------------
  dynamic "authentication_certificate" {
    for_each = var.authentication_certificates
    content {
      name = authentication_certificate.value.name
      data = filebase64(authentication_certificate.value.data)
    }
  }

  #----------------------------------------------------------
  # Trusted Root SSL Certificate Configuration (Optional)
  #----------------------------------------------------------
  dynamic "trusted_root_certificate" {
    for_each = var.trusted_root_certificates
    content {
      name = trusted_root_certificate.value.name
      data = filebase64(trusted_root_certificate.value.data)
    }
  }

  #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  # SSL Policy for Application Gateway (Optional)
  # Application Gateway has three predefined security policies to get the appropriate level of security
  # AppGwSslPolicy20150501 - MinProtocolVersion(TLSv1_0), AppGwSslPolicy20170401 - MinProtocolVersion(TLSv1_1), AppGwSslPolicy20170401S - MinProtocolVersion(TLSv1_2)
  #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  dynamic "ssl_policy" {
    for_each = var.ssl_policy != null ? [var.ssl_policy] : []
    content {
      disabled_protocols   = lookup(ssl_policy.value, "policy_type") == null && lookup(ssl_policy.value, "policy_name") == null ? lookup(ssl_policy.value, "disabled_protocols") : null
      policy_type          = lookup(var.ssl_policy, "policy_type", "Predefined")
      policy_name          = lookup(ssl_policy.value, "policy_type") == "Predefined" ? lookup(ssl_policy.value, "policy_name") : null
      cipher_suites        = lookup(ssl_policy.value, "policy_type") == "Custom" ? lookup(ssl_policy.value, "cipher_suites") : null
      min_protocol_version = lookup(ssl_policy.value, "min_protocol_version")
    }
  }

  #----------------------------------------------------------
  # SSL Certificate (.pfx) Configuration (Optional)
  #----------------------------------------------------------
  dynamic "ssl_certificate" {
    for_each = var.ssl_certificates
    content {
      name                = ssl_certificate.value.name
      data                = ssl_certificate.value.key_vault_secret_id == null ? filebase64(ssl_certificate.value.data) : null
      password            = ssl_certificate.value.key_vault_secret_id == null ? ssl_certificate.value.password : null
      key_vault_secret_id = ssl_certificate.value.key_vault_secret_id
    }
  }

  #----------------------------------------------------------
  # Health Probe (Optional)
  #----------------------------------------------------------
  dynamic "probe" {
    for_each = var.health_probes
    content {
      name                                      = lookup(probe.value, "name")
      host                                      = lookup(probe.value, "host", "127.0.0.1")
      interval                                  = lookup(probe.value, "interval", 30)
      protocol                                  = lookup(probe.value, "port") == 443 ? "Https" : "Http"
      path                                      = lookup(probe.value, "path", "/")
      timeout                                   = lookup(probe.value, "timeout", 30)
      unhealthy_threshold                       = lookup(probe.value, "unhealthy_threshold", 3)
      port                                      = lookup(probe.value, "port", 443)
      pick_host_name_from_backend_http_settings = lookup(probe.value, "pick_host_name_from_backend_http_settings", false)
      minimum_servers                           = lookup(probe.value, "minimum_servers", 0)

      dynamic "match" {
        for_each = lookup(probe.value, "match") != null ? [1] : []
        content {
          body        = lookup(match.value, "body")
          status_code = lookup(match.value, "status_code")
        }
      }
    }
  }

  #----------------------------------------------------------
  # URL Path Mappings (Optional)
  #----------------------------------------------------------
  dynamic "url_path_map" {
    for_each = var.url_path_maps
    content {
      name                                = lookup(url_path_map.value, "name")
      default_backend_address_pool_name   = lookup(url_path_map.value, "default_redirect_configuration_name") == null ? lookup(url_path_map.value, "default_backend_address_pool_name") : null
      default_backend_http_settings_name  = lookup(url_path_map.value, "default_redirect_configuration_name") == null ? lookup(url_path_map.value, "default_backend_http_settings_name") : null
      default_redirect_configuration_name = lookup(url_path_map.value, "default_redirect_configuration_name", null)
      default_rewrite_rule_set_name       = lookup(url_path_map.value, "default_rewrite_rule_set_name", null)

      dynamic "path_rule" {
        for_each = lookup(url_path_map.value, "path_rules")
        content {
          name                        = lookup(path_rule.value, "name")
          backend_address_pool_name   = lookup(path_rule.value, "backend_address_pool_name")
          backend_http_settings_name  = lookup(path_rule.value, "backend_http_settings_name")
          paths                       = flatten(path_rule.value.paths)
          redirect_configuration_name = lookup(path_rule.value, "redirect_configuration_name", null)
          rewrite_rule_set_name       = lookup(path_rule.value, "rewrite_rule_set_name", null)
          firewall_policy_id          = lookup(path_rule.value, "firewall_policy_id", null)
        }
      }
    }
  }

  #----------------------------------------------------------
  # Redirect Configuration (Optional)
  #----------------------------------------------------------
  dynamic "redirect_configuration" {
    for_each = var.redirect_configuration
    content {
      name                 = lookup(redirect_configuration.value, "name", null)
      redirect_type        = lookup(redirect_configuration.value, "redirect_type", "Permanent")
      target_listener_name = lookup(redirect_configuration.value, "target_listener_name", null)
      target_url           = lookup(redirect_configuration.value, "target_url", null)
      include_path         = lookup(redirect_configuration.value, "include_path", "true")
      include_query_string = lookup(redirect_configuration.value, "include_query_string", "true")
    }
  }

  #----------------------------------------------------------
  # Custom error configuration (Optional)
  #----------------------------------------------------------
  dynamic "custom_error_configuration" {
    for_each = var.custom_error_configuration
    content {
      custom_error_page_url = lookup(custom_error_configuration.value, "custom_error_page_url", null)
      status_code           = lookup(custom_error_configuration.value, "status_code", null)
    }
  }

  #----------------------------------------------------------
  # Rewrite Rules Set configuration (Optional)
  #----------------------------------------------------------
  dynamic "rewrite_rule_set" {
    for_each = var.rewrite_rule_set
    content {
      name = var.rewrite_rule_set.name

      dynamic "rewrite_rule" {
        for_each = lookup(var.rewrite_rule_set, "rewrite_rules", [])
        content {
          name          = rewrite_rule.value.name
          rule_sequence = rewrite_rule.value.rule_sequence

          dynamic "condition" {
            for_each = lookup(rewrite_rule_set.value, "condition", [])
            content {
              variable    = condition.value.variable
              pattern     = condition.value.pattern
              ignore_case = condition.value.ignore_case
              negate      = condition.value.negate
            }
          }

          dynamic "request_header_configuration" {
            for_each = lookup(rewrite_rule.value, "request_header_configuration", [])
            content {
              header_name  = request_header_configuration.value.header_name
              header_value = request_header_configuration.value.header_value
            }
          }

          dynamic "response_header_configuration" {
            for_each = lookup(rewrite_rule.value, "response_header_configuration", [])
            content {
              header_name  = response_header_configuration.value.header_name
              header_value = response_header_configuration.value.header_value
            }
          }

          dynamic "url" {
            for_each = lookup(rewrite_rule.value, "url", [])
            content {
              path         = url.value.path
              query_string = url.value.query_string
              reroute      = url.value.reroute
            }
          }
        }
      }
    }
  }

  #----------------------------------------------------------
  # Web application Firewall (WAF) configuration (Optional)
  # Tier to be either “WAF” or “WAF V2”
  #----------------------------------------------------------
  dynamic "waf_configuration" {
    for_each = var.waf_configuration != null ? [var.waf_configuration] : []
    content {
      enabled                  = lookup(waf_configuration.value, "enabled", false)
      firewall_mode            = lookup(waf_configuration.value, "firewall_mode", "Detection")
      rule_set_type            = lookup(waf_configuration.value, "rule_set_type", "OWASP")
      rule_set_version         = lookup(waf_configuration.value, "rule_set_version", "3.1")
      file_upload_limit_mb     = lookup(waf_configuration.value, "file_upload_limit_mb", 100)
      request_body_check       = lookup(waf_configuration.value, "request_body_check", true)
      max_request_body_size_kb = lookup(waf_configuration.value, "max_request_body_size_kb", 128)

      dynamic "disabled_rule_group" {
        for_each = waf_configuration.value.disabled_rule_group
        content {
          rule_group_name = disabled_rule_group.value.rule_group_name
          rules           = disabled_rule_group.value.rules
        }
      }

      dynamic "exclusion" {
        for_each = waf_configuration.value.exclusion
        content {
          match_variable          = exclusion.value.match_variable
          selector_match_operator = exclusion.value.selector_match_operator
          selector                = exclusion.value.selector
        }
      }
    }
  }



}