#Reference to module that provisions an Azure Keyvault secret
module "keyvault_secret" {
  source                 = "../../modules/module_keyvault_secret"
  keyvault_secret        = var.keyvault_secret
  keyvault_id            = var.keyvault_id
  keyvault_secret_value  = var.keyvault_secret_value
  secret_content_type    = var.secret_content_type
  secret_not_before_date = var.secret_not_before_date
  secret_expiration_date = var.secret_expiration_date
  tags                   = var.tags
}
