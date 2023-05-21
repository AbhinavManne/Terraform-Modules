
#-------------------------------- Firewall -------------------------------------
resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  firewall_policy_id  = var.firewall_policy_id
  dns_servers         = var.dns_servers
  private_ip_ranges   = var.private_ip_ranges
  threat_intel_mode   = var.threat_intel_mode
  zones               = var.zones

  dynamic "ip_configuration" {
    for_each = var.ip_config_name != null ? [1] : []
    content {
      name                 = var.ip_config_name
      subnet_id            = var.ip_config_subnet_id                  # The Management Subnet used for the Firewall must have the name "AzureFirewallSubnet"
      public_ip_address_id = var.ip_config_public_ip_address_id
    }
  }

  dynamic "management_ip_configuration" {
    for_each = var.mgmt_ip_config_name != null ? [1] : []
    content {
      name                 = var.mgmt_ip_config_name
      subnet_id            = var.mgmt_ip_config_subnet_id             # The Management Subnet used for the Firewall must have the name "AzureFirewallManagementSubnet" and the subnet mask must be at least a /26.
      public_ip_address_id = var.mgmt_ip_config_public_ip_address_id
    }
  }

  dynamic "virtual_hub" {                                             # If virtual_hub_settting is specified, the threat_intel_mode has to be explicitly set as "".
    for_each = var.virtual_hub_id != null ? [1] : []
    content {
      virtual_hub_id  = var.virtual_hub_id
      public_ip_count = var.public_ip_count
    }
  }
}