resource_group_name     = "azure_terraform"
virtual_network_name    = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/azure_terraform/providers/Microsoft.Network/virtualNetworks/azure_terraform-vnet"
subnet_name             = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/azure_terraform/providers/Microsoft.Network/virtualNetworks/azure_terraform-vnet/subnets/default"
account_name            = "NetApp-account"
pool_name               = "capai"
service_level           = "Premium"
location                = "East Us"
size_in_tb              = 4
volume_name             = "primary-netappvolume"
volume_path             = "my-unique-file-path"
security_style          = "Unix"
storage_quota_in_gb     = 100
address_space           = ["10.3.0.0/28"]
address_prefixes        = ["10.3.0.0/28"]
service_delegation_name = "Microsoft.Netapp/volumes"
actions                 = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
delegation_name         = "netapp"
netapp_snapshot         = "Netapp-netappsnapshot"

tags = {
  project_name  = "CIL"
  contact_email = "vedant.purushottam.kulkarni@gds.ey.com"
  contact_name  = "Vedant Kulkarni"
  region        = "EastUs"
}

