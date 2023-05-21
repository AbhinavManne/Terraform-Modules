
output "image-gallery_id" {
  value = azurerm_shared_image_gallery.example.id
}

output "image-gallery_name" {
  value = azurerm_shared_image_gallery.example.name
}

output "resource_group" {
  value = local.resource_group_name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.0.id
}

output "resource_group_location" {
  value = local.location
}