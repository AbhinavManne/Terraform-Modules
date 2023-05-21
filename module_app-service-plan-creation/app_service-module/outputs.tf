
output "app_service_plan_id" {
    value = azurerm_app_service_plan.example.id
}

output "storage_account_id" {
    value = azurerm_storage_account.example.id
}

output "app_service_plan_name" {
    value = azurerm_app_service_plan.example.name
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