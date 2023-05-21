output "aci_connector_linux" {
  description = "The `aci_connector_linux` block of `azurerm_kubernetes_cluster` resource."
  value       = try(azurerm_kubernetes_cluster.main.aci_connector_linux[0], null)
}

output "aci_connector_linux_enabled" {
  description = "Has `aci_connector_linux` been enabled on the `azurerm_kubernetes_cluster` resource?"
  value       = can(azurerm_kubernetes_cluster.main.aci_connector_linux[0])
}

output "admin_client_certificate" {
  description = "The `client_certificate` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block.  Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  sensitive   = true
  value       = try(azurerm_kubernetes_cluster.main.kube_admin_config[0].client_certificate, "")
}

output "aks_id" {
  description = "The `azurerm_kubernetes_cluster`'s id."
  value       = azurerm_kubernetes_cluster.main.id
}

output "azure_policy_enabled" {
  description = "The `azurerm_kubernetes_cluster`'s `azure_policy_enabled` argument. Should the Azure Policy Add-On be enabled? For more details please visit [Understand Azure Policy for Azure Kubernetes Service](https://docs.microsoft.com/en-ie/azure/governance/policy/concepts/rego-for-aks)"
  value       = azurerm_kubernetes_cluster.main.azure_policy_enabled
}



output "cluster_identity" {
  description = "The `azurerm_kubernetes_cluster`'s `identity` block."
  value       = try(azurerm_kubernetes_cluster.main.identity[0], null)
}


output "host" {
  description = "The `host` in the `azurerm_kubernetes_cluster`'s `kube_config` block. The Kubernetes cluster server host."
  sensitive   = true
  value       = azurerm_kubernetes_cluster.main.kube_config[0].host
}

output "http_application_routing_enabled" {
  description = "The `azurerm_kubernetes_cluster`'s `http_application_routing_enabled` argument. (Optional) Should HTTP Application Routing be enabled?"
  value       = azurerm_kubernetes_cluster.main.http_application_routing_enabled
}



output "ingress_application_gateway" {
  description = "The `azurerm_kubernetes_cluster`'s `ingress_application_gateway` block."
  value       = try(azurerm_kubernetes_cluster.main.ingress_application_gateway[0], null)
}

output "ingress_application_gateway_enabled" {
  description = "Has the `azurerm_kubernetes_cluster` turned on `ingress_application_gateway` block?"
  value       = can(azurerm_kubernetes_cluster.main.ingress_application_gateway[0])
}

output "key_vault_secrets_provider" {
  description = "The `azurerm_kubernetes_cluster`'s `key_vault_secrets_provider` block."
  value       = try(azurerm_kubernetes_cluster.main.key_vault_secrets_provider[0], null)
}

output "key_vault_secrets_provider_enabled" {
  description = "Has the `azurerm_kubernetes_cluster` turned on `key_vault_secrets_provider` block?"
  value       = can(azurerm_kubernetes_cluster.main.key_vault_secrets_provider[0])
}

output "kube_admin_config_raw" {
  description = "The `azurerm_kubernetes_cluster`'s `kube_admin_config_raw` argument. Raw Kubernetes config for the admin account to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled."
  sensitive   = true
  value       = azurerm_kubernetes_cluster.main.kube_admin_config_raw
}

output "kube_config_raw" {
  description = "The `azurerm_kubernetes_cluster`'s `kube_config_raw` argument. Raw Kubernetes config to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools."
  sensitive   = true
  value       = azurerm_kubernetes_cluster.main.kube_config_raw
}

output "kubelet_identity" {
  description = "The `azurerm_kubernetes_cluster`'s `kubelet_identity` block."
  value       = azurerm_kubernetes_cluster.main.kubelet_identity
}

output "location" {
  description = "The `azurerm_kubernetes_cluster`'s `location` argument. (Required) The location where the Managed Kubernetes Cluster should be created."
  value       = azurerm_kubernetes_cluster.main.location
}

output "node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.main.node_resource_group
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL that is associated with the cluster."
  value       = azurerm_kubernetes_cluster.main.oidc_issuer_url
}

output "oms_agent" {
  description = "The `azurerm_kubernetes_cluster`'s `oms_agent` argument."
  value       = try(azurerm_kubernetes_cluster.main.oms_agent[0], null)
}

output "oms_agent_enabled" {
  description = "Has the `azurerm_kubernetes_cluster` turned on `oms_agent` block?"
  value       = can(azurerm_kubernetes_cluster.main.oms_agent[0])
}

output "open_service_mesh_enabled" {
  description = "(Optional) Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about)."
  value       = azurerm_kubernetes_cluster.main.open_service_mesh_enabled
}

output "password" {
  description = "The `password` in the `azurerm_kubernetes_cluster`'s `kube_config` block. A password or token used to authenticate to the Kubernetes cluster."
  sensitive   = true
  value       = azurerm_kubernetes_cluster.main.kube_config[0].password
}

output "username" {
  description = "The `username` in the `azurerm_kubernetes_cluster`'s `kube_config` block. A username used to authenticate to the Kubernetes cluster."
  sensitive   = true
  value       = azurerm_kubernetes_cluster.main.kube_config[0].username
}