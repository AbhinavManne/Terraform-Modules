module "azurerm_netapp_snapshot" {
  source                  = "../../modules/module_netapp-files-snapshot"
  location                = var.location
  resource_group_name     = var.resource_group_name
  virtual_network_name    = var.virtual_network_name
  subnet_name             = var.subnet_name
  account_name            = var.account_name
  pool_name               = var.pool_name
  service_level           = var.service_level
  size_in_tb              = var.size_in_tb
  security_style          = var.security_style
  volume_path             = var.volume_path
  volume_name             = var.volume_name
  storage_quota_in_gb     = var.storage_quota_in_gb
  address_space           = var.address_space
  address_prefixes        = var.address_prefixes
  delegation_name         = var.delegation_name
  service_delegation_name = var.service_delegation_name
  actions                 = var.actions
  netapp_snapshot         = var.netapp_snapshot
  tags                    =var.tags
}
