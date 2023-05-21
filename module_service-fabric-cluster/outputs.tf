output "resource_id" {
  value       = azurerm_service_fabric_cluster.sfcluster.id
  description = "ID of the Service Fabric Cluster"
}

output "cluster_endpoint" {
  value       = azurerm_service_fabric_cluster.sfcluster.cluster_endpoint
  description = "The Cluster Endpoint for this Service Fabric Cluster"
}