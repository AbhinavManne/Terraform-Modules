recovery_services_vault_name = "recoveryvault7089"
recovery_services_vault_sku  = "Standard"

site_recovery_replication_policy_name = "policy"

resource_group_name   = "my_rg"
location              = "westus"
create_resource_group = true
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Site Recovery Replication Policy"
}
storage_account_name             = "sitereplicationac"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"

#----DEFAULT VALUES: RESOURCE: VIRTUAL NETWORK----#

virtual_network = "vnet-sec"
address_space   = ["10.1.0.0/16"]
#----DEFAULT VALUES: RESOURCE: SUBNET----#
enable_private_endpoint                        = true
subnet_name                                    = "snet-pep"
private_subnet_address_prefix                  = ["10.1.1.0/24"]
enforce_private_link_endpoint_network_policies = true
#----DEFAULT VALUES: RESOURCE: PRIVATE ENDPOINT----#
private_endpoint_name           = "pepabby"
private_service_connection_name = "functionappprivatelink"
is_manual_connection            = false
subresource_names               = ["AzureSiteRecovery"]