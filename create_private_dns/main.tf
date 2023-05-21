#Reference to Private DNS module
module "private_dns" {
  source                          = "../../modules/module_private_dns"
  private_dns_name                = var.private_dns_name
  tags                            = var.tags
  resource_group_name             = var.resource_group_name
  soa_record                      = var.soa_record
  a_records                       = var.a_records
  aaaa_records                    = var.aaaa_records
  cname_records                   = var.cname_records
  mx_record                       = var.mx_record
  ptr_record                      = var.ptr_record
  srv_records                     = var.srv_records
  txt_record                      = var.txt_record
  add_pdns_vnet_link              = var.add_pdns_vnet_link
  private_dns_zone_vnet_link_name = var.private_dns_zone_vnet_link_name
  virtual_network_id              = var.virtual_network_id
  registration_enabled            = var.registration_enabled
}
