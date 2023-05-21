resource_group_name = "servicebusRG"

location = "East US"

servicebus_namespace_name = "servicebus-namespace001"

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

servicebus_topic_name                   = "servicebustopic001"
status                                  = "Active"
auto_delete_on_idle                     = "PT20M" //min 5 mins
default_message_ttl                     = "PT1M"
duplicate_detection_history_time_window = "PT5M"
enable_batched_operations               = true
enable_partitioning                     = false //not supported in premium
enable_express                          = false //false always for Premium
max_message_size_in_kilobytes           = 1024  //range (1024 - 102400)
max_size_in_megabytes                   = 2048  //one among [1024 2048 3072 4096 5120 10240 20480 40960 81920]
requires_duplicate_detection            = true
support_ordering                        = true

servicebus_topic_authorization_rule_name = "servicebustopicauthorizationrule001"
listen                                   = true
send                                     = false
manage                                   = false
