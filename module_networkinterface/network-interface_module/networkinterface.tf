
#-------------------------------------------------Network Interface---------------------------------------------------------
resource "azurerm_network_interface" "nic" {
  name                          = var.network_interface_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  dns_servers                   = var.dns_servers
  edge_zone                     = var.edge_zone
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label
  tags                          = var.tags

  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      name                                               = lookup(ip_configuration.value, "ip_configuration_name")
      gateway_load_balancer_frontend_ip_configuration_id = lookup(ip_configuration.value, "gateway_load_balancer_frontend_ip_configuration_id", null)
      subnet_id                                          = lookup(ip_configuration.value, "subnet_id", null)
      private_ip_address_version                         = lookup(ip_configuration.value, "private_ip_address_version", "IPv4")
      private_ip_address_allocation                      = lookup(ip_configuration.value, "private_ip_address_allocation")
      public_ip_address_id                               = lookup(ip_configuration.value, "public_ip_address_id", null)
      primary                                            = lookup(ip_configuration.value, "primary", false)
      private_ip_address                                 = lookup(ip_configuration.value, "private_ip_address", null)
    }
  }
}
