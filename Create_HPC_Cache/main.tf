module "hpc_cache" {
  source = "../modules/module_hpc_cache"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  cache_size_in_gb    = var.cache_size_in_gb
  subnet_id           = var.subnet_id
  sku_name            = var.sku_name
  mtu                 = var.mtu
  default_access_policy_config = [{
      access_rule_config = [{
              scope                   = var.default_access_policy_config.0.access_rule_config.0.scope
              access                  = var.default_access_policy_config.0.access_rule_config.0.access
              filter                  = var.default_access_policy_config.0.access_rule_config.0.filter
              suid_enabled            = var.default_access_policy_config.0.access_rule_config.0.suid_enabled
              submount_access_enabled = var.default_access_policy_config.0.access_rule_config.0.submount_access_enabled
              root_squash_enabled     = var.default_access_policy_config.0.access_rule_config.0.root_squash_enabled
              anonymous_uid           = var.default_access_policy_config.0.access_rule_config.0.anonymous_uid
              anonymous_gid           = var.default_access_policy_config.0.access_rule_config.0.anonymous_gid 
     }]
   }]
  ntp_server           = var.ntp_server
  dns_config = [{
             servers       = var.dns_config.0.servers
             search_domain = var.dns_config.0.search_domain
   }]
  
  directory_active_directory_config = [{
             dns_primary_ip       = var.directory_active_directory_config.0.dns_primary_ip
             domain_name          = var.directory_active_directory_config.0.domain_name
             cache_netbios_name   = var.directory_active_directory_config.0.cache_netbios_name
             domain_netbios_name  = var.directory_active_directory_config.0.domain_netbios_name
             username             = var.directory_active_directory_config.0.username 
             password             = var.directory_active_directory_config.0.password
             dns_secondary_ip     = var.directory_active_directory_config.0.dns_secondary_ip
   }] 
   
  identity_config = [{
         type           = var.identity_config.0.type
         identity_ids   = var.identity_config.0.identity_ids
  }]  
  key_vault_key_id                            = var.key_vault_key_id
  automatically_rotate_key_to_latest_enabled  = var.automatically_rotate_key_to_latest_enabled
  tags                                        = var.tags

}