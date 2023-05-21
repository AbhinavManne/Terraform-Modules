output "sa" {
  value       = azurerm_storage_account.sa
  sensitive   = true
  description = "The Storage Account object."
}
output "resource_group" {
  description = "The name of the resource group in which resources are created"
  value       = data.azurerm_resource_group.rgrp.name
}

output "resource_group_id" {

  value = data.azurerm_resource_group.rgrp.id

}


output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = data.azurerm_resource_group.rgrp.location
}
output "storage_name" {
  value       = azurerm_storage_account.sa.name
  description = "The name of the Storage Account."
}

output "storage_id" {
  value       = azurerm_storage_account.sa.id
  description = "The ID of the Storage Account."
}

output "primary_access_key" {
  value       = azurerm_storage_account.sa.primary_access_key
  sensitive   = true
  description = "The primary access key for the storage account."
}

output "secondary_access_key" {
  value       = azurerm_storage_account.sa.secondary_access_key
  sensitive   = true
  description = "The secondary access key for the storage account."
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.sa.primary_blob_endpoint
  description = "The endpoint URL for blob storage in the primary location."
}

output "primary_blob_host" {
  value       = azurerm_storage_account.sa.primary_blob_host
  description = "The endpoint host for blob storage in the primary location."
}

output "secondary_blob_endpoint" {
  value       = azurerm_storage_account.sa.secondary_blob_endpoint
  description = "The endpoint URL for blob storage in the secondary location."
}

output "secondary_blob_host" {
  value       = azurerm_storage_account.sa.secondary_blob_host
  description = "The endpoint host for blob storage in the secondary location."
}

output "primary_queue_endpoint" {
  value       = azurerm_storage_account.sa.primary_queue_endpoint
  description = "The endpoint URL for queue storage in the primary location."
}

output "secondary_queue_endpoint" {
  value       = azurerm_storage_account.sa.secondary_queue_endpoint
  description = "The endpoint URL for queue storage in the secondary location."
}

output "primary_table_endpoint" {
  value       = azurerm_storage_account.sa.primary_table_endpoint
  description = "The endpoint URL for table storage in the primary location."
}

output "secondary_table_endpoint" {
  value       = azurerm_storage_account.sa.secondary_table_endpoint
  description = "The endpoint URL for table storage in the secondary location."
}

output "primary_file_endpoint" {
  value       = azurerm_storage_account.sa.primary_file_endpoint
  description = "The endpoint URL for file storage in the primary location."
}

output "secondary_file_endpoint" {
  value       = azurerm_storage_account.sa.secondary_file_endpoint
  description = "The endpoint URL for file storage in the secondary location."
}

output "primary_dfs_endpoint" {
  value       = azurerm_storage_account.sa.primary_dfs_endpoint
  description = "The endpoint URL for DFS storage in the primary location."
}

output "secondary_dfs_endpoint" {
  value       = azurerm_storage_account.sa.secondary_dfs_endpoint
  description = "The endpoint URL for DFS storage in the secondary location."
}

output "primary_web_endpoint" {
  value       = azurerm_storage_account.sa.primary_web_endpoint
  description = "The endpoint URL for web storage in the primary location."
}

output "secondary_web_endpoint" {
  value       = azurerm_storage_account.sa.secondary_web_endpoint
  description = "The endpoint URL for web storage in the secondary location."
}

output "primary_connection_string" {
  value       = azurerm_storage_account.sa.primary_connection_string
  sensitive   = true
  description = "The connection string associated with the primary location."
}

output "secondary_connection_string" {
  value       = azurerm_storage_account.sa.secondary_connection_string
  sensitive   = true
  description = "The connection string associated with the secondary location."
}

output "primary_blob_connection_string" {
  value       = azurerm_storage_account.sa.primary_blob_connection_string
  sensitive   = true
  description = "The connection string associated with the primary blob location."
}

output "secondary_blob_connection_string" {
  value       = azurerm_storage_account.sa.secondary_blob_connection_string
  sensitive   = true
  description = "The connection string associated with the secondary blob location."
}
