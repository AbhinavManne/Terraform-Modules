
resource "azurerm_management_lock" "mgmtlock" {
  name       = var.resource_lock_name
  scope      = var.resource_id
  lock_level = var.lock_level
  notes      = var.notes
}