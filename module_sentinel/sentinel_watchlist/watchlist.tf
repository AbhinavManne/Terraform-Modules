resource "azurerm_sentinel_watchlist" "watchlist" {
  name                       = var.watchlist_config.name
  log_analytics_workspace_id = var.watchlist_config.log_analytics_workspace_id
  display_name               = var.watchlist_config.display_name
  item_search_key            = var.watchlist_config.item_search_key
  default_duration           = var.watchlist_config.default_duration
  description                = var.watchlist_config.description
  labels                     = var.watchlist_config.labels
}

resource "azurerm_sentinel_watchlist_item" "watchlist_item" {
  name         = var.watchlist_item_config.name
  watchlist_id = azurerm_sentinel_watchlist.watchlist.id
  properties   = var.watchlist_item_config.properties
}
