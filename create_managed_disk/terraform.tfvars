resource_group_name    = "cil-mdisk-testing-as"
location               = "East US"

#--------------------
# MANAGED DISK MODULE
#--------------------
enable_disk_access = true
disk_access            = "testing-da-as"
disk_encryption_set_id = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/cil-mdisk-testing-as/providers/Microsoft.Compute/diskEncryptionSets/cil-testing-des-001"
managed_disk = {
  "key" = {
    create_option = "Empty"
    disk_iops_read_only        = null //disk_iops_read_write, disk_mbps_read_write, disk_iops_read_only, disk_mbps_read_only and logical_sector_size are only available for UltraSSD disks
    disk_iops_read_write       = null //"500"
    disk_mbps_read_only        = null
    disk_mbps_read_write       = null //"60"
    disk_size_gb               = "1"
    edge_zone                  = null
    encryption_settings        = null
    gallery_image_reference_id = null
    hyper_v_generation         = null
    image_reference_id         = null
    logical_sector_size        = null //"4096"
    max_shares                 = null //"2"
    on_demand_bursting_enabled = false
    os_type                    = null
    secure_vm_disk_encryption_set_id = null
    security_type                    = "ConfidentialVM_DiskEncryptedWithPlatformKey"
    source_resource_id               = null
    source_uri                       = null
    storage_account_id               = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/cil-mdisk-testing-as/providers/Microsoft.Storage/storageAccounts/ciltestingstrac001" //
    storage_account_type             = "Standard_LRS"
    tier                             = "E1"
    trusted_launch_enabled           = false
    zone                             = "1"
  },
  "key-1" = {
    create_option = "Empty"
    disk_iops_read_only        = null //disk_iops_read_write, disk_mbps_read_write, disk_iops_read_only, disk_mbps_read_only and logical_sector_size are only available for UltraSSD disks
    disk_iops_read_write       = null //"500"
    disk_mbps_read_only        = null
    disk_mbps_read_write       = null //"60"
    disk_size_gb               = "1"
    edge_zone                  = null
    encryption_settings        = null
    gallery_image_reference_id = null
    hyper_v_generation         = null
    image_reference_id         = null
    logical_sector_size        = null //"4096"
    max_shares                 = null //"2"
    on_demand_bursting_enabled = false
    os_type                    = null
    secure_vm_disk_encryption_set_id = null
    security_type                    = "ConfidentialVM_DiskEncryptedWithPlatformKey"
    source_resource_id               = null
    source_uri                       = null
    storage_account_id               = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/cil-mdisk-testing-as/providers/Microsoft.Storage/storageAccounts/ciltestingstrac001" //
    storage_account_type             = "Standard_LRS"
    tier                             = "E1"
    trusted_launch_enabled           = false
    zone                             = "1"
  }
}
network_access_policy         = "AllowPrivate"
public_network_access_enabled = "false"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Managed_disk"
}

data_disk_attachment = {
  "key" = {
    caching                   = "ReadWrite"
    create_option             = "Attach"
    lun                       = 1
    write_accelerator_enabled = "false"
  },
  "key-1" = {
    caching                   = "ReadWrite"
    create_option             = "Attach"
    lun                       = 2
    write_accelerator_enabled = "false"
  }
}
virtual_machine_id = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourcegroups/cil-mdisk-testing-as/providers/Microsoft.Compute/virtualMachines/cil-mdisk-test-vm"


#-------------------------------------------
# PRIVATE ENDPOINT MODULE(for managed disks)
#-------------------------------------------
private_connection_resource_alias = null
private_endpoint_name             = "testing-enpoint-001"
private_service_connection_name   = "privateserviceconnection-mdisk"
subresource_names                 = ["disks"]
is_manual_connection              = false
request_message                   = "PL"
subnet_id                         = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/cil-mdisk-testing-as/providers/Microsoft.Network/virtualNetworks/cil-testing-maria-vnet-001/subnets/default"
private_dns_zone_group            = null