
#----DEFAULT VALUES: RESOURCE GROUP----#
create_resource_group            = false
resource_group_name              = "rg-vm-cil"
location                         = "Central India"
tags = {
  Application_name = "RG"
  Cost_Center      = 999
  Contact_name     = "xyz"
}

#----DEFAULT VALUES: AVAILABILITY SET----#
availability_set             = "ciltest-setsprox"
platform_fault_domain_count  = "3"
platform_update_domain_count = "5"
managed                      = "true"
enable_proximity_placement_group = true //false
proximity_placement_group_name   = "prox_group"