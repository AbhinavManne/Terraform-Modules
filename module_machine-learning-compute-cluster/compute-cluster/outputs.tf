output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}
output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}
output "resource_group_location" {
  value = data.azurerm_resource_group.rg.location
}
output "resource_id" {
  value = azurerm_machine_learning_compute_cluster.test.id
}