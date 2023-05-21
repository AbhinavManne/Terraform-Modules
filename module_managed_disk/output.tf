output "managed_disk_id" {
  value       = local.managed_disk_id
  description = "ID of managed disk"
}

output "disk_access_id" {
  value       = azurerm_disk_access.daccess.0.id
  description = "ID of Disk Access"
}
