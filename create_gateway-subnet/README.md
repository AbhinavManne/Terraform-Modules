<!-- BEGIN_TF_DOCS -->
# <u> Introduction </u>
The gateway subnet is part of the virtual network IP address range that you specify when configuring your virtual network. It contains the IP addresses that the virtual network gateway resources and services use. When you create the gateway subnet, you specify the number of IP addresses that the subnet contains.

The Azure gateway subnet is needed by Azure to host the two virtual machines of your Azure gateway. Specify an address space with at least a 29-bit prefix length (example: 192.168.15.248/29). A 28-bit or smaller prefix length is recommended, especially if you are planning to use ExpressRoute.

## <u> Resources </u>:
* Network DDos Protection Plan
* Virtual Network
* Public IP
* Firewall
* Subnet-Firewall Subnet, Gateway Subnet

## <u> Requirements </u>

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.77, < 3.0 |

# <u> Build and Test </u>

### Generic modules for all scenarios :-
   * Tagging 
        tags = {
            Contact_name     = "ABC"
            cost_centre      = "999"
            application_name = "Gateway Subnet"
               }
   * Logging and Monitoring
        * Alert Rules
        * Diagnostic Settings
        * Action groups/rules 

   * RBAC
      * We can assign role at resource group level/resource level.


 # <u>Pre-requisites:</u>

In order to run this script successfully, below resources should be created prior to using this script :
 *  *** Resource Group *** The resource group collects metadata from each individual resource to facilitate more granular management than at the subscription level
 
## <u>Modules</u>
Below are the modules used in this script.

Each module we will be having the following files.
- Main.tf : This file is having terraform code to create all the resources as per Landing zone requirements
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in main.tf
- Output.tf : (optional) This file will be having all the resource output details generated.


| Name | Source | Version |
|------|--------|---------|
| <a name="module_gateway_subnet"></a> [gateway\_subnet](#module\_gateway\_subnet) | ../../modules/module_gateway-subnet/gateway | n/a |
| <a name="module_module_resource-role-assignment"></a> [module\_resource-role-assignment](#module\_module\_resource-role-assignment) | ../../modules/module_gateway-subnet/rbac | n/a |
| <a name="module_subnet_monitoring"></a> [subnet\_monitoring](#module\_subnet\_monitoring) | ../../modules/module_gateway-subnet/diag_setting | n/a |

```
#Reference to subnet creation module
module "gateway_subnet" {
  source                       = "../../modules/module_gateway-subnet/gateway"
  create_resource_group        = var.create_resource_group
  resource_group_name          = var.resource_group_name
  location                     = var.location
  address_prefixes             = var.address_prefixes
  vnet_name                    = var.vnet_name
  address_space                = var.address_space
  dns_servers                  = var.dns_servers
  enable_ddos_protection_plan1 = var.enable_ddos_protection_plan1
  network_ddos_protection_plan = var.network_ddos_protection_plan
  firewall_name                = var.firewall_name
  threat_intel_mode            = var.threat_intel_mode
  ip_config                    = var.ip_config
  public_ip_name               = var.public_ip_name
  allocation_method            = var.allocation_method
  sku                          = var.sku
  tags                         = var.tags
}

module "subnet_monitoring" {
  source                  = "../../modules/module_gateway-subnet/diag_setting"
  resource_id             = module.gateway_subnet.vnet_id
  resource_group_name     = module.gateway_subnet.resource_group
  resource_group_id       = module.gateway_subnet.resource_group_id
  resource_group_location = module.gateway_subnet.resource_group_location


}

module "module_resource-role-assignment" {
  source               = "../../modules/module_gateway-subnet/rbac"
  resource_group_name  = module.gateway_subnet.resource_group
  scope                = module.gateway_subnet.vnet_id
  role_definition_name = var.role_definition_name

}
```
## <u>Inputs</u>

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | List of address prefixes of the subnet | `list(string)` | n/a | yes |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | address spaces for vnet | `list(string)` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | allocation method | `string` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for all networking resources | `any` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS server | `list(string)` | n/a | yes |
| <a name="input_enable_ddos_protection_plan1"></a> [enable\_ddos\_protection\_plan1](#input\_enable\_ddos\_protection\_plan1) | enable ddos protection plan | `bool` | n/a | yes |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | name of the firewall | `string` | n/a | yes |
| <a name="input_ip_config"></a> [ip\_config](#input\_ip\_config) | ip configuration | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_network_ddos_protection_plan"></a> [network\_ddos\_protection\_plan](#input\_network\_ddos\_protection\_plan) | network ddos protection plan | `string` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | public ip name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `any` | n/a | yes |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | List of Role Definitions | `list(string)` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | sku | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_threat_intel_mode"></a> [threat\_intel\_mode](#input\_threat\_intel\_mode) | threat intel mode | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | virtual network name | `string` | n/a | yes |


## <u>Outputs</u>

| Name | Description |
|------|-------------|
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | n/a |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | n/a |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |


## <u> Commands to execute the terraform script: </u>
  * init         : Prepare your working directory for other commands
  * validate     : Check whether the configuration is valid
  * plan         : Show changes required by the current configuration
  * apply        : Create or update infrastructure
  * destroy      : Destroy previously-created infrastructure


## <u> Vulnerabilities discovered using tfsec:</u>

  * When using Queue Services for a storage account, logging should be enabled : Not Fixed

  This issue has been reported by the Terraform Github community and relates to the version of provider we no longer support.
  [Issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/4401)

 


## <u> Reference Documents:</u>
- [Terraform](https://registry.terraform.io/)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Microsoft docs](https://docs.microsoft.com/en-us/azure/storage/)
- [Azure Repos](https://dev.azure.com/eycloudtools/AzureLandingZone/_git/AzureLandingZone)
<!-- END_TF_DOCS -->