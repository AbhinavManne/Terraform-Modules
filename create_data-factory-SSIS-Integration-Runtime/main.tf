data "azurerm_key_vault_secret" "secret1" {
  name         = var.key_vault_secret_name_primary
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "secret2" {
  name         = var.key_vault_secret_name_secondary
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "secret3" {
  name         = var.key_vault_secret3
  key_vault_id = var.key_vault_id

}
module "df-azure-ssis" {
  source = "../../modules/module_data-factory-SSIS-Integration-Runtime"

  data_factory_id                   = var.data_factory_id
  location                          = var.location
  integration_runtime_description   = var.integration_runtime_description
  integration_runtime_custom_name   = var.integration_runtime_custom_name
  integration_runtime_configuration = var.integration_runtime_configuration
  catalog_info                      = var.catalog_info
  custom_setup_script               = var.custom_setup_script
  express_custom_setup              = var.express_custom_setup
  package_store                     = var.package_store
  proxy                             = var.proxy
  vnet_integration                  = var.vnet_integration
  key_vault_password                = var.key_vault_password
  key_vault_license                 = var.key_vault_license
  linked_service_name               = var.linked_service_name
  secret_name                       = var.secret_name
  secret_version                    = var.secret_version
  parameters                        = var.parameters
  linked_service_name_1             = var.linked_service_name_1
  secret_name_1                     = var.secret_name_1
  secret_version_1                  = var.secret_version_1
  parameters_1                      = var.parameters_1
  subnet_id                         = var.subnet_id
  password                          = data.azurerm_key_vault_secret.secret1.value
  administrator_password            = data.azurerm_key_vault_secret.secret3.value
  sas_token                         = data.azurerm_key_vault_secret.secret2.value
  # key_vault_secret_name_primary     = var.key_vault_secret_name_primary
  # key_vault_secret_name_secondary   = var.key_vault_secret_name_secondary
  # key_vault_id                      = var.key_vault_id

}