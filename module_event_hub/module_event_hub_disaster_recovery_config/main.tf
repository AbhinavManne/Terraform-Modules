# ########################  Event Hub Namespace Disaster Recovery Config #############################

resource "azurerm_eventhub_namespace_disaster_recovery_config" "event_hub_namespace_disaster_recovery_config" {
  count               = var.event_hub_sku != "Basic" && var.create_disaster_recovery_configuration == true ? 1 : 0
  name                = var.event_hub_namespace_disaster_recovery_config_name
  resource_group_name = var.resource_group_name
  namespace_name      = var.event_hub_namespace_name
  # wait_for_replication = var.event_hub_namespace_disaster_recovery_config_wait_for_replication // Can be deprecated
  partner_namespace_id = var.partner_eventhub_namespace_id
}


