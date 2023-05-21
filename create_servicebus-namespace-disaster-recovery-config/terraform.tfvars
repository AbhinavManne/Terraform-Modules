resource_group_name = "servicebusRG"

location = "East US"

servicebus_namespace_disaster_recovery_config_name = "servicebus-namespace-disaster-recovery001"

primary_servicebus_namespace_name = "primary-servicebus-namespace001"

secondary_servicebus_namespace_name = "secondary-servicebus-namespace001"

primary_servicebus_namespace_location = "East US"

secondary_servicebus_namespace_location = "West US"

sku = "Premium"

capacity = 2

tags = {
  "contact_name"  = "Mitali Ghoshal"
  "contact_email" = "mitali.ghoshal@gds.ey.com"
  "project_name"  = "CIL"
  "region"        = "East US"
}

identity_config = [{
  identity_ids = ["/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/servicebusRG/providers/Microsoft.ManagedIdentity/userAssignedIdentities/servicebusmguami"]
  type         = "UserAssigned"
}]

customer_managed_key_config = [{
  identity_id                       = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/servicebusRG/providers/Microsoft.ManagedIdentity/userAssignedIdentities/servicebusmguami"
  infrastructure_encryption_enabled = false
  key_vault_key_id                  = "https://servicebuskeyvault01.vault.azure.net/keys/servicebuskeyvault01key/b5e2618c6eaa4f8b887a0b2cd021ed2c"
}]
