output "service_plan_id" {
       value = azurerm_service_plan.service_plan.id
       description = "The ID of the Service Plan"
}

output "service_plan_name" {
       value = azurerm_service_plan.service_plan.name
       description = "The name of the Service Plan"
}