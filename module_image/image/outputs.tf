
output "image_id" {
  value = azurerm_image.customimage.id
}

output "resource_group" {
  value = data.azurerm_resource_group.rg.name
}
