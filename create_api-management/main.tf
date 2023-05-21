#Reference to the module that manages an API within an API Management Service.
module "api_management_module" {
  source = "../../modules/module_api_management/api managment"

  #Resource Group
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  tags = var.tags

  #Storage Group
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  #Virtual Network
  virtual_network = var.virtual_network
  address_space   = var.address_space
  #Subnet
  enable_private_endpoint                        = var.enable_private_endpoint
  subnet_name                                    = var.subnet_name
  private_subnet_address_prefix                  = var.private_subnet_address_prefix
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies

  #Private Endpoint
  private_endpoint_name           = var.private_endpoint_name
  private_service_connection_name = var.private_service_connection_name
  is_manual_connection            = var.is_manual_connection
  subresource_names               = var.subresource_names

  #Api Managment
  api_managment_name = var.api_managment_name
  publisher_name     = var.publisher_name
  publisher_email    = var.publisher_email
  sku_name           = var.sku_name

  #Application Insights
  application_insights_name = var.application_insights_name
  application_insights_type = var.application_insights_type

  #Api Managment Logger
  api_managment_logger_name = var.api_managment_logger_name

  #Api Managment Api Name
  api_managment_api_name         = var.api_managment_api_name
  api_managment_api_revision     = var.api_managment_api_revision
  api_managment_api_display_name = var.api_managment_api_display_name
  api_managment_api_path         = var.api_managment_api_path
  api_managment_api_protocols    = var.api_managment_api_protocols

  #key Vault
  key_vault_name     = var.key_vault_name
  key_vault_sku_name = var.key_vault_sku_name

  #key Vault Certificate
  key_vault_certificate_name = var.key_vault_certificate_name

  #Api Managment Certificate
  api_managment_certificate_name = var.api_managment_certificate_name

  #Role Defication
  role_definition_for_key_vault = var.role_definition_for_key_vault
}

#-------------------------------MODULE FOR ROLE ASSIGNMENT----------------------------------------------#

module "role_assignemt" {
  source                  = "../../modules/module_api_management/rbac"
  resource_group_name     = module.api_management_module.resource_group_name
  resource_group_id       = module.api_management_module.resource_group_id
  resource_group_location = module.api_management_module.resource_group_location
  scope                   = module.api_management_module.resource_id
  role_definition_name    = var.role_definition

}

#--------------------------------MODULE FOR LOGGING AND MONITORING--------------------------------------#

module "diag_monitoring" {
  source                  = "../../modules/module_api_management/logging_and_monitoring"
  resource_group_name     = module.api_management_module.resource_group_name
  resource_group_id       = module.api_management_module.resource_group_id
  resource_group_location = module.api_management_module.resource_group_location
  storage_account_id      = module.api_management_module.storage_id
  resource_id             = module.api_management_module.resource_id
}
