resource_group_name = "common_rg"

location = "East US"
tags = {
  "contact_name" : "xyz"
  "cost_center" : 999
  "Application Name" : "Data Factory"
  project_name : "CIL"
  contact_email :"xyz"
  region : "east us"
}
identity_type = "UserAssigned"
identity_ids  = ["/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user-data-factory"]
data_factory_name = "dfacto123"
managed_virtual_network_enabled  = true
public_network_enabled           = true
customer_managed_key_id          = "https://kv-739.vault.azure.net/keys/key-df/2120b8aa74bc4f3b8bc53002167a8bb3"
customer_managed_key_identity_id = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user-data-factory"

