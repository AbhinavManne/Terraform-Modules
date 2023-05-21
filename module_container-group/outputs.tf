output "container_group_id" {
  description = " The ID of the Container Group."
  value       = azurerm_container_group.container_group.id
}

output "container_group_identity_principal_id" {
  description = "The Principal ID associated with this Managed Service Identity."
  value       = azurerm_container_group.container_group.identity.0.principal_id
}

output "container_group_identity_tenant_id" {
  description = "The Tenant ID associated with this Managed Service Identity."
  value       = azurerm_container_group.container_group.identity.0.tenant_id
}

output "container_group_ip_address" {
  description = "The IP address allocated to the container group."
  value       = azurerm_container_group.container_group.ip_address
}

output "container_group_gqdn" {
  description = " The FQDN of the container group derived from dns_name_label."
  value       = azurerm_container_group.container_group.fqdn
}
