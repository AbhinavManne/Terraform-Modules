resource_group_name                   = "cil-testing-001"
location                              = "East US"
virtual_network_gateway_name          = "testing-vng-001"
virtual_network_gateway_type          = "Vpn" //"ExpressRoute"//
virtual_network_gateway_active_active = false //true
virtual_network_gateway_sku           = "VpnGw1AZ" //"HighPerformance" // //
default_local_network_gateway_id      = null
virtual_network_gateway_edge_zone     = null
virtual_network_gateway_enable_bgp    = true//false
virtual_network_gateway_generation    = "Generation1"//null
private_ip_address_enabled            = true//false
virtual_network_gateway_vpn_type      = "RouteBased" //"PolicyBased"
ip_configuration_name                 = "vnetGatewayConfig"
ip_configuration_pip_addalloc         = "Dynamic"
ip_configuration_pip_id               = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-testing-001/providers/Microsoft.Network/publicIPAddresses/testing-pip-001"
ip_configuration_subnet_id            = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-testing-001/providers/Microsoft.Network/virtualNetworks/testing-vnet-001/subnets/GatewaySubnet"
vnet_gateway_ip_configuration = [{
  name                          = "vnetGatewayConfig"
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id          = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourcegroups/cil-testing-001/providers/Microsoft.Network/publicIpAddresses/testing-pip-002"
  subnet_id                     = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-testing-001/providers/Microsoft.Network/virtualNetworks/cil-testing-vnet-002/subnets/GatewaySubnet"
},
{
  name                          = "testing-ip-config-001"
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id          = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourcegroups/cil-testing-001/providers/Microsoft.Network/publicIpAddresses/testing-pip-003"
  subnet_id                     = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-testing-001/providers/Microsoft.Network/virtualNetworks/cil-testing-vnet-003/subnets/GatewaySubnet"
}]
bgp_settings = [{
  asn         = "65515"
  peer_weight = "10"
  peering_addresses = [{
    apipa_addresses       = ["169.254.21.0"]
    ip_configuration_name = "vnetGatewayConfig" //null
  }]
}]
vpn_client_configuration = [{
  aad_audience          = null
  aad_issuer            = null
  aad_tenant            = null
  address_space         = ["10.2.0.0/24"]
  radius_server_address = null
  radius_server_secret  = null
  revoked_certificate = [{
    name       = "Verizon-Global-Root-CA"
    thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B1"
  }]
  root_certificate = [{
    name             = "DigiCert-Federated-ID-Root-CA"
    public_cert_data = <<EOF
MIIDuzCCAqOgAwIBAgIQCHTZWCM+IlfFIRXIvyKSrjANBgkqhkiG9w0BAQsFADBn
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSYwJAYDVQQDEx1EaWdpQ2VydCBGZWRlcmF0ZWQgSUQg
Um9vdCBDQTAeFw0xMzAxMTUxMjAwMDBaFw0zMzAxMTUxMjAwMDBaMGcxCzAJBgNV
BAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
Y2VydC5jb20xJjAkBgNVBAMTHURpZ2lDZXJ0IEZlZGVyYXRlZCBJRCBSb290IENB
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvAEB4pcCqnNNOWE6Ur5j
QPUH+1y1F9KdHTRSza6k5iDlXq1kGS1qAkuKtw9JsiNRrjltmFnzMZRBbX8Tlfl8
zAhBmb6dDduDGED01kBsTkgywYPxXVTKec0WxYEEF0oMn4wSYNl0lt2eJAKHXjNf
GTwiibdP8CUR2ghSM2sUTI8Nt1Omfc4SMHhGhYD64uJMbX98THQ/4LMGuYegou+d
GTiahfHtjn7AboSEknwAMJHCh5RlYZZ6B1O4QbKJ+34Q0eKgnI3X6Vc9u0zf6DH8
Dk+4zQDYRRTqTnVO3VT8jzqDlCRuNtq6YvryOWN74/dq8LQhUnXHvFyrsdMaE1X2
DwIDAQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNV
HQ4EFgQUGRdkFnbGt1EWjKwbUne+5OaZvRYwHwYDVR0jBBgwFoAUGRdkFnbGt1EW
jKwbUne+5OaZvRYwDQYJKoZIhvcNAQELBQADggEBAHcqsHkrjpESqfuVTRiptJfP
9JbdtWqRTmOf6uJi2c8YVqI6XlKXsD8C1dUUaaHKLUJzvKiazibVuBwMIT84AyqR
QELn3e0BtgEymEygMU569b01ZPxoFSnNXc7qDZBDef8WfqAV/sxkTi8L9BkmFYfL
uGLOhRJOFprPdoDIUBB+tmCl3oDcBy3vnUeOEioz8zAkprcb3GHwHAK+vHmmfgcn
WsfMLH4JCLa/tRYL+Rw/N3ybCkDp00s0WUZ+AoDywSl0Q/ZEnNY0MsFiw6LyIdbq
M/s/1JRtO3bDSzD9TazRVzn2oBqzSa8VgIo5C1nOnoAKJTlsClJKvIhnRlaLQqk=
EOF
  }]
  vpn_auth_types       = null
  vpn_client_protocols = null
}]
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Virtual_network_gateway"
}

#----DEFAULT VALUES: ALERT MODULE----#
action_group_name        = "test-action-groupvnetg"
short_name               = "actionvnetg"
action_group_rule_name   = "test-vnetg"
scope_type               = "Resource"
activity_log_alert_name  = "test-activitylogalertvnetg"
resource_group_id        = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-testing-001"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "test-metricalertvnetg"
storage_account_id       = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-testing-001/providers/Microsoft.Storage/storageAccounts/ciltestingstr001"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]