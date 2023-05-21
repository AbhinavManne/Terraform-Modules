
output "availability_set_id" {
  description = "Availability set ID"
  value       = azurerm_availability_set.avail_set.id
}

output "proximity_placement_group_id" {
  description = "proximity placement group id"
  value       = local.proximity_placement_group_id
}