
module "keyvault_access_policies" {
  for_each = var.policies
  source      = "../../modules/module_keyvault_access_policies"
  keyvault_id             = var.keyvault_id
  tenant_id               = lookup(each.value, "tenant_id")
  object_id               = lookup(each.value, "object_id")
  application_id          = lookup(each.value, "application_id")  
  key_permissions         = lookup(each.value, "key_permissions")
  secret_permissions      = lookup(each.value, "secret_permissions")
  certificate_permissions = lookup(each.value, "certificate_permissions")
  storage_permissions     = lookup(each.value, "storage_permissions")

}