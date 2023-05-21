#----DEFAULT VALUES: RESOURCE GROUP----#
create_resource_group = false
resource_group_name   = "rg-vm-cil"
location              = "Central India"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Resource Group"
}

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
log_analytics_workspace            = "lvm-workspace12300"
log_sku                            = "PerGB2018"
retention_in_days                  = 30
internet_ingestion_enabled         = true //false
internet_query_enabled             = true //false
reservation_capacity_in_gb_per_day = 100
daily_quota_gb                     = -1

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS SOLUTION----#
create_log_analytics_solution = true //false
solution_name                 = "VMInsights"
plan_publisher                = "Microsoft"
plan_product                  = "OMSGallery/VMInsights"
promotion_code                = null

