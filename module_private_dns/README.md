<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 23/11/2022
##  Introduction 
This module helps us to provision Private DNS Zone, Private DNS Virtual Network Link and all the private dns records-
* a record
* aaaa record
* cname record
* mx record
* ptr record
* srv record
* txt record


## File Structure 
This particular module is having the following configuration files.
- dns.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in dns.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.32.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_a_record.a_records](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_aaaa_record.aaaa_records](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_aaaa_record) | resource |
| [azurerm_private_dns_cname_record.cname_records](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_cname_record) | resource |
| [azurerm_private_dns_mx_record.mx_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_mx_record) | resource |
| [azurerm_private_dns_ptr_record.ptr_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_ptr_record) | resource |
| [azurerm_private_dns_srv_record.srv_records](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_srv_record) | resource |
| [azurerm_private_dns_txt_record.txt_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_txt_record) | resource |
| [azurerm_private_dns_zone.private_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.pdns_vnetlink](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | name - (Required) The name of the DNS A Record. TTL - (Required) The Time To Live (TTL) of the DNS record in seconds.records - (Required) List of IPv4 Addresses. | <pre>object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records) | name - (Required) The name of the DNS A Record. TTL - (Required) The Time To Live (TTL) of the DNS record in seconds. records - (Required) A list of IPv6 Addresses. | <pre>object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_add_pdns_vnet_link"></a> [add\_pdns\_vnet\_link](#input\_add\_pdns\_vnet\_link) | Wants to add private dns virtual network link? | `bool` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | name - (Required) The name of the DNS CNAME Record.ttl - (Required) The Time To Live (TTL) of the DNS record in seconds.record - (Required) The target of the CNAME. | <pre>object({<br>    name    = string<br>    ttl     = number<br>    records = string<br>  })</pre> | n/a | yes |
| <a name="input_mx_record"></a> [mx\_record](#input\_mx\_record) | name - (Optional) The name of the DNS MX Record. Changing this forces a new resource to be created. Default to '@' for root zone entry.record - (Required) One or more record blocks. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds. | <pre>object({<br>    name = string<br>    ttl  = number<br>  })</pre> | n/a | yes |
| <a name="input_private_dns_name"></a> [private\_dns\_name](#input\_private\_dns\_name) | Name of private dns on azure portal | `string` | n/a | yes |
| <a name="input_private_dns_zone_vnet_link_name"></a> [private\_dns\_zone\_vnet\_link\_name](#input\_private\_dns\_zone\_vnet\_link\_name) | Name of the Private DNS Zone Virtual Network Link | `string` | n/a | yes |
| <a name="input_ptr_record"></a> [ptr\_record](#input\_ptr\_record) | name - (Required) The name of the DNS PTR Record. Changing this forces a new resource to be created. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds. records - (Required) List of Fully Qualified Domain Names. | <pre>object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_registration_enabled"></a> [registration\_enabled](#input\_registration\_enabled) | Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled? | `bool` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group name on Azure Portal | `string` | n/a | yes |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | email - (Required) The email contact for the SOA record. expire\_time - (Optional) The expire time for the SOA record. Defaults to 2419200. minimum\_ttl - (Optional) The minimum Time To Live for the SOA record. By convention, it is used to determine the negative caching duration. Defaults to 10. refresh\_time - (Optional) The refresh time for the SOA record. Defaults to 3600.retry\_time - (Optional) The retry time for the SOA record. Defaults to 300. ttl - (Optional) The Time To Live of the SOA Record in seconds. Defaults to 3600. | <pre>object({<br>    email        = string<br>    expire_time  = string<br>    minimum_ttl  = number<br>    refresh_time = string<br>    retry_time   = string<br>    ttl          = number<br>  })</pre> | n/a | yes |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | name - (Required) The name of the DNS SRV Record. Changing this forces a new resource to be created. record - (Required) One or more record blocks. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds. | <pre>object({<br>    name = string<br>    ttl  = number<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_txt_record"></a> [txt\_record](#input\_txt\_record) | name - (Required) The name of the DNS TXT Record. Changing this forces a new resource to be created. record - (Required) One or more record blocks. ttl - (Required) The Time To Live (TTL) of the DNS record in seconds. | <pre>object({<br>    name = string<br>    ttl  = number<br>  })</pre> | n/a | yes |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | Virtual Network ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_record_id"></a> [dns\_a\_record\_id](#output\_dns\_a\_record\_id) | The Private DNS A Record ID |
| <a name="output_dns_aaaa_record_id"></a> [dns\_aaaa\_record\_id](#output\_dns\_aaaa\_record\_id) | The Private DNS AAAA Record ID |
| <a name="output_dns_cname_record_id"></a> [dns\_cname\_record\_id](#output\_dns\_cname\_record\_id) | The Private DNS CNAME Record ID |
| <a name="output_dns_mx_record_id"></a> [dns\_mx\_record\_id](#output\_dns\_mx\_record\_id) | The Private DNS MX Record ID |
| <a name="output_dns_ptr_record_id"></a> [dns\_ptr\_record\_id](#output\_dns\_ptr\_record\_id) | The Private DNS PTR Record ID |
| <a name="output_dns_srv_record_id"></a> [dns\_srv\_record\_id](#output\_dns\_srv\_record\_id) | The Private DNS SRV Record ID |
| <a name="output_dns_txt_record_id"></a> [dns\_txt\_record\_id](#output\_dns\_txt\_record\_id) | The Private DNS TXT Record ID |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | The Private DNS Zone ID |
| <a name="output_private_dns_zone_vnet_link_id"></a> [private\_dns\_zone\_vnet\_link\_id](#output\_private\_dns\_zone\_vnet\_link\_id) | The ID of the Private DNS Zone Virtual Network Link |

## Module Usage
```
#Reference to Private DNS module
module "private_dns" {
  source                          = "../../modules/module_private_dns"
  private_dns_name                = var.private_dns_name
  tags                            = var.tags
  resource_group_name             = var.resource_group_name
  soa_record                      = var.soa_record
  a_records                       = var.a_records
  aaaa_records                    = var.aaaa_records
  cname_records                   = var.cname_records
  mx_record                       = var.mx_record
  ptr_record                      = var.ptr_record
  srv_records                     = var.srv_records
  txt_record                      = var.txt_record
  add_pdns_vnet_link              = var.add_pdns_vnet_link
  private_dns_zone_vnet_link_name = var.private_dns_zone_vnet_link_name
  virtual_network_id              = var.virtual_network_id
  registration_enabled            = var.registration_enabled
}

```
<!-- END_TF_DOCS -->