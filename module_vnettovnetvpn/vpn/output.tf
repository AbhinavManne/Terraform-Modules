output "vnet1_to_vnet2_id" {
  value       = azurerm_virtual_network_gateway_connection.vnettovnetvpn.id
  description = "vnet1 to vnet2 connection"
}
output "vnet2_to_vnet1_id" {
  value       = azurerm_virtual_network_gateway_connection.vnettovnetvpn.id
  description = "vnet2 to vnet1 connection"
}
