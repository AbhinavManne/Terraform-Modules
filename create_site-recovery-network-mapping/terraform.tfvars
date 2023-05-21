resource_group_name1     = "my_demorg1"
resource_group_location1 = "West US"

resource_group_name2     = "my_demorg2"
resource_group_location2 = "East US"

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "create_site recovery protection container mapping"
}
storage_account_name             = "sitereplicationvm09ac"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"

recovery_services_vault_name = "recoveryvault91319"
recovery_services_vault_sku  = "Standard"

site_recovery_fabric_name1 = "primary-fabric"

site_recovery_fabric_name2 = "secondary-fabric"

virtual_network_name1          = "demo_network1"
virtual_network_address_space1 = ["192.168.1.0/24"]

virtual_network_name2          = "demo_network2"
virtual_network_address_space2 = ["192.168.2.0/24"]

recovery_network_mapping_name = "recovery-network-mapping-1"

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