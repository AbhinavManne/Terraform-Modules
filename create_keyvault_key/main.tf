#Reference to module that provisions an Azure Keyvault Key
module "keyvault_key" {
  source                 = "../../modules/module_keyvault_key"
  keyvault_key           = var.keyvault_key
  keyvault_id            = var.keyvault_id
  key_type               = var.key_type
  key_size               = var.key_size
  key_curve              = var.key_curve
  key_not_before_date    = var.key_not_before_date
  key_expiration_date    = var.key_expiration_date
  key_opts               = var.key_opts
  tags                   = var.tags
}
