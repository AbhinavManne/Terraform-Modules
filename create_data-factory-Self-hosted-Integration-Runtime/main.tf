module "df-self-hosted" {
  source = "../../modules/module_data-factory-Self-hosted-Integration-Runtime"

  data_factory_id                 = var.data_factory_id
  integration_runtime_description = var.integration_runtime_description
  integration_runtime_custom_name = var.integration_runtime_custom_name
  resource_id                     = var.resource_id

}