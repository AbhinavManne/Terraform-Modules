module "resource_lock_module" {
  source             = "../../modules/module_resource-lock"
  resource_lock_name = var.resource_lock_name
  resource_id        = var.resource_id
  lock_level         = var.lock_level
  notes              = var.notes
}