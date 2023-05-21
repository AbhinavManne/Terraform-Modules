locals {
  identity_principal_id = azurerm_recovery_services_vault.vault.identity[0].principal_id != null ? azurerm_recovery_services_vault.vault.identity[0].principal_id : null
  identity_tenant_id    = azurerm_recovery_services_vault.vault.identity[0].tenant_id != null ? azurerm_recovery_services_vault.vault.identity[0].tenant_id : null
  fs_policy_id          = var.enable_backup_policy_file_share ? azurerm_backup_policy_file_share.fs_policy.0.id : null
  vm_policy_id          = var.enable_backup_policy_vm ? azurerm_backup_policy_vm.vm_policy.0.id : null
  vm_workload_policy_id = var.enable_backup_policy_vm_workload ? azurerm_backup_policy_vm_workload.vm_workload_policy.0.id : null
}