locals {
  load_balancing_rules_file_exists = fileexists(var.load_balancing_rules_file_path)
  load_balancing_rules_file        = csvdecode(file(var.load_balancing_rules_file_path))
  load_balancing_rules             = { for rule in local.load_balancing_rules_file : rule.rule_name => rule }
  outbound_rules_file_exists       = fileexists(var.outbound_rules_file_path)
  outbound_rules_file              = csvdecode(file(var.outbound_rules_file_path))
  outbound_rules                   = { for rule in local.outbound_rules_file : rule.rule_name => rule }
  nat_rules_file_exists            = fileexists(var.nat_rules_file_path)
  nat_rules_file                   = csvdecode(file(var.nat_rules_file_path))
  nat_rules                        = { for rule in local.nat_rules_file : rule.rule_name => rule }
}

# Load Balancer
resource "azurerm_lb" "azlb" {
  name                = var.lb_name
  resource_group_name = var.resource_group_name
  location            = var.location
  edge_zone           = var.edge_zone
  sku                 = var.lb_sku
  sku_tier            = var.lb_sku_tier
  tags                = var.tags

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configuration
    content {
      name                                               = frontend_ip_configuration.value.name
      zones                                              = frontend_ip_configuration.value.zones
      subnet_id                                          = frontend_ip_configuration.value.subnet_id
      gateway_load_balancer_frontend_ip_configuration_id = frontend_ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
      private_ip_address                                 = var.public_load_balancer_required == false ? frontend_ip_configuration.value.private_ip_address : null
      private_ip_address_allocation                      = var.public_load_balancer_required == false ? frontend_ip_configuration.value.private_ip_address_allocation : null
      private_ip_address_version                         = var.public_load_balancer_required == false ? frontend_ip_configuration.value.private_ip_address_version : null
      public_ip_address_id                               = var.public_load_balancer_required == true ? frontend_ip_configuration.value.public_ip_address_id : null
      public_ip_prefix_id                                = var.public_load_balancer_required == true ? frontend_ip_configuration.value.public_ip_prefix_id : null
    }
  }
}

# Load Balancer Backend Address Pool
resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  for_each        = var.backend_address_pools_required == true && var.backend_address_pools != null ? var.backend_address_pools : {}
  loadbalancer_id = azurerm_lb.azlb.id
  name            = each.key
  dynamic "tunnel_interface" {
    for_each = lookup(each.value, "backend_pool_tunnel_interface") != null ? lookup(each.value, "backend_pool_tunnel_interface") : []
    content {
      identifier = tunnel_interface.value.pool_identifier
      type       = tunnel_interface.value.pool_type
      protocol   = tunnel_interface.value.pool_protocol
      port       = tunnel_interface.value.pool_port
    }
  }
}

# Load Balancer Backend Address Pool Address
resource "azurerm_lb_backend_address_pool_address" "backend_address_pool_address" {
  for_each                            = var.lb_sku != "Basic" && var.backend_address_pools_addresses_required == true && var.backend_address_pool_addresses != null ? var.backend_address_pool_addresses : {}
  name                                = each.key
  backend_address_pool_id             = azurerm_lb_backend_address_pool.backend_address_pool["${lookup(each.value, "backend_address_pool_address_backend_address_pool_id")}"].id
  backend_address_ip_configuration_id = lookup(each.value, "backend_address_pool_address_backend_address_ip_configuration_id")
  ip_address                          = lookup(each.value, "backend_address_pool_address_ip_address")
  virtual_network_id                  = lookup(each.value, "backend_address_pool_address_virtual_network_id")
}

# Load Balancer Probe
resource "azurerm_lb_probe" "probe" {
  for_each            = var.lb_sku_tier != "Global" && var.probe_required == true && var.probes != null ? var.probes : {}
  loadbalancer_id     = azurerm_lb.azlb.id
  name                = each.key
  port                = lookup(each.value, "probe_port")
  protocol            = lookup(each.value, "probe_protocol")
  request_path        = lookup(each.value, "probe_request_path")
  interval_in_seconds = lookup(each.value, "probe_interval_in_seconds")
  number_of_probes    = lookup(each.value, "number_of_probes")
}

# Load Balancing Rules
resource "azurerm_lb_rule" "rule" {
  for_each                       = var.load_balancing_rules_required == true && local.load_balancing_rules_file_exists == true ? local.load_balancing_rules : {}
  name                           = each.key
  loadbalancer_id                = azurerm_lb.azlb.id
  frontend_ip_configuration_name = lookup(each.value, "lb_rule_frontend_ip_configuration_name")
  protocol                       = lookup(each.value, "lb_rule_protocol")
  frontend_port                  = lookup(each.value, "lb_rule_frontend_port")
  backend_port                   = lookup(each.value, "lb_rule_backend_port")
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_address_pool["${lookup(each.value, "lb_rule_backend_address_pool_name")}"].id]
  probe_id                       = var.lb_sku_tier != "Global" ? azurerm_lb_probe.probe["${lookup(each.value, "lb_rule_probe_name")}"].id : null
  enable_floating_ip             = lookup(each.value, "lb_rule_enable_floating_ip")
  idle_timeout_in_minutes        = lookup(each.value, "lb_rule_idle_timeout_in_minutes")
  load_distribution              = lookup(each.value, "lb_rule_load_distribution")
  disable_outbound_snat          = lookup(each.value, "lb_rule_disable_outbound_snat")
  enable_tcp_reset               = lookup(each.value, "lb_rule_enable_tcp_reset")
}

#  Outbound Rules
resource "azurerm_lb_outbound_rule" "outbound_rule" {
  for_each                 = var.lb_sku != "Basic" && var.lb_sku_tier != "Global" && var.public_load_balancer_required == true && var.outbound_rules_required == true && local.outbound_rules_file_exists == true ? local.outbound_rules : {}
  name                     = each.key
  loadbalancer_id          = azurerm_lb.azlb.id
  backend_address_pool_id  = azurerm_lb_backend_address_pool.backend_address_pool["${lookup(each.value, "lb_outbound_rule_backend_address_pool_name")}"].id
  protocol                 = lookup(each.value, "lb_outbound_rule_protocol")
  enable_tcp_reset         = lookup(each.value, "lb_outbound_rule_enable_tcp_reset")
  allocated_outbound_ports = lookup(each.value, "lb_outbound_rule_allocated_outbound_ports")
  idle_timeout_in_minutes  = lookup(each.value, "lb_outbound_rule_idle_timeout_in_minutes")
  frontend_ip_configuration {
    name = lookup(each.value, "lb_outbound_rule_frontend_ip_configuration_name")
  }
}

# Load Balancing Nat Pools
resource "azurerm_lb_nat_pool" "nat_pool" {
  for_each                       = var.lb_sku_tier != "Global" && var.nat_pools_required == true && var.nat_pools != null ? var.nat_pools : {}
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.azlb.id
  name                           = each.key
  frontend_ip_configuration_name = lookup(each.value, "lb_nat_pool_frontend_ip_configuration_name")
  protocol                       = lookup(each.value, "lb_nat_pool_protocol")
  frontend_port_start            = lookup(each.value, "lb_nat_pool_frontend_port_start")
  frontend_port_end              = lookup(each.value, "lb_nat_pool_frontend_port_end")
  backend_port                   = lookup(each.value, "lb_nat_pool_backend_port")
  idle_timeout_in_minutes        = lookup(each.value, "lb_nat_pool_idle_timeout_in_minutes")
  floating_ip_enabled            = lookup(each.value, "lb_nat_pool_floating_ip_enabled")
  tcp_reset_enabled              = lookup(each.value, "lb_nat_pool_tcp_reset_enabled")
}

# Load Balancing Nat Rules
resource "azurerm_lb_nat_rule" "nat_rule" {
  for_each                       = var.lb_sku_tier != "Global" && var.nat_rules_required == true && local.nat_rules_file_exists == true ? local.nat_rules : {}
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.azlb.id
  name                           = each.key
  protocol                       = lookup(each.value, "lb_nat_rule_protocol")
  frontend_port                  = var.use_nat_rules_frontend_port == true ? lookup(each.value, "lb_nat_rule_frontend_port") : null
  backend_port                   = lookup(each.value, "lb_nat_rule_backend_port")
  frontend_port_start            = var.use_nat_rules_frontend_range == true ? lookup(each.value, "lb_nat_rule_frontend_port_start") : null
  frontend_port_end              = var.use_nat_rules_frontend_range == true ? lookup(each.value, "lb_nat_rule_frontend_port_end") : null
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_address_pool["${lookup(each.value, "lb_nat_rule_backend_address_pool_name")}"].id
  frontend_ip_configuration_name = lookup(each.value, "lb_nat_rule_frontend_ip_configuration_name")
  idle_timeout_in_minutes        = lookup(each.value, "lb_nat_rule_idle_timeout_in_minutes")
  enable_floating_ip             = lookup(each.value, "lb_nat_rule_enable_floating_ip")
  enable_tcp_reset               = lookup(each.value, "lb_nat_rule_enable_tcp_reset")
}








