name                  = "testcache"
resource_group_name   = "common_rg"
location              = "East US"
cache_size_in_gb      = 3072
subnet_id             = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.Network/virtualNetworks/testcache/subnets/default"   
sku_name              = "Standard_2G"
mtu                   = 1500

default_access_policy_config = [{
     access_rule_config = [{            
            scope                   = "default"
            access                  = "no"
            filter                  = null
            suid_enabled            = false
            submount_access_enabled = false 
            root_squash_enabled     = false
            anonymous_uid           = null
            anonymous_gid           = null
     }]
}]    

ntp_server = "time.windows.com"
dns_config = [{
     servers       = ["1.1.1.1","1.1.2.2","3.3.4.4"]
     search_domain = null
}]   


directory_active_directory_config = [{
      dns_primary_ip      = null
      domain_name         = null
      cache_netbios_name  = null
      domain_netbios_name = null
      username            = ""
      password            = ""
      dns_secondary_ip    = null

   }]


identity_config = [{
        type                    = "UserAssigned"
        identity_ids            = null
      }]  

key_vault_key_id                           = null
automatically_rotate_key_to_latest_enabled = null
tags = {
  contact_name  = "sharath"
  contact_email = "Sharath.Kumar.R.N@gds.ey.com"
  project       = "CIL"
  region        = "East US"
}



//Requirement resources created
//1)subnet
