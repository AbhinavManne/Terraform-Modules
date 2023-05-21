#------------- Virtual Network --------------#
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  bgp_community = var.bgp_community!=null ? var.bgp_community :null
  edge_zone = var.edge_zone!=null ? var.edge_zone:null
  flow_timeout_in_minutes = var.enable_flow_timeout_in_minutes? var.flow_timeout_in_minutes:null

  dynamic ddos_protection_plan {
    for_each =  var.enable_ddos_protection_plan ? [1]:[]
    content{
      enable = var.enable_ddos_protection_plan
      id     = var.id_of_existing_ddos == null && var.enable_ddos_protection_plan ? azurerm_network_ddos_protection_plan.ddos_plan[0].id : var.id_of_existing_ddos 
    }
  }
  tags                = var.tags
}

#------------ DDoS Protection ----------------#

resource "azurerm_network_ddos_protection_plan" "ddos_plan" {
  count = var.id_of_existing_ddos == null && var.enable_ddos_protection_plan ? 1 : 0
  name                = var.network_ddos_protection_plan
  location            = var.location
  resource_group_name = var.resource_group_name

}
 
#------------ Firewall Subnet ------------------#

resource "azurerm_subnet" "fw_snet" {
  count                = var.firewall_subnet_address_prefix != null ? 1 : 0
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.firewall_subnet_address_prefix
  service_endpoints    = var.firewall_service_endpoints
}

#----------- Gateway Subnet ----------------------#

resource "azurerm_subnet" "gw_snet" {
  count                = var.gateway_subnet_address_prefix != null ? 1 : 0
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.gateway_subnet_address_prefix
  service_endpoints    = var.gateway_service_endpoints
}

#------------ General Subnet ----------------------#

resource "azurerm_subnet" "subnet" {
  count                                          = length(var.subnet_names)
  name                                           = var.subnet_names[count.index]
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = [var.subnet_prefixes[count.index]]
  service_endpoints                              = lookup(var.subnet_service_endpoints, var.subnet_names[count.index], null)                               
  private_endpoint_network_policies_enabled = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoint_policy_ids = var.service_endpoint_policy_ids
  dynamic "delegation" {
    for_each = lookup(var.subnet_delegation, var.subnet_names[count.index], {})
    content {
      name = delegation.key
      service_delegation {
        name    = lookup(delegation.value, "service_name")
        actions = lookup(delegation.value, "service_actions", [])
      }
    }
  }
}

locals {
  subnet_name_and_subnet_id = {
    for index, subnet in azurerm_subnet.subnet :
    subnet.name => subnet.id
  }
}

#---------NSG Association--------------#

resource "azurerm_subnet_network_security_group_association" "nsgas" {
  for_each                  = var.map_of_subnet_name_and_nsg_id !=null ? var.map_of_subnet_name_and_nsg_id : {}
  subnet_id                 = local.subnet_name_and_subnet_id[each.key]
  network_security_group_id = each.value
}

#---------Route Table Association--------------#

resource "azurerm_subnet_route_table_association" "route_table_as" {
  for_each = var.map_of_subnet_name_and_route_table_id !=null ? var.map_of_subnet_name_and_route_table_id : {}
  subnet_id      = local.subnet_name_and_subnet_id[each.key]
  route_table_id = each.value
}


resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

locals {
  final_subnet_id = var.firewall_subnet_address_prefix != null ? azurerm_subnet.fw-snet.0.id : ""
}



resource "azurerm_firewall" "firewall" {
  count               = var.firewall_subnet_address_prefix != null ? 1 : 0
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  threat_intel_mode   = var.threat_intel_mode
  sku_name            = var.firewall_sku_name
  sku_tier            = var.firewall_sku_tier

  ip_configuration {
    name                 = var.ip_config
    subnet_id            = local.final_subnet_id
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

