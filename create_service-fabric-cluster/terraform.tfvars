
resource_group_name = "cil-sfc-testing"
location            = "South Central US"

#----DEFAULT VALUES: RESOURCE: SERVICE FABRIC CLUSTER----#
service_fabric_cluster_name                                  = "testing-servicefabric"
reliability_level                                            = "Bronze" #Possible values include None, Bronze, Silver, Gold, Platinum
management_endpoint                                          = "https://example:80"
upgrade_mode                                                 = "Automatic" //"Manual" #Possible values are Automatic or Manual
vm_image                                                     = "Windows"
cluster_code_version                                         = "9.0.1048.9590"
add_on_features                                              = ["DnsService"]
service_fabric_zonal_upgrade_mode                            = "Parallel" //"Hierarchical" //Possible values are Hierarchical or Parallel.
vmss_zonal_upgrade_mode                                      = "Parallel" //"Hierarchical" //Possible values are Hierarchical or Parallel.
cluster_application_id                                       = null           
client_application_id                                        = null           
certificate_common_name                                      = null           //"common_sfc" //conflicts with certificate block
certificate_issuer_thumbprint                                = null           //"8D08671D7308C27560143DD16AF1378E0DB019A7"     
certificate_common_names_x509_store_name                     = "My"
certificate_thumbprint                                       = "8D08671D7308C27560143DD16AF1378E0DB019A7" //
certificate_thumbprint_secondary                             = ""                                         //
certificate_x509_store_name                                  = "My"
reverse_proxy_certificate_thumbprint                         = null 
reverse_proxy_certificate_thumbprint_secondary               = null 
reverse_proxy_certificate_x509_store_name                    = "My"
reverse_proxy_certificate_common_names                       = null 
reverse_proxy_certificate_common_names_x509_store_name       = "My"
reverse_proxy_certificate_certificate_issuer_thumbprint      = null                                              
client_certificate_thumbprint                                = null                                              
client_certificate_common_name                               = null                                              
client_certificate_common_name_certificate_issuer_thumbprint = null                                              
client_certificate_common_name_is_admin                      = null                                              
storage_account_name                                         = "sflogsavcsf4919"                                 //
protected_account_key_name                                   = "StorageAccountKey1"                              //
storage_account_blob_endpoint                                = "https://sflogsavcsf4919.blob.core.windows.net/"  //
storage_account_queue_endpoint                               = "https://sflogsavcsf4919.queue.core.windows.net/" //
storage_account_table_endpoint                               = "https://sflogsavcsf4919.table.core.windows.net/" //

fabric_settings = [{
  name = "Security"
  parameters = {
    "ClusterProtectionLevel" = "EncryptAndSign"
  }
}]

service_fabric_cluster_nodes = [{
  application_ports = [{
    end_port   = 30000
    start_port = 20000
  }]
  capacities           = null
  client_endpoint_port = 2020
  durability_level     = "Bronze"
  ephemeral_ports = [{
    end_port   = 65534
    start_port = 49152
  }]
  http_endpoint_port          = 80
  instance_count              = 3
  is_primary                  = true
  is_stateless                = false
  multiple_availability_zones = null
  name                        = "first"
  placement_properties        = null
  reverse_proxy_endpoint_port = null
  },
  {
    application_ports = [{
      end_port   = 30000
      start_port = 20000
    }]
    capacities           = null
    client_endpoint_port = 2020
    durability_level     = "Bronze"
    ephemeral_ports = [{
      end_port   = 65534
      start_port = 49152
    }]
    http_endpoint_port          = 80
    instance_count              = 3
    is_primary                  = true
    is_stateless                = false
    multiple_availability_zones = null
    name                        = "second"
    placement_properties        = null
    reverse_proxy_endpoint_port = null
}]

upgrade_policy = [{
  delta_health_policy = [{
    max_delta_unhealthy_applications_percent         = 1
    max_delta_unhealthy_nodes_percent                = 1
    max_upgrade_domain_delta_unhealthy_nodes_percent = 1
  }]
  force_restart                = null
  health_check_retry_timeout   = "00:45:00"
  health_check_stable_duration = "00:01:00"
  health_check_wait_duration   = "00:00:30"
  health_policy = [{
    max_unhealthy_applications_percent = 1
    max_unhealthy_nodes_percent        = 1
  }]
  upgrade_domain_timeout            = "02:00:00"
  upgrade_replica_set_check_timeout = null
  upgrade_timeout                   = "12:00:00"
}]

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Azure_SERVICE_FABRIC"
}
