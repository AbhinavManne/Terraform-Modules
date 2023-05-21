
output "network_interface_id" {
  value       = azurerm_network_interface.nic.id
  description = "The ID of the Network Interface"
}

output "network_interface_name" {
  value       = azurerm_network_interface.nic.name
  description = "The Name of the Network Interface"
}

output "nic_applied_dns_servers" {
  value       = azurerm_network_interface.nic.applied_dns_servers
  description = "dns servers"
}

output "nic_internal_domain_name_suffix" {
  value       = azurerm_network_interface.nic.internal_domain_name_suffix
  description = "internal domain name suffix of the network interface"
}

output "nic_mac_address" {
  value       = azurerm_network_interface.nic.mac_address
  description = "The Media Access Control (MAC) Address of the Network Interface."
}

output "nic_private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "The first private IP address of the network interface."
}

output "nic_private_ip_addresses" {
  value       = azurerm_network_interface.nic.private_ip_addresses
  description = "The private IP addresses of the network interface."
}
