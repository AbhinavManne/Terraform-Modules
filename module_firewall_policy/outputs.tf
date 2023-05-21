output "firewall_policy_id" {
  value       = azurerm_firewall_policy.fp.id
  description = "ID of the  firewall policy"
}

output "firewall_policy_child_policies" {
  value       = azurerm_firewall_policy.fp.child_policies
  description = "A list of reference to child Firewall Policies of this Firewall Policy."
}

output "firewall_policy_firewalls" {
  value       = azurerm_firewall_policy.fp.firewalls
  description = "A list of references to Azure Firewalls that this Firewall Policy is associated with."
}

output "firewall_policy_rule_collection_groups" {
  value       = azurerm_firewall_policy.fp.rule_collection_groups
  description = "A list of references to Firewall Policy Rule Collection Groups that belongs to this Firewall Policy."
}