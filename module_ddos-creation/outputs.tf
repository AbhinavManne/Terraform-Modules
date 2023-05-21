output "ddos_name" {
  value = azurerm_network_ddos_protection_plan.ddos.name
  description = "DDos Plan value"
}
output "ddos_id" {
  value       = azurerm_network_ddos_protection_plan.ddos.id
  description = "DDos Plan id"
}