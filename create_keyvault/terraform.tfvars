#-------------------------------------DEFAULT VALUES OF KEYVAULT_MODULE--------------------------------#

#----DEFAULT VALUES: RESOURCE: KEYVAULT----#
keyvault_name                   = "kv-testing-kv"
location                        = "eastus"
resource_group_name             = "kv-testing"
//tenant_id                       = ""//
kv_sku                          = "standard"
enabled_for_deployment          = true//false
enabled_for_disk_encryption     = true//false
enabled_for_template_deployment = true //false
enable_rbac_authorization       = false
purge_protection_enabled        = false
public_network_access_enabled   = true
soft_delete_retention_days      = 7
default_action                  = "Allow"
bypass                          = "AzureServices"
ip_rules                        = ["1.1.1.1", "2.2.2.2"]
virtual_network_subnet_ids      = null//["/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/rg-vm-cil/providers/Microsoft.Network/virtualNetworks/kv-testing/subnets/default"] //
contact_email                   = "Aabya.Singh@gds.ey.com"
contact_name                    = "ABC"
contact_phone                   = "91#######"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Azure_Keyvault"
}

#----DEFAULT VALUES: RESOURCE: KEYVAULT ACCESS POLICY----#
enable_access_policy             =  true//false
//object_id                        = ""//
application_id                   = null
keyvault_key_permissions         = ["Backup","Create","Decrypt","Delete","Encrypt","Get","Import","List","Purge","Recover","Restore","Sign","UnwrapKey","Update","Verify","WrapKey","Release","Rotate","GetRotationPolicy","SetRotationPolicy"]
keyvault_secret_permissions      = ["Backup","Delete","Get","List","Purge","Recover","Restore","Set"]
keyvault_certificate_permissions = ["Backup","Create","Delete","DeleteIssuers","Get","GetIssuers","Import","List","ListIssuers","ManageContacts","ManageIssuers","Purge","Recover","Restore","SetIssuers","Update"]
keyvault_storage_permissions     = ["Backup","Delete","DeleteSAS","Get","GetSAS","List","ListSAS","Purge","Recover","RegenerateKey","Restore","Set","SetSAS","Update"]  

#----DEFAULT VALUES: MODULE: KEYVAULT ACCESS POLICY----#
create_keyvault_access_policies  = true //false
policies = {
  "key1" = {
    certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_permissions         = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
    object_id               = "86852476-732a-459f-bff1-01d99174bfcb"
    secret_permissions      = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
    storage_permissions     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
    tenant_id               = "5b973f99-77df-4beb-b27d-aa0c70b8482c"
    application_id          = null
  }
  # "key2" = {
  #   certificate_permissions = ["Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
  #   key_permissions         = ["Backup", "Create", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
  #   object_id               = "eb5d48dd-6e37-435a-83fa-c8d42697dab7"
  #   secret_permissions      = ["Backup", "Delete", "Get", "Purge", "Recover", "Restore", "Set"]
  #   storage_permissions     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
  #   tenant_id               = "5b973f99-77df-4beb-b27d-aa0c70b8482c"
  #   application_id          = null
  # }
  //multiple access policies...
}

#----DEFAULT VALUES: PRIVATE ENDPOINT MODULE----#
create_private-endpoint         = true
private_endpoint_name           = "kv-pep-testing"
private_service_connection_name = "kv-privateserviceconnection-testing"
subresource_names               = ["vault"]
is_manual_connection            = false
request_message                 = null
private_connection_resource_id  = null
subnet_id                       = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/kv-testing/providers/Microsoft.Network/virtualNetworks/kv-testing-vnet/subnets/kv-testing-subnet"
private_dns_zone_group            = null
private_connection_resource_alias = null

#----DEFAULT VALUES: ALERT MODULE----#
action_group_name        = "test-action-groupkv"
short_name               = "actiongz"
action_group_rule_name   = "test-z"
scope_type               = "Resource"
activity_log_alert_name  = "test-activitylogalertkv"
resource_group_id        = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/kv-testing"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "test-metricalertkv"
storage_account_id       = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/kv-testing/providers/Microsoft.Storage/storageAccounts/kvtestingstracc"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]

#----DEFAULT VALUES: DIAGNOSTIC MODULE----#
enable_log_monitoring          = true
diag_name                      = "kv-diag"
log_analytics_workspace_id     = null
log_analytics_destination_type = null #"Dedicated"
eventhub_name                  = null
eventhub_authorization_rule_id = null
log_enabled                    = true
log_retention_policy_enabled   = true
log_retention_days             = 7
metric_retention_policy_enabled= true
metric_retention_days          = 7