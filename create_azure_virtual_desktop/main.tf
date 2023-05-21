module "avd_host_pool_module" {
  source = "../../modules/module_azure_virtual_desktop/avd"

  resource_group_name              = var.resource_group_name
  tags                             = var.tags
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  host_pool_name                   = var.host_pool_name
  host_pool_type                   = var.host_pool_type
  host_pool_load_balancer_type     = var.host_pool_load_balancer_type
  application_group_name           = var.application_group_name
  application_group_type           = var.application_group_type
  application_group_friendly_name  = var.application_group_friendly_name
  application_group_description    = var.application_group_description

  vda_name                     = var.vda_name
  vda_friendly_name            = var.vda_friendly_name
  vda_description              = var.vda_description
  vda_path                     = var.vda_path
  command_line_argument_policy = var.command_line_argument_policy
  command_line_arguments       = var.command_line_arguments
  show_in_portal               = var.show_in_portal
  icon_index                   = var.icon_index
  icon_path                    = var.icon_path

  role_definition_name0 = var.role_definition_name0
  role_definition_name1 = var.role_definition_name1
  role_definition_name2 = var.role_definition_name2

  avd_workspace_name          = var.avd_workspace_name
  avd_workspace_friendly_name = var.avd_workspace_friendly_name
  avd_workspace_description   = var.avd_workspace_description

  vnet   = var.vnet
  subnet = var.subnet

  nic_name                      = var.nic_name
  ipconfig_name                 = var.ipconfig_name
  private_ip_address_allocation = var.private_ip_address_allocation

  vm_name                  = var.vm_name
  disk_size                = var.disk_size
  provision_vm_agent       = var.provision_vm_agent
  timezone                 = var.timezone
  admin_username           = var.admin_username
  admin_password           = var.admin_password
  os_disk_name             = var.os_disk_name
  caching                  = var.caching
  os_storage_account_type  = var.os_storage_account_type
  boot_storage_account_uri = var.boot_storage_account_uri
  publisher                = var.publisher
  offer                    = var.offer
  sku                      = var.sku
  os_version               = var.os_version

  vm_aad_extension_name                       = var.vm_aad_extension_name
  vm_aad_extension_publisher                  = var.vm_aad_extension_publisher
  vm_aad_extension_type                       = var.vm_aad_extension_type
  vm_aad_extension_type_handler_version       = var.vm_aad_extension_type_handler_version
  vm_aad_extension_auto_upgrade_minor_version = var.vm_aad_extension_auto_upgrade_minor_version

  vm_dsc_extension_name                       = var.vm_dsc_extension_name
  vm_dsc_extension_publisher                  = var.vm_dsc_extension_publisher
  vm_dsc_extension_type                       = var.vm_dsc_extension_type
  vm_dsc_extension_auto_upgrade_minor_version = var.vm_dsc_extension_auto_upgrade_minor_version
  vm_dsc_extension_type_handler_version       = var.vm_dsc_extension_type_handler_version

}

#---------module for Role Assignemt--------#

module "role_assignemt" {
  source                  = "../../modules/module_azure_virtual_desktop/rbac"
  resource_group_name     = module.avd_host_pool_module.resource_group_name
  resource_group_id       = module.avd_host_pool_module.resource_group_id
  resource_group_location = module.avd_host_pool_module.resource_group_location
  scope                   = module.avd_host_pool_module.resource_id
  role_definition_name    = var.role_definition

}

#---------module for logging and monitoring--------#

module "diag_monitoring" {
  source                  = "../../modules/module_azure_virtual_desktop/logging_and_monitoring"
  resource_group_name     = module.avd_host_pool_module.resource_group_name
  resource_group_id       = module.avd_host_pool_module.resource_group_id
  resource_group_location = module.avd_host_pool_module.resource_group_location
  storage_account_id      = module.avd_host_pool_module.storage_id
  resource_id             = module.avd_host_pool_module.resource_id
}
