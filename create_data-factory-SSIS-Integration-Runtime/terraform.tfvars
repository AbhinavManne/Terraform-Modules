integration_runtime_custom_name = "runtime123-test"



data_factory_id = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.DataFactory/factories/dfacto123"
integration_runtime_configuration = {


  node_size                        = "Standard_D2_v3"
  number_of_nodes                  = 1
  max_parallel_executions_per_node = 16
  edition                          = "Standard"
  license_type                     = "LicenseIncluded"

}


location = "east us"

express_custom_setup = {
  command_key = {
    key1 = {
      target_name = "target123"
      user_name   = "user@dr45"
      //password= "Admin@123ty"
    }
  }
  component = {
    key2 = {
      name    = "compon345"
      license = null

    }
  }
  environment        = null
  powershell_version = 1
}

vnet_integration = {
  public_ips  = null
  subnet_id   = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"
  subnet_name = "default"
  vnet_id     = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.Network/virtualNetworks/vnet1"
}

custom_setup_script = {
  blob_container_uri = "https://stortestdf.blob.core.windows.net/blob123" # is used for installing custom vendor scripts, e.g. SAP Hana Client
  //sas_token          = "?sv=2021-06-08&ss=bfqt&srt=c&sp=rwdlacupiytfx&se=2022-10-31T19:23:09Z&st=2022-10-31T11:23:09Z&spr=https&sig=2WR612DHMtyrconi4SuLYOnkF%2F3IOWTR2xyf6lcqIkg%3D"
}
catalog_info = {
  server_endpoint     = "servdb23.database.windows.net" # Azure SQL Server endpoint for the catalog to be deployed: DB will be called SSISDB
  administrator_login = "admin123"                      # SQL Server admin login
  //administrator_password = "Admin@123" # SQL Server admin password
  pricing_tier = "GP_S_Gen5_2" # pricing tier of the SSISDB
}

package_store = {
  pack1 = {
    name                = "packstor123"
    linked_service_name = "AzureBlobStorage1"

  }
}

proxy = {
  self_hosted_integration_runtime_name = "runtime456"
  staging_storage_linked_service_name  = "AzureBlobStorage1"
  path                                 = null
}

key_vault_license = false

key_vault_password = true

linked_service_name = "AzureKeyVault1"
secret_name         = "mariadmin"
secret_version      = null
parameters          = null


linked_service_name_1 = "AzureKeyVault2"
secret_name_1         = "mariadmin"
# secret_version_1=null
# parameters_1= null

subnet_id = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"

key_vault_secret_name_primary = "commandkey"

key_vault_secret_name_secondary = "sastoken"

key_vault_secret3 = "password"

key_vault_id = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.KeyVault/vaults/kv-739"


