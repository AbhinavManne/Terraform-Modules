resource_group_name     = "azure_terraform"
virtual_network_primary = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/azure_terraform/providers/Microsoft.Network/virtualNetworks/azure_terraform-vnet"
primary_subnet          = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/azure_terraform/providers/Microsoft.Network/virtualNetworks/azure_terraform-vnet/subnets/default"
account_name            = "NetApp-account"
pool_name               = "capai"
service_level           = "Premium"
size_in_tb              = 4
netapp_volume_primary   = "primary-netappvolume"
volume_path             = "my-unique-file-path"
protocols               = ["NFSv3"]
# protocols_enabled       = ["NFSv3"]
security_style          = "Unix"
storage_quota_in_gb     = 100
address_prefixes1       = ["10.3.0.0/28"]
address_prefixes2       = ["10.3.0.0/28"]
service_delegation_name = "Microsoft.Netapp/volumes"
actions                 = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
delegation_name         = "netapp"
location                = "East Us"
# rule_index              = 1
# allowed_clients         = ["0.0.0.0/0"]
# unix_read_only          = false
# unix_read_write         = true
endpoint_type         = "dst"
network_features      = "basic"
replication_frequency = "10minutes"
# Adding TAG's to your Azure resources 

export_policy_rule = [
  { rule_index = 1, allowed_clients = ["0.0.0.0/0"], unix_read_only = false, unix_read_write = true, protocols_enabled = ["NFSv3"] }
]

tags = {
  project_name  = "CIL"
  contact_email = "vedant.purushottam.kulkarni@gds.ey.com"
  contact_name  = "Vedant Kulkarni"
  region        = "EastUs"
}


