output "vmss_id" {
  value       = azurerm_windows_virtual_machine_scale_set.wvmss.id
  description = "ID of Windows Virtual Machine Scale Set."
}
