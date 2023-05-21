resource_group_name = "rg"
location            = "eastus"


app_gateway_name   = "app123-test"
enable_http2       = false
zones              = ["1", "2", "3"]
firewall_policy_id = null
sku = {
  capacity = 1
  name     = "Standard_v2"
  tier     = "Standard_v2"
}

autoscale_configuration = {
  min_capacity = 1
  max_capacity = 15
}

gateway_ip_configuration = {
  "g1" = {
    name      = "gateway123"
    subnet_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/sub1"
  }
}

frontend_ip_configuration = {
  frontend1 = {
    name                            = "front123"
    public_ip_address_id            = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/publicIPAddresses/pip1"
    private_ip_address              = null //"10.0.0.0/24"
    private_ip_address_allocation   = "Dynamic"
    subnet_id                       = null //"/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"
    private_link_configuration_name = null
  }
}

backend_address_pools = [
  {
    name  = "appgw-testgateway-eastus-bapool01" //same as line no 91
    fqdns = ["example1.com", "example2.com"]
  },
  {
    name         = "appgw-testgateway-eastus-bapool02"
    ip_addresses = ["1.2.3.4", "2.3.4.5"]
  }
]


backend_http_settings = [
  {
    name                  = "appgw-testgateway-eastus-be-http-set1"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    enable_https          = true
    request_timeout       = 30
    //probe_name            = "appgw-testgateway-eastus-probe1" # Remove this if `health_probes` object is not defined.
    connection_draining = {
      enable_connection_draining = true
      drain_timeout_sec          = 300

    }
  },
  {
    name                  = "appgw-testgateway-eastus-be-http-set2"
    cookie_based_affinity = "Enabled"
    path                  = "/"
    enable_https          = false
    request_timeout       = 30
  }
]


http_listeners = [
  {

    name                           = "appgw-testgateway-eastus-be-htln01"
    frontend_ip_configuration_name = "front123"
    //frontend_port_name = "port123"
    //ssl_certificate_name = "appgw-testgateway-eastus-ssl01"
    host_name = null
  }
]


request_routing_rules = [
  {
    name                       = "appgw-testgateway-eastus-be-rqrt"
    priority                   = 1
    rule_type                  = "Basic"
    http_listener_name         = "appgw-testgateway-eastus-be-htln01"
    backend_address_pool_name  = "appgw-testgateway-eastus-bapool01"
    backend_http_settings_name = "appgw-testgateway-eastus-be-http-set1"
  }
]

frontend_port = [{

  port = 80
}]

identity_type = "UserAssigned"
identity_ids  = ["/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user123"]

authentication_certificates = []

trusted_root_certificates = []

ssl_policy = {
  policy_type = "Predefined"
  policy_name = "AppGwSslPolicy20170401S"
}


# ssl_certificates = [{
#   name     = "appgw-testgateway-eastus-ssl01"
#   //data     = 
#   password = "P@$$w0rd123"
# }]

ssl_certificates = []

health_probes = [
  {
    name                = "appgw-testgateway-eastus-probe1"
    host                = "127.0.0.1"
    interval            = 30
    path                = "/"
    port                = 443
    timeout             = 30
    unhealthy_threshold = 3
    match               = null
  }
]

url_path_maps = []

waf_configuration = {
  disabled_rule_group = [ {
    rule_group_name = "crs_20_protocol_violations"
    rules = []
  } ]
  enabled = false
  exclusion = [ {
    match_variable = "RequestHeaderNames"
    selector = null
    selector_match_operator = "Equals"
  } ]
  file_upload_limit_mb = 1
  firewall_mode = "Detection"
  max_request_body_size_kb = 100
  request_body_check = false
  rule_set_version = "3.1"
}