kusto_cluster                      = "clikcl"
location                           = "East US"
resource_group_name                = "cilrg"
#cluster_id                         = "id"
allowed_ip_ranges                  = []
double_encryption_enabled          = false
identity_ids                       = []
identity_type                      = "SystemAssigned"
auto_stop_enabled                  = true
disk_encryption_enabled            = true
streaming_ingestion_enabled        = true
public_ip_type                     = "IPv4"
public_network_access_enabled      = true
outbound_network_access_restricted = false
purge_enabled                      = true
virtual_network_configuration      = false
subnet_id                          = "id"
engine_public_ip_id                = "ip"
data_management_public_ip_id       = "ip"
language_extensions                = []
optimized_auto_scale               = false
minimum_instances                  = 2
maximum_instances                  = 4
trusted_external_tenants           = []
zones                              = []
engine                             = "V2"
allowed_fqdns                      = []
capacity                           = 4
sku_name                           = "Standard_D12_v2"
tags = {
  contact_email = "aswini.chirumamilla@gds.ey.com"
  contact_name  = "aswini"
  project_name  = "CIL"
  region        = "East US"

}


        
