
output "firewall_policy_rule_collection_group_id" {
  value       = azurerm_firewall_policy_rule_collection_group.fprcg.id
  description = "The ID of the Firewall Policy Rule Collection Group"
}