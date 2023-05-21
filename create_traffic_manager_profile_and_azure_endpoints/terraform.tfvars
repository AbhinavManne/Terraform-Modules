#-----------------------------------------REOURCE GROUP-----------------------------------------------#
resource_group_name = "profiletesting"
resource_group_location = "East US"

#------------------------------------------------TAGS--------------------------------------------------#

tags = {
  Application_name = "traffic_profile_test"
  Cost_center      = 123
  Contact_name     = "ACB"
}

#--------------------------------------TRAFFIC MANAGER PROFILE-------------------------------------------#

traffic_manager_profile_name = "manageprotest"
ttl                          = 50
protocol                     = "HTTP"
port                         = 80
path                         = "/"
interval_in_seconds          = 30
timeout_in_seconds           = 10
tolerated_number_of_failures = 3
profile_status               = "Disabled"
traffic_view_enabled         = false
max_return                   = 7
expected_status_code_ranges  = ["100-101"]
custom_header = [{
  name  = "null"
  value = "null"
}]
traffic_routing_method        = "Subnet"

# -----------------------------------azure end points -------------------------------------- #

azure_end_point_name   = "traffic_end_point"
azure_end_point_weight = 1
enabled                = false
priority               = 1
geo_mappings           = ["WORLD"]
subnet = [{

  first = "10.1.0.0"
  last  = "10.1.0.10"
  scope = 24
}]

target_resource_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/profiletesting/providers/Microsoft.Network/publicIPAddresses/test-public-ip"

endpoint_custom_header = [{
  name  = "null"
  value = "null"
}]