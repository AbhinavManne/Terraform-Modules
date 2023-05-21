
output "NAT_gateway_id" {
  description = "The resource ID of the MySQL Server"
  value       = azurerm_nat_gateway.natgateway.id
}

output "NAT_gateway_guid" {
  description = "The resource ID of the MySQL Server"
  value       = azurerm_nat_gateway.natgateway.resource_guid
}

output "public_ip_address_id" {
  description = "The ID of the Public IP which this NAT Gateway which should be connected to"
  value       = azurerm_nat_gateway_public_ip_association.main.public_ip_address_id
}

output "public_ip_prefix_id" {
  description = "The (Terraform specific) ID of the Association between the NAT Gateway and the Public IP Prefix"
  value       = azurerm_nat_gateway_public_ip_prefix_association.main.id
}
