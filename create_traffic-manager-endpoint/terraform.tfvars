resource_group_name     = "example-resources"
resource_group_location = "West Europe"

public_ip1_name              = "example-public-ip000"
public_ip1_allocation_method = "Static"
domain_name_label            = "example-public-ip000"

public_ip2_name              = "example-public-ip100"
public_ip2_allocation_method = "Static"
domain_name_label1           = "example-public-ip100"

traffic_manager_profile_name = "example-profile200"
traffic_routing_method       = "Weighted"
traffic_view_enabled         = true

dns_config_name = "exampofile1"

azure_end_point1_name = "example-endpoint000"
azure_end_point2_name = "example-endpoint100"

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "traffic manager"
}

storage_account_name             = "traffic1000account"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"