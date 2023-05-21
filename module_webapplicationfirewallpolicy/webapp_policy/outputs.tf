output "web_application_firewall_policy_id" {
  value       = azurerm_web_application_firewall_policy.wafp.id
  description = "The ID of the web application firewall policy"
}
