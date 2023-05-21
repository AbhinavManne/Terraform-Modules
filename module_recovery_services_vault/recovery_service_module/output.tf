

output "recovery_vault_id" {
  value       = azurerm_recovery_services_vault.vault.id
  description = "The ID of the Recovery Services Vault."
}

output "recovery_vault_name" {
  value       = azurerm_recovery_services_vault.vault.name
  description = "The Name of the Recovery Services Vault."
}

output "identity_principal_id" {
  value       = local.identity_principal_id
  description = "The Principal ID associated with this Managed Service Identity."
}

output "identity_tenant_id" {
  value       = local.identity_tenant_id
  description = "The Tenant ID associated with this Managed Service Identity."
}

output "fs_policy_id" {
  value       = local.fs_policy_id
  description = "The ID of the Azure File Share Backup Policy."
}

output "vm_policy_id" {
  value       = local.vm_policy_id
  description = "The ID of the VM Backup Policy."
}

output "vm_workload_policy_id" {
  value       = local.vm_workload_policy_id
  description = "The ID of the Azure VM Workload Backup Policy."
}