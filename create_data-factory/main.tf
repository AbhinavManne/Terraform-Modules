module "data_factory" {
  source                           = "../../modules/module_data-factory/data-factory"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  data_factory_name                = var.data_factory_name
  tags                             = var.tags
  identity_type                    = var.identity_type
  identity_ids                     = var.identity_ids
  github_configuration             = var.github_configuration
  vsts_configuration               = var.vsts_configuration
  global_parameter                 = var.global_parameter
  managed_virtual_network_enabled  = var.managed_virtual_network_enabled
  public_network_enabled           = var.public_network_enabled
  customer_managed_key_id          = var.customer_managed_key_id
  customer_managed_key_identity_id = var.customer_managed_key_identity_id
}


