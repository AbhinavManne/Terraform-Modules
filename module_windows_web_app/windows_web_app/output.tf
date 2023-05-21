output "web_app_id" {
  value       = azurerm_windows_web_app.windows_web_app.id
  description = "The ID of the Windows Web App."
}

output "web_app_custom_domain_verification_id" {
  value       = azurerm_windows_web_app.windows_web_app.custom_domain_verification_id
  description = "The identifier used by App Service to perform domain ownership verification via DNS TXT record."
}

output "web_app_default_hostname" {
  value       = azurerm_windows_web_app.windows_web_app.default_hostname
  description = "The default hostname of the Windows Web App."
}

output "web_app_identity_principal_id" {
  value       = azurerm_windows_web_app.windows_web_app.identity.0.principal_id #block
  description = "The Principal ID associated with this Managed Service Identity."
}

output "web_app_identity_tenant_id" {
  value       = azurerm_windows_web_app.windows_web_app.identity.0.tenant_id #block
  description = "The Tenant ID associated with this Managed Service Identity."
}

output "web_app_kind" {
  value       = azurerm_windows_web_app.windows_web_app.kind
  description = " The Kind value for this Windows Web App"
}

output "web_app_outbound_ip_address_list" {
  value       = azurerm_windows_web_app.windows_web_app.outbound_ip_address_list
  description = " A list of outbound IP addresses."
}

output "web_app_outbound_ip_addresses" {
  value       = azurerm_windows_web_app.windows_web_app.outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses as a string."
}

output "web_app_possible_outbound_ip_address_list" {
  value       = azurerm_windows_web_app.windows_web_app.possible_outbound_ip_address_list
  description = "A comma separated list of possible outbound IP addresses as a string."
}

output "web_app_site_credential_username" {
  value       = azurerm_windows_web_app.windows_web_app.site_credential.0.name #block
  description = "The Site Credentials Username used for publishing."
}

output "web_app_site_credential_password" {
  value       = azurerm_windows_web_app.windows_web_app.site_credential.0.password #block
  description = "The Site Credentials Password used for publishing."
}

