output "watchlist_id" {
  value       = azurerm_sentinel_watchlist.watchlist.id
  description = "The ID of the Sentinel Watchlist."
}

output "watchlist_item_id" {
  value       = azurerm_sentinel_watchlist_item.watchlist_item.id
  description = "The ID of the Sentinel Watchlist Item."
}
