
module "eventhub_namespace" {
  source = "../../modules/event_hub-creation/module_eventhub_namespace"
  # Eventhub namespace resource
  event_hub_namespace_name      = var.event_hub_namespace_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  event_hub_sku                 = var.event_hub_sku
  event_hub_capacity            = var.event_hub_capacity
  auto_inflate_enabled          = var.auto_inflate_enabled
  dedicated_cluster_id          = var.dedicated_cluster_id
  identity                      = var.identity
  maximum_thoroughput_units     = var.maximum_thoroughput_units
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
  network_rulesets              = var.network_rulesets
  local_authentication_enabled  = var.local_authentication_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  use_customer_managed_key      = var.use_customer_managed_key
  key_vault_key_ids             = var.provide_keyvault_key_id == true && var.use_customer_managed_key ? [var.key_vault_key_id_user] : [azurerm_key_vault_key.key_vault_key[0].id]
  keyvault_id                   = var.keyvault_id
}


data "azurerm_client_config" "current" {}



resource "azurerm_key_vault_key" "key_vault_key" {
  count        = var.provide_keyvault_key_id != true ? 1 : 0
  name         = var.dynamickeyname
  key_vault_id = var.keyvault_id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]

}


module "eventhub_resource" {
  source                   = "../../modules/event_hub-creation/module_eventhub_resource"
  event_hubs               = var.event_hubs
  resource_group_name      = var.resource_group_name
  event_hub_namespace_name = var.use_same_eventhub_namespace == true ? var.event_hub_namespace_name : var.event_hub_resource_namespace_name
  depends_on = [
    module.eventhub_namespace
  ]
}



module "eventhub_namespace_disaster_recovery_partner_namespace" {
  source = "../../modules/event_hub-creation/module_eventhub_namespace"
  # Eventhub namespace resource
  event_hub_namespace_name      = var.event_hub_namespace_name_partner
  resource_group_name           = var.resource_group_name_partner
  location                      = var.location_partner
  event_hub_sku                 = var.event_hub_sku_partner
  event_hub_capacity            = var.event_hub_capacity_partner
  auto_inflate_enabled          = var.auto_inflate_enabled_partner
  dedicated_cluster_id          = var.dedicated_cluster_id_partner
  identity                      = var.identity_partner
  maximum_thoroughput_units     = var.maximum_thoroughput_units_partner
  zone_redundant                = var.zone_redundant_partner
  tags                          = var.tags_partner
  network_rulesets              = var.network_rulesets_partner
  local_authentication_enabled  = var.local_authentication_enabled_partner
  public_network_access_enabled = var.public_network_access_enabled_partner
  minimum_tls_version           = var.minimum_tls_version_partner
  use_customer_managed_key      = var.use_customer_managed_key
  key_vault_key_ids             = var.provide_keyvault_key_id == true && var.use_customer_managed_key ? [var.key_vault_key_id_user] : [azurerm_key_vault_key.key_vault_key[0].id]
  keyvault_id                   = var.keyvault_id
  depends_on = [
    module.eventhub_namespace
  ]
}

module "event_hub_disaster_recovery_config" {
  source                                                            = "../../modules/event_hub-creation/module_event_hub_disaster_recovery_config"
  create_disaster_recovery_configuration                            = var.create_disaster_recovery_configuration
  event_hub_namespace_disaster_recovery_config_name                 = var.event_hub_namespace_disaster_recovery_config_name
  event_hub_namespace_disaster_recovery_config_wait_for_replication = var.event_hub_namespace_disaster_recovery_config_wait_for_replication
  resource_group_name                                               = var.resource_group_name
  partner_eventhub_namespace_id                                     = module.eventhub_namespace_disaster_recovery_partner_namespace.eventhub_namespace_id
  event_hub_namespace_name                                          = var.event_hub_namespace_name
  event_hub_sku                                                     = var.event_hub_sku
  depends_on = [
    module.eventhub_namespace_disaster_recovery_partner_namespace
  ]
}