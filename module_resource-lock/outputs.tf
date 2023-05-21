output "resource_lock_id" {
  value       = azurerm_management_lock.mgmtlock.id
  description = "The ID of the resource lock"
}