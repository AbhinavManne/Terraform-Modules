locals {
  mxrecordList                  = csvdecode(file("mx_record.csv"))
  srvrecordList                 = csvdecode(file("srv_record.csv"))
  txtrecordList                 = csvdecode(file("txt_record.csv"))
  dns_a_record_id               = var.a_records != null ? azurerm_private_dns_a_record.a_records.0.id : null
  dns_aaaa_record_id            = var.aaaa_records != null ? azurerm_private_dns_aaaa_record.aaaa_records.0.id : null
  dns_cname_record_id           = var.cname_records != null ? azurerm_private_dns_cname_record.cname_records.0.id : null
  dns_mx_record_id              = var.mx_record != null ? azurerm_private_dns_mx_record.mx_record.0.id : null
  dns_ptr_record_id             = var.ptr_record != null ? azurerm_private_dns_ptr_record.ptr_record.0.id : null
  dns_srv_record_id             = var.srv_records != null ? azurerm_private_dns_srv_record.srv_records.0.id : null
  dns_txt_record_id             = var.txt_record != null ? azurerm_private_dns_txt_record.txt_record.0.id : null
  private_dns_zone_vnet_link_id = var.add_pdns_vnet_link ? azurerm_private_dns_zone_virtual_network_link.pdns_vnetlink.0.id : null
}
