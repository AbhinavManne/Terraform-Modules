# Eventhub Namespace

event_hub_namespace_name = "cil-automated-event-hub-namespace"
resource_group_name      = "azure-cil-resource-group"
location                 = "Central India"
event_hub_sku            = "Premium"
event_hub_capacity       = 2
auto_inflate_enabled     = true
dedicated_cluster_id     = null
identity = [{
  type = "SystemAssigned"
}]
maximum_thoroughput_units = 10
zone_redundant            = false
tags = {
  Contact_name     = "xyz"
  Cost_Center      = 999
  Application_name = "event hub"
}
network_rulesets = [{
  default_action                 = "Deny",
  public_network_access          = true,
  trusted_service_access_enabled = true,
  virtual_network_rule = [
    {
      subnet_id                                       = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-resource-group/providers/Microsoft.Network/virtualNetworks/vneteventhub/subnets/eventhubsubnet",
      ignore_missing_virtual_network_service_endpoint = true
    }
  ]
  ip_rule = [{
    action  = "Allow",
    ip_mask = "4.224.81.86"
    }
  ]
}]

local_authentication_enabled  = false
public_network_access_enabled = true
minimum_tls_version           = "1.2"

# Eventhub customer managed key
use_customer_managed_key = true


keyvault_id = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-resource-group/providers/Microsoft.KeyVault/vaults/eventhubkeyvault0001"


provide_keyvault_key_id = false

# key_vault_key_id_user = "https://cilmainkeyvault.vault.azure.net/keys/eventhubnamespacekey/4fcbb21c6f184bf78222f609532306b9"

key_vault_key_id_user = null

dynamickeyname = "eventhubcmktest"

# dynamickeyname = null


# Eventhub 
event_hubs = {
  "event-hub-1" = {
    capture_description = [{
      destination = [{
        archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
        blob_container_name = "eventhubcontainer"
        name                = "EventHubArchive.AzureBlockBlob"
        storage_account_id  = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-resource-group/providers/Microsoft.Storage/storageAccounts/storagegroup2001"
      }]
      enabled             = true
      encoding            = "Avro"
      interval_in_seconds = 300
      size_limit_in_bytes = 314572800
      skip_empty_archives = false
    }]
    event_hub_name    = "cil-automated-event-hub-test"
    message_retention = 1
    partition_count   = 2
    status            = "Active"
  }
}


event_hub_resource_namespace_name = "cil-automated-event-hub-namespace"

use_same_eventhub_namespace = true



# Event Hub Namespace Disaster Recovery Partner Namespace

event_hub_namespace_name_partner = "disaster-recovery-config-eventhub-namespace"
resource_group_name_partner      = "azure-cil-event-hub-replication-rg"
location_partner                 = "East US"
event_hub_sku_partner            = "Standard"
event_hub_capacity_partner       = 2
auto_inflate_enabled_partner     = true
dedicated_cluster_id_partner     = null
identity_partner = [{
  type = "SystemAssigned"
}]
maximum_thoroughput_units_partner = 10
zone_redundant_partner            = false
tags_partner = {
  Contact_name     = "xyz"
  Cost_Center      = 999
  Application_name = "event hub"
}
network_rulesets_partner = [{
  default_action                 = "Deny",
  public_network_access          = true,
  trusted_service_access_enabled = true,
  virtual_network_rule = [
    {
      subnet_id                                       = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-resource-group/providers/Microsoft.Network/virtualNetworks/vneteventhub/subnets/eventhubsubnet",
      ignore_missing_virtual_network_service_endpoint = true
    }
  ]
  ip_rule = [{
    action  = "Allow",
    ip_mask = "4.224.81.86"
    }
  ]
}]

local_authentication_enabled_partner  = false
public_network_access_enabled_partner = true
minimum_tls_version_partner           = "1.2"



# ############################# Event Hub Namespace Disaster Recovery Config ###############################
create_disaster_recovery_configuration                            = false
event_hub_namespace_disaster_recovery_config_name                 = "disaster-recovery-config-test"
event_hub_namespace_disaster_recovery_config_wait_for_replication = false