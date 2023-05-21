<!-- BEGIN_TF_DOCS -->

##### Last Updated[DD/MM/YYYY]: 29/07/2022

## Introduction

This module provisions a private endpoint .

* In private service connection , either specify private_connection_resource_id or private_connection_resource_alias.

* Private DNS integration : To connect privately with your private endpoint, you need a DNS record. We can integrate private endpoint using a private DNS zone. 

* If we are going to be using the Private DNS Zone with a Private Endpoint the name of the Private DNS Zone must follow the Private DNS Zone name schema in order for the two resources to be connected successfully.
    Link:(https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-dns#virtual-network-and-on-premises-workloads-using-a-dns-forwarder)

* We have not created resource for dns zone in this module we are taking the id as input from the user of dns_zone in dns_group block.   


## File Structure 
This particular module is having the following configuration files.
- private-endpoint.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in log-analytics.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>2.46 |



## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Status of manual connection | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_private_connection_resource_alias"></a> [private\_connection\_resource\_alias](#input\_private\_connection\_resource\_alias) | alias name | `string` | `null` | no |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | ID of resource to be associated | `any` | `null` | no |
| <a name="input_private_dns_zone_group"></a> [private\_dns\_zone\_group](#input\_private\_dns\_zone\_group) | #---------------END POINT----------------# | <pre>object({<br>    name                 = string<br>    private_dns_zone_ids = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | pvt endpoint name in Azure | `string` | n/a | yes |
| <a name="input_private_service_connection_name"></a> [private\_service\_connection\_name](#input\_private\_service\_connection\_name) | service connection name in Azure | `string` | n/a | yes |
| <a name="input_request_message"></a> [request\_message](#input\_request\_message) | request msg | `string` | `"PL"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id of subnet | `any` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | sub resources names in Azure | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag Name | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_endpoint_id"></a> [private\_endpoint\_id](#output\_private\_endpoint\_id) | n/a |


## Module Usage
* You can call the specified private endpoint module in any script where you want to integrate it.
```
module "PrivateEndpointSql_module" {
  source = "../../modules/module_private_endpoint"

  depends_on = [
    module.module_create_resource_group
  ]
  resource_group_name = module.module_create_resource_group.resource_group_name
  location = module.module_create_resource_group.resource_group_location
  subnet_id = var.subnet_id
  tags                = var.tags
  private_endpoint_name           = var.private_endpoint_name
  private_service_connection_name = var.private_service_connection_name
  subresource_names               = var.subresource_names
  is_manual_connection            = var.is_manual_connection
  request_message                 = var.request_message
  private_dns_zone_group = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
  private_connection_resource_id = var.private_connection_resource_id
}

```



#### Refer this link to know more about private Endpoint: [Private Endpoint](https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview)   


#### Terraform Registry link for private Endpoint (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint)




## Reference Documents(General):
- [Terraform](https://registry.terraform.io/)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Microsoft docs](https://docs.microsoft.com/en-us/azure/)
- [Azure Repos](https://dev.azure.com/eycloudtools/AzureLandingZone/_git/AzureLandingZone)


<!-- END_TF_DOCS -->