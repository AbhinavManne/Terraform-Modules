output "vmss_id" {
  value       = azurerm_linux_virtual_machine_scale_set.linux_vmss.id
  description = "ID of vmss"
}
