resource_group_name                = "spoke-rg"
resource_group_location            = "West Europe"
virtual_network_name               = "spoke-vnet"
virtual_network_address_space      = ["10.0.0.0/22"]
appservice_subnet_address_prefixes = ["10.0.1.0/27"]
database_subnet_address_prefixes   = ["10.0.0.0/27"]
recovery_vault_name                = "recoveryvault-010a"
keyvault_name                      = "keyvault-010aw"
storage_account_name               = "aneerstoracc1"
storage_account_tier               = "Standard"
storage_account_replication_type   = "GRS"
log_workspace_name                 = "log-ws-001"
sku                                = "PerGB2018"
retention_in_days                  = 30
app_service_plan_name              = "asp-236824612899"
app_service_plan_sku_tier          = "Basic"
app_service_plan_sku_size          = "B1"
app_service_name                   = "webappserrrvice001"



public_ip_name = "publicipPoC"

windows_vm_name       = "AppServerVM"
ip_configuration_name = "internalspokeIP"

name                         = "eymkcosmosdb-accounta"
create_resource_group        = "false"
location                     = "West Europe"
cassandra_keyspace           = "firstfromManoj"
cassandra_table              = "firstfrommk"
sqlserver_name               = "sqldbserver01a"
database_name                = "demomssqldb"
sql_database_edition         = "Standard"
sqldb_service_objective_name = "S1"

enable_threat_detection_policy  = "false"
log_retention_days              = 30
enable_vulnerability_assessment = "false"

tags = {
  tag1 = "value1"
}


location_short  = "frc"
client_name     = "test"
environment     = "test"
stack           = "ci"
databases_names = ["users", "documents"]

elastic_pool_max_size = "50"
administrator_login   = "manojtest"
#administrator_password="manojtest"
enable_logs_to_storage = "true"
#logs_storage_account_id="/subscriptions/aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee/resourceGroups/rg-test/providers/Microsoft.Storage/storageAccounts/storageaccountname"
#enable_logs_to_log_analytics="true"
#logs_log_analytics_workspace_id="/subscriptions/aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee/resourceGroups/rg-test/providers/Microsoft.OperationalInsights/workspaces/my-log-analytics-workspace"
#enable_advanced_data_security="true"
#enable_advanced_data_security_admin_emails="true"
#advanced_data_security_additional_emails=["admin@fr.clara.net", "devops@fr.clara.net"]