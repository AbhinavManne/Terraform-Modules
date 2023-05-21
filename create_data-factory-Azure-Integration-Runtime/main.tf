module "df-azure" {
  source                            = "../../modules/module_data-factory-Azure-Integration-Runtime"
  location                          = var.location
  data_factory_id                   = var.data_factory_id
  integration_runtime_configuration = var.integration_runtime_configuration
  integration_runtime_description   = var.integration_runtime_description
  integration_runtime_custom_name   = var.integration_runtime_custom_name
}