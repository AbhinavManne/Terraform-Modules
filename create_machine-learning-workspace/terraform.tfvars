resource_group="rg"
application_insights_name="workspace-ex-ai"
key_vault_name="workspacekv12"
storage_account_name="storagel1"
workspace_name="workspace153"
identity_type="SystemAssigned"
private_endpoint_name           = "example-endpoint"
private_service_connection_name = "example-privateserviceconnection-sql"
subresource_names               = ["amlworkspace"]
sql_server_name                 = "sqlserv230"
virtual_network_name            = "vnet1"
subnet_name                     = "snet1"
address_prefixes = ["10.1.1.0/24"]
is_manual_connection = true
request_message="PL"
tags = {

  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "ML"
}