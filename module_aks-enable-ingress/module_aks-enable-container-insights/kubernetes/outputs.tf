output "resource_id" {
  value = azurerm_kubernetes_cluster.default.id
}

output "resource_group" {
  value = local.resource_group_name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.0.id #Use data source if creating resources in existing RG-> data.azurerm_resource_group.rg.0.id
}

output "resource_group_location" {
  value = local.location
}