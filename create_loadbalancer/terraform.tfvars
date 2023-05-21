################################ Resource Group ###############################

resource_group_name = "azure-cil-avirup-resource-group"
location            = "Central India"


############################ LOAD BALANCER ##########################################

lb_name     = "apploadbalancer"
lb_sku      = "Standard"
lb_sku_tier = "Regional"
tags = {
  Contact_name     = "xyz"
  Cost_Center      = 999
  Application_name = "load balancer"
}
public_load_balancer_required = true


frontend_ip_configuration = {
  "frontend-ip-1" = {
    name  = "lbip12"
    zones = null
    # zones                                              = ["1"]
    subnet_id = null
    # subnet_id                                          = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Network/virtualNetworks/lbvnet/subnets/sub1"
    gateway_load_balancer_frontend_ip_configuration_id = null
    # private_ip_address                                 = "10.0.0.6"
    private_ip_address = null
    # private_ip_address_allocation                      = "Static"
    private_ip_address_allocation = null
    # private_ip_address_version                         = "IPv4"
    private_ip_address_version = null
    # public_ip_address_id = null
    public_ip_address_id = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-avirup-resource-group/providers/Microsoft.Network/publicIPAddresses/lbip"
    # public_ip_address_id = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourcegroups/azure-cil-avirup-resource-group/providers/Microsoft.Network/publicIpAddresses/lbipbasic"
    public_ip_prefix_id = null
  },
  "frontend-ip-2" = {
    name = "outboundip12"
    # zones                                              = ["1"]
    # subnet_id                                          = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Network/virtualNetworks/lbvnet/subnets/sub1"
    gateway_load_balancer_frontend_ip_configuration_id = null
    # private_ip_address                                 = null
    # private_ip_address_allocation                      = "Dynamic"
    # private_ip_address_version                         = "IPv4"
    zones                         = null
    subnet_id                     = null
    private_ip_address            = null
    private_ip_address_allocation = null
    private_ip_address_version    = null
    # public_ip_address_id = null
    public_ip_address_id = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourcegroups/azure-cil-avirup-resource-group/providers/Microsoft.Network/publicIpAddresses/outboundip1"
    # public_ip_address_id = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourcegroups/azure-cil-avirup-resource-group/providers/Microsoft.Network/publicIpAddresses/outboundipbasic"
    public_ip_prefix_id = null

  }
}


backend_address_pools_required = true

backend_address_pools = {
  "backend-pool-1" = {
    backend_pool_tunnel_interface = null
  },
  "backend-pool-2" = {
    backend_pool_tunnel_interface = null
  }
}

backend_address_pools_addresses_required = true


backend_address_pool_addresses = {
  "backend-address-pool-1" = {
    backend_address_pool_address_backend_address_ip_configuration_id = null
    backend_address_pool_address_backend_address_pool_id             = "backend-pool-1"
    backend_address_pool_address_ip_address                          = "10.0.0.5"
    backend_address_pool_address_virtual_network_id                  = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Network/virtualNetworks/lbvnet"
  }
}

probe_required = true

probes = {
  "probe1" = {
    number_of_probes          = 2
    probe_interval_in_seconds = 15
    probe_port                = 80
    probe_request_path        = null
    probe_protocol            = "Tcp"
  }
}

load_balancing_rules_required = true

load_balancing_rules_file_path = "../../modules/module_loadbalancer/load_balancing_rules.csv"




outbound_rules_required = true

outbound_rules_file_path = "../../modules/module_loadbalancer/outbound_rules.csv"


nat_pools_required = true

nat_pools = {
  "nat-pool-1" = {
    lb_nat_pool_backend_port                   = 22
    lb_nat_pool_floating_ip_enabled            = false
    lb_nat_pool_frontend_ip_configuration_name = "lbip12"
    lb_nat_pool_frontend_port_end              = 65534
    lb_nat_pool_frontend_port_start            = 1
    lb_nat_pool_idle_timeout_in_minutes        = 4
    lb_nat_pool_protocol                       = "Tcp"
    lb_nat_pool_tcp_reset_enabled              = false
  }
}

nat_rules_required = true

nat_rules_file_path = "../../modules/module_loadbalancer/nat_rules.csv"

use_nat_rules_frontend_port = false

use_nat_rules_frontend_range = true