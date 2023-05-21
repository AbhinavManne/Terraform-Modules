####-----------------Resource group ----------------####

create_resource_group = false
resource_group_name   = "rg"
location              = "east us"



#----------------------------------------------------#
#----------------------------key vault secret --------------------------#

key_vault_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/keyvault123gh"
key_vault_secret_name_primary = "passwordprimary"

#------------------------- MySQL Server and Database settings--------------------------
mysqlserver_name = "mysqldbsrv0101"


sku_name      = "GP_Gen5_16"
storage_mb    = 5120
mysql_version = "5.7"
# default admin user `sqladmin` and can be specified as per the choice here
# by default random password created by this module. required password can be specified here
admin_username = "sqladmin1"


# Storage Profile and other optional arguments
auto_grow_enabled                 = true
backup_retention_days             = 7
geo_redundant_backup_enabled      = false
infrastructure_encryption_enabled = false
public_network_access_enabled     = true
ssl_enforcement_enabled           = true
ssl_minimal_tls_version_enforced  = "TLS1_2"
create_mode                       = "Default"

# MySQL Server Parameters
# For more information: https://docs.microsoft.com/en-us/azure/mysql/concepts-server-parameters
mysql_configuration = {
  interactive_timeout = "600"
}



# AD administrator for an Azure MySQL server
# Allows you to set a user or group as the AD administrator for an Azure SQL server
ad_admin_login_name = null



# Firewall Rules to allow azure and external clients and specific Ip address/ranges. 
firewall_rules = {
  access-to-azure = {
    start_ip_address = "0.0.0.0"
    end_ip_address   = "0.0.0.0"
  },
  desktop-ip = {
    start_ip_address = "49.204.228.223"
    end_ip_address   = "49.204.228.223"
  }
}





# Tags for Azure Resources

tags = {
  Appname        = "mysql"
  Contact_person = "Nikita"
  Cost_Center    = "999"
}


//key_vault_key_id = "https://keyvau677.vault.azure.net/keys/key123/aa6940c8561f4318b7d546572f381598"

//subnet_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"
tenant_id = null
object_id = null

mysql_database = {
  "db1" = {
    charset   = "utf8"
    collation = "utf8_unicode_ci"
  }
}

# threat_detection_policy = {

#       enabled                    = true
#       disabled_alerts            = ["Sql_Injection"]
#       email_account_admins       = true
#       email_addresses            = ["user@example.com", "firstname.lastname@example.com"]
#       retention_days             = 7
#       storage_account_access_key = null
#       storage_endpoint           = null

#   }

threat_detection_policy = {

  enabled                    = true
  disabled_alerts            = ["Sql_Injection"]
  email_account_admins       = true
  email_addresses            = ["user@example.com", "firstname.lastname@example.com"]
  retention_days             = 7
  storage_account_access_key = null
  storage_endpoint           = null
}

storage_account_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/stormysqlffe34"
################################ Private Endpoint #############################

create_private-endpoint           = true
private_endpoint_name             = "example-endpoint-stor22"
private_service_connection_name   = "example-privateserviceconnection-stor"
subresource_names                 = ["mysqlServer"] // for synapse
is_manual_connection              = false
request_message                   = null
private_dns_zone_group            = null
private_connection_resource_alias = null
subnet_id                         = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"

