output "resource_id" {
  value = azurerm_shared_image_version.example.id
}

output "resource_group_name" {
  value = local.resource_group_name
}