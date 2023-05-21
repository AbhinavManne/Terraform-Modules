resource_group_name = "azure_terraform"
location            = "East US"
netapp_account_name = "NetApp-account"
username            = "vedant.purushottam.kulkarni@eygdscoral.onmicrosoft.com"
smb_server_name     = "SMBSERVER"
dns_servers         = ["1.2.3.4"]
domain              = "eygdscoral.onmicrosoft.com"
organizational_unit = null

# Adding TAG's to your Azure resources 
tags = {
  project_name  = "CIL"
  contact_email = "vedant.purushottam.kulkarni@gds.ey.com"
  contact_name  = "Vedant Kulkarni"
  region        = "EastUs"
}
