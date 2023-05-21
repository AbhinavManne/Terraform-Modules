
output "frontdoor_firewall_policy_id" {
  value       = azurerm_frontdoor_firewall_policy.ffp.id
  description = "ID of the frontdoor firewall policy"
}

output "frontdoor_firewall_policy_location" {
  value       = azurerm_frontdoor_firewall_policy.ffp.location
  description = "location of the frontdoor firewall policy"
}

output "frontend_endpoint_ids" {
  value       = azurerm_frontdoor_firewall_policy.ffp.frontend_endpoint_ids
  description = "The Frontend Endpoints associated with this Front Door Web Application Firewall policy."
}