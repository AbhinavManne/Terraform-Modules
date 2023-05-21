#-----------------------------------------REOURCE GROUP-----------------------------------------------#
resource_group_name = "profiletesting"

#------------------------------------------------TAGS--------------------------------------------------#

tags = {
  Application_name = "traffic_profile_test"
  Cost_center      = 123
  Contact_name     = "ACB"
}

#-----------------------------traffif manager profile--------------------------------------#
profile_name                 = "manageprotest"
ttl                          = 50
protocol                     = "HTTP"
port                         = 80
path                         = "/"
interval_in_seconds          = 30
timeout_in_seconds           = 10
tolerated_number_of_failures = 3
max_return                   = 7
traffic_routing_method       = "MultiValue"

#------------------------------exteral endpoints ------------------------------------------#
external_endpoint_name       = "example-endpoint"
weight                       = 1
target                       = "40.76.173.173"
endpoint_location            = "East US"
enabled                      = true
priority                     = 100
custom_header = [ {
    
    name  =  "null"
    value =  "null"
    
  } ]

subnet = [ {
    
        first = "10.1.0.0"
        last  = "10.1.0.10"
        scope = 24
 } ]

geo_mappings = ["WORLD"]
    


    

    
