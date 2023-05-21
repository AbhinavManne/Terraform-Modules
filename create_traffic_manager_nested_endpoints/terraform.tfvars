#----------------------------------nested endpoint------------------------------------------#
name                       = "nestedpointend1"
minimum_child_endpoints    = 1
weight                     = 5
enabled                    = false
endpoint_location          = "east us"
custom_header = [ {
    
    name  =  "null"
    value =  "null"
    
  } ]

 subnet = [ {
    
        first = "10.1.0.0"
        last  = "10.1.0.10"
        scope = 24
 } ]

minimum_required_child_endpoints_ipv4 = 3
minimum_required_child_endpoints_ipv6 = 2
priority                              = 100
geo_mappings                          = ["WORLD"]

#------------------------------------parent profile------------------------------------------#
    
resource_group_name          = "profiletesting"
parent_profile_name          = "manageprotest"
ttl                          = 50
protocol                     = "TCP"
port                         = 80
path                         = "/"
interval_in_seconds          = 30
timeout_in_seconds           = 10
tolerated_number_of_failures = 3
max_return                   = 7
traffic_routing_method       = "Subnet"

#------------------------------------nested profile-------------------------------------------#

nested_profile_name           = "managepronested"
nested_traffic_routing_method = "Priority"
nested_ttl                    =  60                   
nested_protocol               = "TCP"                     
nested_port                   = 443                          
nested_path                   = "/"
nested_max_return             = 7

#------------------------------------------------TAGS--------------------------------------------------#

tags = {
  Application_name = "traffic_profile_test"
  Cost_center      = 123
  Contact_name     = "ACB"
}

