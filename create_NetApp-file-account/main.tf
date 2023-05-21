module "NetApp_files" {
  source = "../../modules/module_netApp-files-account"

  resource_group_name = var.resource_group_name
  location            = var.location
  netapp_account_name = var.netapp_account_name
  username            = var.username
  password            = var.password
  smb_server_name     = var.smb_server_name
  dns_servers         = var.dns_servers
  domain              = var.domain
  organizational_unit = var.organizational_unit
  tags                = var.tags
}
