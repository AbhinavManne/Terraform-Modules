output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.private_dns.id
  description = "The Private DNS Zone ID"
}

output "dns_a_record_id" {
  value       = local.dns_a_record_id
  description = "The Private DNS A Record ID"
}

output "dns_aaaa_record_id" {
  value       = local.dns_aaaa_record_id
  description = "The Private DNS AAAA Record ID"
}

output "dns_cname_record_id" {
  value       = local.dns_cname_record_id
  description = "The Private DNS CNAME Record ID"
}

output "dns_mx_record_id" {
  value       = local.dns_mx_record_id
  description = "The Private DNS MX Record ID"
}

output "dns_ptr_record_id" {
  value       = local.dns_ptr_record_id
  description = "The Private DNS PTR Record ID"
}

output "dns_srv_record_id" {
  value       = local.dns_srv_record_id
  description = "The Private DNS SRV Record ID"
}

output "dns_txt_record_id" {
  value       = local.dns_txt_record_id
  description = "The Private DNS TXT Record ID"
}

output "private_dns_zone_vnet_link_id" {
  value       = local.private_dns_zone_vnet_link_id
  description = "The ID of the Private DNS Zone Virtual Network Link"
}
