
output "app_service_id" {
    value = azurerm_app_service.example.id
}

output "storage_account_id" {
    value = azurerm_storage_account.example.id
}

output "app_service_name" {
    value = azurerm_app_service.example.name
}

output "resource_group" {
    value = azurerm_resource_group.example.name
}

output "resource_group_id" {
    value = azurerm_resource_group.example.id
}

output "resource_group_location" {
    value = azurerm_resource_group.example.location
}