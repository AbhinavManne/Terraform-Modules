output "function_app_id" {
  value       = azurerm_windows_function_app.windows_function_app.id
  description = "The ID of the Windows Function App."
}

output "function_app_custom_domain_verification_id" {
  value       = azurerm_windows_function_app.windows_function_app.custom_domain_verification_id
  description = "The identifier used by App Service to perform domain ownership verification via DNS TXT record."
}

output "function_app_default_hostname" {
  value       = azurerm_windows_function_app.windows_function_app.default_hostname
  description = "The default hostname of the Windows Function App."
}

output "function_app_identity_principal_id" {
  value       = azurerm_windows_function_app.windows_function_app.identity.0.principal_id #block
  description = "The Principal ID associated with this Managed Service Identity."
}

output "function_app_identity_tenant_id" {
  value       = azurerm_windows_function_app.windows_function_app.identity.0.tenant_id #block
  description = "The Tenant ID associated with this Managed Service Identity."
}

output "function_app_kind" {
  value       = azurerm_windows_function_app.windows_function_app.kind
  description = " The Kind value for this Windows Function App"
}

output "function_app_outbound_ip_address_list" {
  value       = azurerm_windows_function_app.windows_function_app.outbound_ip_address_list
  description = " A list of outbound IP addresses."
}

output "function_app_outbound_ip_addresses" {
  value       = azurerm_windows_function_app.windows_function_app.outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses as a string."
}

output "function_app_possible_outbound_ip_address_list" {
  value       = azurerm_windows_function_app.windows_function_app.possible_outbound_ip_address_list
  description = "A list of possible outbound IP addresses, not all of which are necessarily in use. This is a superset of outbound_ip_address_list."
}

output "function_app_possible_outbound_ip_addresses" {
  value       = azurerm_windows_function_app.windows_function_app.possible_outbound_ip_addresses
  description = "A comma separated list of possible outbound IP addresses as a string."
}

output "function_app_site_credential_username" {
  value       = azurerm_windows_function_app.windows_function_app.site_credential.0.name #block
  description = "The Site Credentials Username used for publishing."
}

output "function_app_site_credential_password" {
  value       = azurerm_windows_function_app.windows_function_app.site_credential.0.password #block
  description = "The Site Credentials Password used for publishing."
}

