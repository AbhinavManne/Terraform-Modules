resource_group_name   = "rg"
create_resource_group = false
location              = "east us"
public_ip_name        = "pip123"
allocation_method     = "Static"

#properties below are optional 
sku                     = "Standard" #defaults to Basic
ip_version              = "IPv4"     #defaults to IP4, Only dynamic for IPv6, Supported arguments are IPv4 or IPv6, NOT Both
domain_name_label       = "testip-dns"
idle_timeout_in_minutes = null #TCP timeout for idle connections. The value can be set between 4 and 30 minutes.
zones                   = ["1"]
reverse_fqdn            = null
public_ip_prefix_id     = null #ID of public_ip_prefix 
### refer to the prefix and check sku types are same in IP and prefix
edge_zone = null
sku_tier  = "Regional"
ip_tags   = null #The value of the IP tag(resource) associated with the public IP. 



tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Public IP"
}

