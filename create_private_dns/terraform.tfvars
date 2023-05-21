private_dns_name = "mydomain.com"
tags = {
  contact_email = "aabya.singh@gds.ey.com"
  contact_name  = "Aabya"
  project_name  = "Azure_CIL"
  region        = "East US"
}
resource_group_name = "testing-private-dns"
soa_record = {
  email        = "abc.ey.com"
  expire_time  = null
  minimum_ttl  = null
  refresh_time = null
  retry_time   = null
  ttl          = null
}
a_records = {
  name    = "testa_records"
  records = ["10.0.180.17"]
  ttl     = 300
}
aaaa_records = {
  name    = "testaaaa_records"
  records = ["fd5d:70bc:930e:d008:0000:0000:0000:7334", "fd5d:70bc:930e:d008::7335"]
  ttl     = 300
}
cname_records = {
  name    = "testcname_records"
  records = "contoso.com"
  ttl     = 300
}
mx_record = {
  name = "testmx_records"
  ttl = 300
}
ptr_record = {
  name = "testptr_record"
  records = ["test.example.com"]
  ttl = 300
}
srv_records = {
  name = "testsrv_record"
  ttl = 300
}
txt_record = {
  name = "testtxt_record"
  ttl = 300
}
add_pdns_vnet_link              = true
private_dns_zone_vnet_link_name = "testpdnvnetlinnk"
virtual_network_id              = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/testing-private-dns/providers/Microsoft.Network/virtualNetworks/vnetpdns"
registration_enabled            = true
