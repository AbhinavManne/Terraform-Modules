<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 20/09/2022
# <u> Introduction </u>
* This module provides the facility to provision linux Virtual machine Scale Set. In this module we have included all possible argument for windows virtual machine scale set.

* In this module we have used Hashicorp's tls provider to generate the SSH key.  

## File Structure
This particular module is having the following configuration files.
 
- vmss.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in vmss.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.20.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.1 |

### Note
* One of either ***source_image_id*** or ***source_image_reference*** must be set.
* Plan block is needed when you create custom marketplace image vms (like barracuda firewalls, or trendmicro servers, etc). basically anything that is not provided by microsoft (for the most part)
* Optional Variables are marked as optional in the description of the variables .


## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.ssh_private_key_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine_scale_set.linux_vmss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_key_vault_secret.password_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_data_disk"></a> [add\_data\_disk](#input\_add\_data\_disk) | Wants to add Data Disk? | `bool` | `false` | no |
| <a name="input_add_secret"></a> [add\_secret](#input\_add\_secret) | Map of secret which have keyvault id and a object of certificate. | <pre>map(object({<br>    key_vault_id = string<br>    certificate = map(string)<br>  }))</pre> | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | value | `string` | n/a | yes |
| <a name="input_application_gateway_backend_address_pool_ids"></a> [application\_gateway\_backend\_address\_pool\_ids](#input\_application\_gateway\_backend\_address\_pool\_ids) | A list of Backend Address Pools ID's from a Application Gateway which this Virtual Machine Scale Set should be connected to. | `list(string)` | `null` | no |
| <a name="input_application_security_group_ids"></a> [application\_security\_group\_ids](#input\_application\_security\_group\_ids) | A list of Application Security Group ID's which this Virtual Machine Scale Set should be connected to. | `list(string)` | `null` | no |
| <a name="input_capacity_reservation_group_id"></a> [capacity\_reservation\_group\_id](#input\_capacity\_reservation\_group\_id) | Specifies the ID of the Capacity Reservation Group which the Virtual Machine Scale Set should be allocated to. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data) | The Base64-Encoded Custom Data which should be used for this Virtual Machine Scale Set. | `string` | `null` | no |
| <a name="input_data_disk_caching"></a> [data\_disk\_caching](#input\_data\_disk\_caching) | The type of Caching which should be used for this Data Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | n/a | yes |
| <a name="input_data_disk_create_option"></a> [data\_disk\_create\_option](#input\_data\_disk\_create\_option) | The create option which should be used for this Data Disk. Possible values are Empty and FromImage. Defaults to Empty. (FromImage should only be used if the source image includes data disks). | `string` | `"Empty"` | no |
| <a name="input_data_disk_disk_size_gb"></a> [data\_disk\_disk\_size\_gb](#input\_data\_disk\_disk\_size\_gb) | The size of the Data Disk which should be created. | `number` | n/a | yes |
| <a name="input_data_disk_encryption_set_id"></a> [data\_disk\_encryption\_set\_id](#input\_data\_disk\_encryption\_set\_id) | The ID of the Disk Encryption Set which should be used to encrypt this Data Disk. | `string` | `null` | no |
| <a name="input_data_disk_iops_read_write"></a> [data\_disk\_iops\_read\_write](#input\_data\_disk\_iops\_read\_write) | Specifies the Read-Write IOPS for this Data Disk. Only settable for UltraSSD disks. | `string` | `null` | no |
| <a name="input_data_disk_lun"></a> [data\_disk\_lun](#input\_data\_disk\_lun) | The Logical Unit Number of the Data Disk, which must be unique within the Virtual Machine. | `number` | n/a | yes |
| <a name="input_data_disk_mbps_read_write"></a> [data\_disk\_mbps\_read\_write](#input\_data\_disk\_mbps\_read\_write) | Specifies the Read-Write IOPS for this Data Disk. Only settable for UltraSSD disks. | `string` | `null` | no |
| <a name="input_data_disk_storage_account_type"></a> [data\_disk\_storage\_account\_type](#input\_data\_disk\_storage\_account\_type) | The Type of Storage Account which should back this Data Disk. Possible values include Standard\_LRS, StandardSSD\_LRS, Premium\_LRS and UltraSSD\_LRS. | `string` | n/a | yes |
| <a name="input_data_disk_write_accelerator_enabled"></a> [data\_disk\_write\_accelerator\_enabled](#input\_data\_disk\_write\_accelerator\_enabled) | Should Write Accelerator be enabled for this Data Disk? Defaults to false. | `bool` | `false` | no |
| <a name="input_diff_disk_settings_option"></a> [diff\_disk\_settings\_option](#input\_diff\_disk\_settings\_option) | Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is Local. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_diff_disk_settings_placement"></a> [diff\_disk\_settings\_placement](#input\_diff\_disk\_settings\_placement) | Specifies where to store the Ephemeral Disk. Possible values are CacheDisk and ResourceDisk. Defaults to CacheDisk. Changing this forces a new resource to be created. | `string` | `"CacheDisk"` | no |
| <a name="input_disable_automatic_rollback"></a> [disable\_automatic\_rollback](#input\_disable\_automatic\_rollback) | Should automatic rollbacks be disabled? | `bool` | n/a | yes |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine Scale Set is sourced from. | `string` | `null` | no |
| <a name="input_dns_server"></a> [dns\_server](#input\_dns\_server) | A list of IP Addresses of DNS Servers which should be assigned to the Network Interface. | `list(string)` | `null` | no |
| <a name="input_do_not_run_extensions_on_overprovisioned_machines"></a> [do\_not\_run\_extensions\_on\_overprovisioned\_machines](#input\_do\_not\_run\_extensions\_on\_overprovisioned\_machines) | Should Virtual Machine Extensions be run on Overprovisioned Virtual Machines in the Scale Set? Defaults to false. | `bool` | `false` | no |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | The Prefix which should be used for the Domain Name Label for each Virtual Machine Instance. Azure concatenates the Domain Name Label and Virtual Machine Index to create a unique Domain Name Label for each Virtual Machine. | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine Scale Set should exist. Changing this forces a new Windows Virtual Machine Scale Set to be created. | `string` | `null` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | Does this Network Interface support Accelerated Networking? Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_automatic_instance_repair"></a> [enable\_automatic\_instance\_repair](#input\_enable\_automatic\_instance\_repair) | Should the automatic instance repair be enabled on this Virtual Machine Scale Set? | `bool` | `false` | no |
| <a name="input_enable_automatic_os_upgrade"></a> [enable\_automatic\_os\_upgrade](#input\_enable\_automatic\_os\_upgrade) | Should OS Upgrades automatically be applied to Scale Set instances in a rolling fashion when a newer version of the OS Image becomes available? | `bool` | n/a | yes |
| <a name="input_enable_automatic_os_upgrade_policy"></a> [enable\_automatic\_os\_upgrade\_policy](#input\_enable\_automatic\_os\_upgrade\_policy) | Wants to enable automatic OS Upgrade Policy | `bool` | `false` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Does this Network Interface support IP Forwarding? Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_public_ip_address"></a> [enable\_public\_ip\_address](#input\_enable\_public\_ip\_address) | Wants to enable public ip address? | `bool` | `false` | no |
| <a name="input_enable_rolling_upgrade_policy"></a> [enable\_rolling\_upgrade\_policy](#input\_enable\_rolling\_upgrade\_policy) | Wants to enable rolling upgrade policy? | `bool` | `false` | no |
| <a name="input_enable_ssh_key_authentication"></a> [enable\_ssh\_key\_authentication](#input\_enable\_ssh\_key\_authentication) | User want to user ssh\_key authentication method or not. | `bool` | n/a | yes |
| <a name="input_encryption_at_host_enabled"></a> [encryption\_at\_host\_enabled](#input\_encryption\_at\_host\_enabled) | Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host? | `bool` | `false` | no |
| <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy) | Specifies the eviction policy for Virtual Machines in this Scale Set. Possible values are Deallocate and Delete. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_existed_public_key"></a> [existed\_public\_key](#input\_existed\_public\_key) | User want to use existing ssh keys. | `string` | n/a | yes |
| <a name="input_ext_value"></a> [ext\_value](#input\_ext\_value) | This is a Map of objects, where a object is defiend as a extension. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. Here, Optional Arguments are: <br><li>***auto_upgrade_minor_version***<br><li>***automatic_upgrade_enabled***<br><li>***force_update_tag***<br><li>***protected_settings***<br><li>***provision_after_extensions***<br><li>***settings*** <br> | <pre>map(object({<br>    name                       = string<br>    publisher                  = string<br>    type                       = string<br>    type_handler_version       = string<br>    auto_upgrade_minor_version = bool<br>    automatic_upgrade_enabled  = bool<br>    force_update_tag           = string<br>    protected_settings         = string<br>    provision_after_extensions = list(string)<br>    settings                   = string<br>  }))</pre> | `null` | no |
| <a name="input_extensions_time_budget"></a> [extensions\_time\_budget](#input\_extensions\_time\_budget) | Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M). | `string` | `null` | no |
| <a name="input_generate_ssh_key"></a> [generate\_ssh\_key](#input\_generate\_ssh\_key) | User want to generate the ssh\_key using the script. | `bool` | n/a | yes |
| <a name="input_grace_period_for_automatic_instance_repair"></a> [grace\_period\_for\_automatic\_instance\_repair](#input\_grace\_period\_for\_automatic\_instance\_repair) | Amount of time (in minutes, between 30 and 90, defaults to 30 minutes) for which automatic repairs will be delayed. The grace period starts right after the VM is found unhealthy. The time duration should be specified in ISO 8601 format. | `string` | `null` | no |
| <a name="input_health_probe_id"></a> [health\_probe\_id](#input\_health\_probe\_id) | The ID of a Load Balancer Probe which should be used to determine the health of an instance. This is Required and can only be specified when upgrade\_mode is set to Automatic or Rolling. | `string` | `null` | no |
| <a name="input_idle_timeout_in_minutes"></a> [idle\_timeout\_in\_minutes](#input\_idle\_timeout\_in\_minutes) | The Idle Timeout in Minutes for the Public IP Address. Possible values are in the range 4 to 32. | `string` | `null` | no |
| <a name="input_ip_config_primary"></a> [ip\_config\_primary](#input\_ip\_config\_primary) | Is this the Primary IP Configuration for this Network Interface? Defaults to false. | `bool` | `false` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Specifies the ID of the Key Vault instance where the Secret resides. | `string` | n/a | yes |
| <a name="input_lb_frontend_ip_config"></a> [lb\_frontend\_ip\_config](#input\_lb\_frontend\_ip\_config) | The Name which should be used for this IP Configuration. | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine Scale Set. Possible values are None, Windows\_Client and Windows\_Server. | `string` | `null` | no |
| <a name="input_linux_vmss"></a> [linux\_vmss](#input\_linux\_vmss) | The name of the Windows Virtual Machine Scale Set. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_load_balancer_backend_address_pool_ids"></a> [load\_balancer\_backend\_address\_pool\_ids](#input\_load\_balancer\_backend\_address\_pool\_ids) | A list of Backend Address Pools ID's from a Load Balancer which this Virtual Machine Scale Set should be connected to. | `list(string)` | `null` | no |
| <a name="input_load_balancer_inbound_nat_rules_ids"></a> [load\_balancer\_inbound\_nat\_rules\_ids](#input\_load\_balancer\_inbound\_nat\_rules\_ids) | A list of NAT Rule ID's from a Load Balancer which this Virtual Machine Scale Set should be connected to. | `list(string)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the Windows Virtual Machine Scale Set should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Windows Virtual Machine Scale Set. | `list(string)` | `null` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Windows Virtual Machine Scale Set. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both). | `string` | `null` | no |
| <a name="input_max_batch_instance_percent"></a> [max\_batch\_instance\_percent](#input\_max\_batch\_instance\_percent) | The maximum percent of total virtual machine instances that will be upgraded simultaneously by the rolling upgrade in one batch. As this is a maximum, unhealthy instances in previous or future batches can cause the percentage of instances in a batch to decrease to ensure higher reliability. | `string` | n/a | yes |
| <a name="input_max_bid_price"></a> [max\_bid\_price](#input\_max\_bid\_price) | The maximum price you're willing to pay for each Virtual Machine in this Scale Set, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machines in the Scale Set will be evicted using the eviction\_policy. Defaults to -1, which means that each Virtual Machine in the Scale Set should not be evicted for price reasons. | `string` | `"-1"` | no |
| <a name="input_max_unhealthy_instance_percent"></a> [max\_unhealthy\_instance\_percent](#input\_max\_unhealthy\_instance\_percent) | The maximum percentage of the total virtual machine instances in the scale set that can be simultaneously unhealthy, either as a result of being upgraded, or by being found in an unhealthy state by the virtual machine health checks before the rolling upgrade aborts. This constraint will be checked prior to starting any batch. | `string` | n/a | yes |
| <a name="input_max_unhealthy_upgraded_instance_percent"></a> [max\_unhealthy\_upgraded\_instance\_percent](#input\_max\_unhealthy\_upgraded\_instance\_percent) | The maximum percentage of upgraded virtual machine instances that can be found to be in an unhealthy state. This check will happen after each batch is upgraded. If this percentage is ever exceeded, the rolling update aborts. | `string` | n/a | yes |
| <a name="input_name_of_image"></a> [name\_of\_image](#input\_name\_of\_image) | Specifies the name of the image from the marketplace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | The Name which should be used for this Network Interface. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_interface_primary"></a> [network\_interface\_primary](#input\_network\_interface\_primary) | Is this the Primary IP Configuration? true/false | `bool` | n/a | yes |
| <a name="input_nsg_id"></a> [nsg\_id](#input\_nsg\_id) | The ID of a Network Security Group which should be assigned to this Network Interface. | `string` | `null` | no |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | Specifies the offer of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite | `string` | n/a | yes |
| <a name="input_os_disk_encryption_set_id"></a> [os\_disk\_encryption\_set\_id](#input\_os\_disk\_encryption\_set\_id) | The ID of the Disk Encryption Set which should be used to encrypt this OS Disk. Conflicts with secure\_vm\_disk\_encryption\_set\_id. | `string` | `null` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard\_LRS, StandardSSD\_LRS and Premium\_LRS. | `string` | n/a | yes |
| <a name="input_overprovision"></a> [overprovision](#input\_overprovision) | Should Azure over-provision Virtual Machines in this Scale Set? This means that multiple Virtual Machines will be provisioned and Azure will keep the instances which become available first - which improves provisioning success rates and improves deployment time. You're not billed for these over-provisioned VM's and they don't count towards the Subscription Quota. Defaults to true. | `bool` | `true` | no |
| <a name="input_password_secret_name"></a> [password\_secret\_name](#input\_password\_secret\_name) | Password secret name if the user want to use password authentication. | `string` | n/a | yes |
| <a name="input_pause_time_between_batches"></a> [pause\_time\_between\_batches](#input\_pause\_time\_between\_batches) | The wait time between completing the update for all virtual machines in one batch and starting the next batch. The time duration should be specified in ISO 8601 format. | `string` | n/a | yes |
| <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count) | Specifies the number of fault domains that are used by this Linux Virtual Machine Scale Set. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix which should be used for the name of the Virtual Machines in this Scale Set. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer\_name\_prefix, then you must specify computer\_name\_prefix. | `string` | `null` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The Priority of this Virtual Machine Scale Set. Possible values are Regular and Spot. Defaults to Regular. Changing this value forces a new resource. | `string` | `"Regular"` | no |
| <a name="input_private_key_secret_name"></a> [private\_key\_secret\_name](#input\_private\_key\_secret\_name) | Specifies the name of the Key Vault Secret. | `string` | n/a | yes |
| <a name="input_product_of_image"></a> [product\_of\_image](#input\_product\_of\_image) | Specifies the product of the image from the marketplace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set? Defaults to true. Changing this value forces a new resource to be created. | `bool` | `true` | no |
| <a name="input_proximity_placement_group_id"></a> [proximity\_placement\_group\_id](#input\_proximity\_placement\_group\_id) | The ID of the Proximity Placement Group in which the Virtual Machine Scale Set should be assigned to. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_public_ip_address_name"></a> [public\_ip\_address\_name](#input\_public\_ip\_address\_name) | The Name of the Public IP Address Configuration. | `string` | n/a | yes |
| <a name="input_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#input\_public\_ip\_prefix\_id) | The ID of the Public IP Address Prefix from where Public IP Addresses should be allocated. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_publisher_of_image"></a> [publisher\_of\_image](#input\_publisher\_of\_image) | Specifies the publisher of the image. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_publisher_type"></a> [publisher\_type](#input\_publisher\_type) | Specifies the publisher of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which the Windows Virtual Machine Scale Set should be exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_scale_in_policy"></a> [scale\_in\_policy](#input\_scale\_in\_policy) | The scale-in policy rule that decides which virtual machines are chosen for removal when a Virtual Machine Scale Set is scaled in. Possible values for the scale-in policy rules are Default, NewestVM and OldestVM, defaults to Default. For more information about scale in policy, please refer to this doc. | `string` | `"Default"` | no |
| <a name="input_secure_vm_disk_encryption_set_id"></a> [secure\_vm\_disk\_encryption\_set\_id](#input\_secure\_vm\_disk\_encryption\_set\_id) | The ID of the Disk Encryption Set which should be used to Encrypt the OS Disk when the Virtual Machine Scale Set is Confidential VMSS. Conflicts with disk\_encryption\_set\_id. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_security_encryption_type"></a> [security\_encryption\_type](#input\_security\_encryption\_type) | Encryption Type when the Virtual Machine Scale Set is Confidential VMSS. Possible values are VMGuestStateOnly and DiskWithVMGuestState. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_single_placement_group"></a> [single\_placement\_group](#input\_single\_placement\_group) | Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines. Defaults to true. | `bool` | `true` | no |
| <a name="input_sku_type"></a> [sku\_type](#input\_sku\_type) | Specifies the SKU of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_source_image_id"></a> [source\_image\_id](#input\_source\_image\_id) | The ID of an Image which each Virtual Machine in this Scale Set should be based on. | `string` | `null` | no |
| <a name="input_ssh_key_algorithm"></a> [ssh\_key\_algorithm](#input\_ssh\_key\_algorithm) | Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_ssh_key_rsa_bits"></a> [ssh\_key\_rsa\_bits](#input\_ssh\_key\_rsa\_bits) | Specifies the value of the Key Vault Secret. | `number` | n/a | yes |
| <a name="input_ssh_key_username"></a> [ssh\_key\_username](#input\_ssh\_key\_username) | value | `string` | n/a | yes |
| <a name="input_storage_account_uri"></a> [storage\_account\_uri](#input\_storage\_account\_uri) | The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet which this IP Configuration should be connected to. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to this Virtual Machine Scale Set. | `map(any)` | n/a | yes |
| <a name="input_terminate_notification_enabled"></a> [terminate\_notification\_enabled](#input\_terminate\_notification\_enabled) | Should the terminate notification be enabled on this Virtual Machine Scale Set? Defaults to false. | `bool` | `false` | no |
| <a name="input_terminate_notification_timeout"></a> [terminate\_notification\_timeout](#input\_terminate\_notification\_timeout) | Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format. | `string` | `null` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine Scale Set? Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The Base64-Encoded User Data which should be used for this Virtual Machine Scale Set. | `string` | `null` | no |
| <a name="input_using_source_image_reference"></a> [using\_source\_image\_reference](#input\_using\_source\_image\_reference) | VM Image is defiend Using Source Image Reference? | `bool` | `false` | no |
| <a name="input_version_type"></a> [version\_type](#input\_version\_type) | Specifies the version of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_vmss_instances"></a> [vmss\_instances](#input\_vmss\_instances) | The number of Virtual Machines in the Scale Set. | `number` | n/a | yes |
| <a name="input_vmss_sku"></a> [vmss\_sku](#input\_vmss\_sku) | The Virtual Machine SKU for the Scale Set. | `string` | n/a | yes |
| <a name="input_vmss_upgrade_mode"></a> [vmss\_upgrade\_mode](#input\_vmss\_upgrade\_mode) | Specifies how Upgrades (e.g. changing the Image/SKU) should be performed to Virtual Machine Instances. Possible values are Automatic, Manual and Rolling | `string` | `"Manual"` | no |
| <a name="input_write_accelerator_enabled"></a> [write\_accelerator\_enabled](#input\_write\_accelerator\_enabled) | Should Write Accelerator be Enabled for this OS Disk? Defaults to false. | `bool` | `false` | no |
| <a name="input_zone_balance"></a> [zone\_balance](#input\_zone\_balance) | Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones? Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this Windows Virtual Machine Scale Set should be located. Changing this forces a new Windows Virtual Machine Scale Set to be created. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vmss_id"></a> [vmss\_id](#output\_vmss\_id) | ID of vmss |

## Module Usage 
* You can call the specified Linux VM Scal Set in any script where you want to integrate it.
```
module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "vmss_module" {
  source                         = "../../modules/module_vmss_linux/vmss"
  enable_ssh_key_authentication = var.enable_ssh_key_authentication
  generate_ssh_key = var.generate_ssh_key
  existed_public_key = var.existed_public_key
  ssh_key_algorithm = var.ssh_key_algorithm
  ssh_key_rsa_bits = var.ssh_key_rsa_bits
  private_key_secret_name = var.private_key_secret_name
  key_vault_id = var.key_vault_id
  resource_group_name                               = module.create_resource_group.resource_group_name
  location                                          = module.create_resource_group.resource_group_location
  password_secret_name = var.password_secret_name
  linux_vmss                                       = var.linux_vmss
  vmss_instances                                    = var.vmss_instances
  vmss_sku                                          = var.vmss_sku
  admin_username = var.admin_username
  ssh_key_username = var.ssh_key_username
  network_interface                                 = var.network_interface
  network_interface_primary                         = var.network_interface_primary
  nsg_id                                            = var.nsg_id
  dns_server                                        = var.dns_server
  enable_accelerated_networking                     = var.enable_accelerated_networking
  enable_ip_forwarding                              = var.enable_ip_forwarding
  lb_frontend_ip_config                             = var.lb_frontend_ip_config
  ip_config_primary                                 = var.ip_config_primary
  subnet_id                                         = var.subnet_id
  load_balancer_backend_address_pool_ids            = var.load_balancer_backend_address_pool_ids
  application_gateway_backend_address_pool_ids      = var.application_gateway_backend_address_pool_ids
  application_security_group_ids                    = var.application_security_group_ids
  load_balancer_inbound_nat_rules_ids               = var.load_balancer_inbound_nat_rules_ids
  enable_public_ip_address                          = var.enable_public_ip_address
  public_ip_address_name                            = var.public_ip_address_name
  domain_name_label                                 = var.domain_name_label
  idle_timeout_in_minutes                           = var.idle_timeout_in_minutes
  public_ip_prefix_id                               = var.public_ip_prefix_id
  os_disk_caching                                   = var.os_disk_caching
  os_disk_storage_account_type                      = var.os_disk_storage_account_type
  diff_disk_settings_option                         = var.diff_disk_settings_option
  diff_disk_settings_placement                      = var.diff_disk_settings_placement
  os_disk_encryption_set_id                         = var.os_disk_encryption_set_id
  disk_size_gb                                      = var.disk_size_gb
  security_encryption_type                          = var.security_encryption_type
  secure_vm_disk_encryption_set_id                  = var.secure_vm_disk_encryption_set_id
  write_accelerator_enabled                         = var.write_accelerator_enabled
  ultra_ssd_enabled                                 = var.ultra_ssd_enabled
  enable_automatic_os_upgrade                       = var.enable_automatic_os_upgrade
  grace_period_for_automatic_instance_repair        = var.grace_period_for_automatic_instance_repair
  enable_automatic_instance_repair                  = var.enable_automatic_instance_repair
  health_probe_id                                   = var.health_probe_id
  vmss_upgrade_mode                                 = var.vmss_upgrade_mode
  enable_automatic_os_upgrade_policy                = var.enable_automatic_os_upgrade_policy
  disable_automatic_rollback                        = var.disable_automatic_rollback
  storage_account_uri                               = var.storage_account_uri
  capacity_reservation_group_id                     = var.capacity_reservation_group_id
  prefix                                            = var.prefix
  custom_data                                       = var.custom_data
  add_data_disk                                     = var.add_data_disk
  data_disk_caching                                 = var.data_disk_caching
  data_disk_create_option                           = var.data_disk_create_option
  data_disk_disk_size_gb                            = var.data_disk_disk_size_gb
  data_disk_storage_account_type                    = var.data_disk_storage_account_type
  data_disk_lun                                     = var.data_disk_lun
  data_disk_encryption_set_id                       = var.data_disk_encryption_set_id
  data_disk_mbps_read_write                         = var.data_disk_mbps_read_write
  data_disk_iops_read_write                         = var.data_disk_iops_read_write
  data_disk_write_accelerator_enabled               = var.data_disk_write_accelerator_enabled
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.edge_zone
  encryption_at_host_enabled                        = var.encryption_at_host_enabled
  ext_value = var.ext_value
  extensions_time_budget                            = var.extensions_time_budget
  managed_identity_type                             = var.managed_identity_type
  managed_identity_ids                              = var.managed_identity_ids
  eviction_policy                                   = var.eviction_policy
  license_type                                      = var.license_type
  max_bid_price                                     = var.max_bid_price
  overprovision                                     = var.overprovision
  name_of_image                                     = var.name_of_image
  publisher_of_image                                = var.publisher_of_image
  product_of_image                                  = var.product_of_image
  platform_fault_domain_count                       = var.platform_fault_domain_count
  priority                                          = var.priority
  provision_vm_agent                                = var.provision_vm_agent
  proximity_placement_group_id                      = var.proximity_placement_group_id
  enable_rolling_upgrade_policy                     = var.enable_accelerated_networking
  scale_in_policy                                   = var.scale_in_policy
  max_batch_instance_percent                        = var.max_batch_instance_percent
  max_unhealthy_instance_percent                    = var.max_unhealthy_instance_percent
  max_unhealthy_upgraded_instance_percent           = var.max_unhealthy_upgraded_instance_percent
  pause_time_between_batches                        = var.pause_time_between_batches
  add_secret                                        = var.add_secret
  single_placement_group                            = var.single_placement_group
  source_image_id                                   = var.source_image_id
  using_source_image_reference                      = var.using_source_image_reference
  publisher_type                                    = var.publisher_type
  offer_type                                        = var.offer_type
  sku_type                                          = var.sku_type
  version_type                                      = var.version_type
  terminate_notification_enabled                    = var.terminate_notification_enabled
  terminate_notification_timeout                    = var.terminate_notification_timeout
  user_data                                         = var.user_data
  zones                                             = var.zones
  zone_balance                                      = var.zone_balance
  tags                                              = var.tags
}


module "alert" {
  source = "../../modules/module_alert"
  action_group_name       = var.action_group_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  short_name              = var.short_name
  action_group_rule_name  = var.action_group_rule_name
  scope_type              = var.scope_type
  resource_id             = module.vmss_module.vmss_id
  activity_log_alert_name = var.activity_log_alert_name
  resource_group_id       = module.create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert      = var.category_log_alert
  metric_alert_name       = var.metric_alert_name
  storage_account_id      = var.storage_account_id
  metric_namespace        = var.metric_namespace
  metric_name             = var.metric_name
  aggregation             = var.aggregation
  operator                = var.operator
  threshold               = var.threshold
  dimension_name          = var.dimension_name
  dimension_operator      = var.dimension_operator
  values                  = var.values
}

```

<!-- END_TF_DOCS -->