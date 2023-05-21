
output "synapse_workspace_id" {
  description = "synapse workpsace ID "
  value = azurerm_synapse_workspace.azsynapse.id
}

output "azurerm_synapse_sql_pool" {
  description = "The ID of the synapse sql pool"
  value       = [for l in azurerm_synapse_sql_pool.sqlpool : l.id]

}

output "synapse_spark_pool" {
  description="spark pool ID"
  value = [for k in azurerm_synapse_spark_pool.sparkpool : k.id]
}