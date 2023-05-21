resource_group_name          = "trafficmanagerProfile-rg001"
resource_group_location      = "west us"
traffic_manager_profile_name = "trafficmgr001"
traffic_routing_method       = "Priority" #can be Geographic, MultiValue, Performance, Priority, Subnet or Weighted
traffic_view_enabled         = true
ttl                          = 30
protocol                     = "HTTP" #can be HTTP, HTTPS or TCP
port                         = 80
path                         = "/" #cannot be set when protocol is set to TCP
interval_in_seconds          = 30
timeout_in_seconds           = 9
tolerated_number_of_failures = 3

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "api management"
}

storage_account_name             = "api200maccount12"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"