
locals {
  private_ip_address_ip_configuration = azurerm_firewall.firewall.ip_configuration[0].private_ip_address != null ? azurerm_firewall.firewall.ip_configuration[0].private_ip_address : null
}

output "private_ip_address_ip_configuration" {
  description = "The Private IP address of the Azure Firewall."
  value       = local.private_ip_address_ip_configuration
}

output "firewall_id" {
  description = "The ID of the Firewall resource"
  value       = azurerm_firewall.firewall.id
}