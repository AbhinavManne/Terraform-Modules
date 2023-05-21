<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 21/10/2022
##  Introduction 
This module helps us to provision multiple managed disks and disk attachment.

## File Structure 
This particular module is having the following configuration files.
- managed_disk.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in managed_disk.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | "3.23.0" |


## Resources

| Name | Type |
|------|------|
| [azurerm_managed_disk.mdisk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_virtual_machine_data_disk_attachment.dda](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_disk_attachment"></a> [data\_disk\_attachment](#input\_data\_disk\_attachment) | Data disk attachment. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments:<br><li>***create_option***<br><li>***write_accelerator_enabled*** | <pre>map(object({<br>    lun                       = number<br>    caching                   = string<br>    create_option             = string<br>    write_accelerator_enabled = string<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_disk_access"></a> [disk\_access](#input\_disk\_access) | Name of disk access resource on Azure Portal | `string` | n/a | yes |
| <a name="input_enable_disk_access"></a> [enable_disk_access](#input\_enable\_disk\_access) | Wants to provision disk access resource? | `string` | n/a | yes |
| <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id) | ID of Disk Encryption Set | `string` | n/a | yes |
| <a name="input_managed_disk"></a> [managed\_disk](#input\_managed\_disk) | Managed disk block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments:<br><li>***disk_iops_read_write***<br><li>***disk_mbps_read_write***<br><li>***disk_iops_read_only***<br><li>***disk_mbps_read_only***<br><li>***disk_size_gb***<br><li>***edge_zone***<br><li>***encryption_settings***<br><li>***hyper_v_generation***<br><li>***image_reference_id***<br><li>***gallery_image_reference_id***<br><li>***logical_sector_size***<br><li>***os_type***<br><li>***source_resource_id***<br><li>***source_uri***<br><li>***storage_account_id***<br><li>***tier***<br><li>***max_shares***<br><li>***trusted_launch_enabled***<br><li>***security_type***<br><li>***secure_vm_disk_encryption_set_id***<br><li>***on_demand_bursting_enabled***<br><li>***zone*** | <pre>map(object({<br>    storage_account_type             = string<br>    create_option                    = string<br>    disk_encryption_set_id           = string<br>    disk_iops_read_write             = string<br>    disk_mbps_read_write             = string<br>    disk_iops_read_only              = string<br>    disk_mbps_read_only              = string<br>    disk_size_gb                     = string<br>    edge_zone                        = string<br>    hyper_v_generation               = string<br>    image_reference_id               = string<br>    gallery_image_reference_id       = string<br>    logical_sector_size              = string<br>    os_type                          = string<br>    source_resource_id               = string<br>    source_uri                       = string<br>    storage_account_id               = string<br>    tier                             = string<br>    max_shares                       = string<br>    trusted_launch_enabled           = string<br>    security_type                    = string<br>    secure_vm_disk_encryption_set_id = string<br>    on_demand_bursting_enabled       = bool<br>    zone                             = string<br>    network_access_policy            = string<br>    disk_access_id                   = string<br>    public_network_access_enabled    = string<br>    encryption_settings = list(object({<br>      enabled = bool<br>      disk_encryption_key = list(object({<br>        secret_url      = string<br>        source_vault_id = string<br>      }))<br>      key_encryption_key = list(object({<br>        key_url         = string<br>        source_vault_id = string<br>      }))<br>    }))<br><br>  }))</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_virtual_machine_id"></a> [virtual\_machine\_id](#input\_virtual\_machine\_id) | VM ID | `string` | n/a | yes |
| <a name="input_network_access_policy"></a> [network\_access\_policy](#input\_network\_access\_policy) | Policy for accessing the disk via network. Allowed values are AllowAll, AllowPrivate, and DenyAll. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Wants to enable public network access? | `string` | n/a | yes |

## Outputs
| Name | Description |
|------|-------------|
| <a name="output_managed_disk_id"></a> [managed\_disk\_id](#output\_managed\_disk\_id) | The ID of the Managed Disks. |

## Module Usage
```
module "managed_disk" {
  source                        = "../../modules/module_managed_disk"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  enable_disk_access            = var.enable_disk_access
  disk_access                   = var.disk_access
  disk_encryption_set_id        = var.disk_encryption_set_id
  managed_disk                  = var.managed_disk
  network_access_policy         = var.network_access_policy
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  virtual_machine_id            = var.virtual_machine_id
  data_disk_attachment          = var.data_disk_attachment
}

module "PrivateEndpoint_module" {
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  subnet_id                         = var.subnet_id
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name           //"${each.key}-${var.private_endpoint_name}"
  private_service_connection_name   = var.private_service_connection_name //"${each.key}-${var.private_service_connection_name}"
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
  private_connection_resource_id    = module.managed_disk.disk_access_id
}


```

### Points to be noted :
- While using disk_encryption_set_id, make sure that the Disk Encryption Set must have the Reader Role Assignment scoped on the Key Vault - in addition to an Access Policy to the Key Vault.

- Premium SSD maxShares limit: P15 and P20 disks: 2. P30,P40,P50 disks: 5. P60,P70,P80 disks: 10. For ultra disks the max_shares minimum value is 1 and the maximum is 5.

- Credit-Based Bursting is enabled by default on all eligible disks. On-demand bursting if you want then you have to enable it.

## Managed Disk : Terraform
* Please refer this link to understand more about Managed disk configurations through terraform: [Managed_disk_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk)

<!-- END_TF_DOCS -->