resource_group_name = "servicebusRG"

location = "East US"

servicebus_namespace_name = "servicebus-namespace001"

public_network_access_enabled_for_namespace = false

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

subnet_name_for_network_config = "servicebusnamespacenetworkruleSUBNET"

virtual_network_name_for_network_config = "servicebusnamespacenetworkruleVNET"

subnet_resource_group_name = "servicebusRG"

default_action = "Deny"

public_network_access_enabled_for_namespace_network_rule_set = false

trusted_services_allowed = true

ip_rules = ["40.76.168.206"]

/*network_rules_config = [ {
  ignore_missing_vnet_service_endpoint = false
  subnet_id = module.servicebus_namespace_network_rule_set.servicebus_namespace_network_rule_set_subnet_id
} ]*/