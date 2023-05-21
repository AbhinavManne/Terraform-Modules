
resource_group_name     = "example-resources200"
resource_group_location = "West Europe"

storage_account_name             = "api200maccoukjnt"
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
subresource_names               = ["Gateway"]

api_managment_name = "example-apim000"
publisher_name     = "My Company"
publisher_email    = "company@terraform.io"
sku_name           = "Developer_1"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "api management"
}

application_insights_name = "tf-test-appinsights"
application_insights_type = "other"

api_managment_logger_name = "example-logger"

api_managment_api_name         = "example-api200"
api_managment_api_revision     = "1"
api_managment_api_display_name = "example-api200"
api_managment_api_path         = "example"
api_managment_api_protocols    = ["https"]

key_vault_name     = "examplekeyvau2rtwetmhorh"
key_vault_sku_name = "standard"

key_vault_certificate_name = "example-cert200"

api_managment_certificate_name = "example-cert2"

role_definition_for_key_vault = "Contributor"

