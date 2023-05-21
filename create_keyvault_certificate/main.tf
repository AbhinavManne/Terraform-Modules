#Reference to module that provisions an Azure Keyvault certificate
module "keyvault_certificate" {
  source               = "../../modules/module_keyvault_certificate"
  keyvault_certificate = var.keyvault_certificate
  keyvault_id          = var.keyvault_id
  generate_certificate = var.generate_certificate
  certificate          = var.certificate
  certificate_policy   = var.certificate_policy
  tags                 = var.tags
}
