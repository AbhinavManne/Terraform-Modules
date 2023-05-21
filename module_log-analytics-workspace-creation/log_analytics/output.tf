output "log_id" {
  value       = azurerm_log_analytics_workspace.log_work.id
  description = "ID of the Log Analytics"
}

output "log_workspace_id" {
  value       = azurerm_log_analytics_workspace.log_work.workspace_id
  description = "ID of the Log Analytics Workspace"
}

output "log_name" {
  value       = azurerm_log_analytics_workspace.log_work.name
  description = "Name of the Log Analytics Workspace"
}

output "log_primary_shared_key" {
  value       = azurerm_log_analytics_workspace.log_work.primary_shared_key
  description = "Primary shared key of the Log Analytics Workspace"
}

output "log_secondary_shared_key" {
  value       = azurerm_log_analytics_workspace.log_work.secondary_shared_key
  description = "Secondary shared key of the Log Analytics Workspace"
}
 
output "log_analytics_solutions" {
  value       = try(azurerm_log_analytics_solution.log_sol.0.id,null)
  description = "ID of the log analytics solution"
}