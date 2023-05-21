
############################# Event Hub Resource ###################################
resource "azurerm_eventhub" "event_hub" {
  for_each            = var.event_hubs
  name                = lookup(each.value, "event_hub_name")
  namespace_name      = var.event_hub_namespace_name
  resource_group_name = var.resource_group_name
  partition_count     = lookup(each.value, "partition_count")
  message_retention   = lookup(each.value, "message_retention")
  status              = lookup(each.value, "status")
  dynamic "capture_description" {
    for_each = lookup(each.value, "capture_description", [])
    content {
      enabled             = lookup(capture_description.value, "enabled")
      encoding            = lookup(capture_description.value, "encoding")
      interval_in_seconds = lookup(capture_description.value, "interval_in_seconds")
      size_limit_in_bytes = lookup(capture_description.value, "size_limit_in_bytes")
      skip_empty_archives = lookup(capture_description.value, "skip_empty_archives")
      dynamic "destination" {
        for_each = lookup(capture_description.value, "destination", [])
        content {
          name                = lookup(destination.value, "name")
          archive_name_format = lookup(destination.value, "archive_name_format")
          blob_container_name = lookup(destination.value, "blob_container_name")
          storage_account_id  = lookup(destination.value, "storage_account_id")
        }
      }
    }
  }
}