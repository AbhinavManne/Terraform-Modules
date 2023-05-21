#OUTPUT VALUES TO BE USED BY OTHER MODULES

output "resource_id" {
  value = azurerm_automation_account.example.id
}

output "resource_group" {
  value = local.resource_group_name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.0.id #data.azurerm_resource_group.rg.0.id #use data source id if create_resource value in tfvars is false
}

output "resource_group_location" {
  value = local.location
}