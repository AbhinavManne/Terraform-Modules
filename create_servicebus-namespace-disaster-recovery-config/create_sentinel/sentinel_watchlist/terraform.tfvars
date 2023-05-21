#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
resource_group_name = "sentinelrg"
resource_group_location = "East US"
log_analytics_workspace = "watchlist-sentinel-law"
log_sku                 = "PerGB2018"
retention_in_days       = 30
internet_ingestion_enabled = true
internet_query_enabled     = true
reservation_capacity_in_gb_per_day = 100
daily_quota_gb = -1
tags = null

#-----DEFAULT VALUES: RESOURCE: LOG ANALYTICS SOLUTION----#
create_log_analytics_solution = true
solution_name                 = "SecurityInsights"
plan_publisher                = "Microsoft"
plan_product                  = "OMSGallery/SecurityInsights"
promotion_code                = null

#------DEFAULT VALUES: RESOURCE: SENTINEL WATCHLIST-------#
watchlist_config = {
  default_duration = "PT2H"
  description      = "Basic Sentinel Watchlist"
  display_name     = "watchlist-001"
  item_search_key  = "Name"
  labels           = ["watchlist"]
  log_analytics_workspace_id = null
  name             = "sentinel_watchlist"
}

#----DEFAULT VALUES: RESOURCE: SENTINEL WATCHLIST ITEM----#

watchlist_item_config = {
  name = "0aac6fa5-223e-49cf-9bfd-3554dc9d2b76"
  properties = {
    Name          = "watchlist-001-item-001"
    Type          = "watchlist-item"
    WatchlistName = "watchlist-001"
  }
}