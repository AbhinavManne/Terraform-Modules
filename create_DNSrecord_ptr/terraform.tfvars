#----DEFAULT VALUES: DATA SOURCE: RESOURCE GROUP----#
resource_group        = "rg-003"
create_resource_group = true
location              = "East US"

#----DEFAULT VALUES: RESOURCE: DNS ZONE----#
DNSZone_name  = "mydomainref.com"
email         = "abc.ey.com"
host_name     = "ns1-03.azure-dns.com."
expire_time   = 2419200
minimum_ttl   = 300
refresh_time  = 3600
retry_time    = 300
serial_number = 1
ttl           = 3600
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Azure_DNS_ZONE"
}

#----DEFAULT VALUES: RESOURCE: DNS AAAA RECORD----#
DNSrecord_name   = "TestCname"
ptr_ttl           = 300
record           = ["yourdomain.com"]

#----DEFAULT VALUES: RESOURCE: PRIVATE DNS ZONE----#
private_dns_zone_name = "mydomain.com"