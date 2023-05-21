output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
  description = "The virtual NetworkConfiguration ID."
}
output "firewall_subnet_id" {
  value = azurerm_subnet.fw-snet[0].id
  description = "The firewall subnet ID."
}
output "general_subnets_ids" {
  value = azurerm_subnet.subnet[*].id
  description = "List of general subnet ID"
}
output "filewall_id" {
  value = azurerm_firewall.firewall[0].id
  description = "The ID of the Azure Firewall."
}