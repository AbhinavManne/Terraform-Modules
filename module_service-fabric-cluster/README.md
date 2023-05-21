<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 26/08/2022
##  Introduction 
This module helps us to provision and manage a Service Fabric Cluster. A Service Fabric cluster is a network-connected set of virtual or physical machines into which your microservices are deployed and managed.


## File Structure 
This particular module is having the following configuration files.
- service-fabric-cluster.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in service-fabric-cluster.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.1 |


## Resources

| Name | Type |
|------|------|
| [azurerm_service_fabric_cluster.sfcluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_fabric_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_on_features"></a> [add\_on\_features](#input\_add\_on\_features) | A List of one or more features which should be enabled, such as DnsService. | `list(string)` | <pre>[<br>  "DnsService"<br>]</pre> | no |
| <a name="input_certificate_common_name"></a> [certificate\_common\_name](#input\_certificate\_common\_name) | The common or subject name of the certificate. | `string` | n/a | yes |
| <a name="input_certificate_common_names_x509_store_name"></a> [certificate\_common\_names\_x509\_store\_name](#input\_certificate\_common\_names\_x509\_store\_name) | The X509 Store where the Certificate Exists, such as My. | `string` | `"My"` | no |
| <a name="input_certificate_issuer_thumbprint"></a> [certificate\_issuer\_thumbprint](#input\_certificate\_issuer\_thumbprint) | The Issuer Thumbprint of the Certificate. | `string` | n/a | yes |
| <a name="input_certificate_thumbprint"></a> [certificate\_thumbprint](#input\_certificate\_thumbprint) | The Thumbprint of the Certificate. | `string` | n/a | yes |
| <a name="input_certificate_thumbprint_secondary"></a> [certificate\_thumbprint\_secondary](#input\_certificate\_thumbprint\_secondary) | The Secondary Thumbprint of the Certificate. | `string` | n/a | yes |
| <a name="input_certificate_x509_store_name"></a> [certificate\_x509\_store\_name](#input\_certificate\_x509\_store\_name) | The X509 Store where the Certificate Exists, such as My. | `string` | `"My"` | no |
| <a name="input_client_application_id"></a> [client\_application\_id](#input\_client\_application\_id) | The Azure Active Directory Client ID which should be used for the Client Application. | `string` | n/a | yes |
| <a name="input_client_certificate_common_name"></a> [client\_certificate\_common\_name](#input\_client\_certificate\_common\_name) | The common or subject name of the certificate. | `string` | n/a | yes |
| <a name="input_client_certificate_common_name_certificate_issuer_thumbprint"></a> [client\_certificate\_common\_name\_certificate\_issuer\_thumbprint](#input\_client\_certificate\_common\_name\_certificate\_issuer\_thumbprint) | The Issuer Thumbprint of the Certificate. | `string` | n/a | yes |
| <a name="input_client_certificate_common_name_is_admin"></a> [client\_certificate\_common\_name\_is\_admin](#input\_client\_certificate\_common\_name\_is\_admin) | Does the Client Certificate have Admin Access to the cluster? Non-admin clients can only perform read only operations on the cluster. | `string` | n/a | yes |
| <a name="input_client_certificate_thumbprint"></a> [client\_certificate\_thumbprint](#input\_client\_certificate\_thumbprint) | The Thumbprint associated with the Client Certificate. Does the Client Certificate have Admin Access to the cluster? Non-admin clients can only perform read only operations on the cluster. | `map(any)` | n/a | yes |
| <a name="input_cluster_application_id"></a> [cluster\_application\_id](#input\_cluster\_application\_id) | The Azure Active Directory Cluster Application ID. | `string` | n/a | yes |
| <a name="input_cluster_code_version"></a> [cluster\_code\_version](#input\_cluster\_code\_version) | Required if Upgrade Mode set to Manual, Specifies the Version of the Cluster Code of the cluster | `string` | n/a | yes |
| <a name="input_fabric_settings"></a> [fabric\_settings](#input\_fabric\_settings) | The name of the Fabric Setting, such as Security or Federation.A map containing settings for the specified Fabric Setting. | <pre>list(object({<br>    name = string<br>    parameters = map(string)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "Security",<br>    "parameters": {<br>      "ClusterProtectionLevel": "EncryptAndSign"<br>    }<br>  }<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | RG location in Azure | `string` | n/a | yes |
| <a name="input_management_endpoint"></a> [management\_endpoint](#input\_management\_endpoint) | Specifies the Management Endpoint of the cluster such as http://example.com. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_protected_account_key_name"></a> [protected\_account\_key\_name](#input\_protected\_account\_key\_name) | The protected diagnostics storage key name, such as StorageAccountKey1. | `string` | n/a | yes |
| <a name="input_reliability_level"></a> [reliability\_level](#input\_reliability\_level) | Specifies the Reliability Level of the Cluster. Possible values include None, Bronze, Silver, Gold and Platinum.The Reliability Level of the Cluster depends on the number of nodes in the Cluster: Platinum requires at least 9 VM's, Gold requires at least 7 VM's, Silver requires at least 5 VM's, Bronze requires at least 3 VM's. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_reverse_proxy_certificate_certificate_issuer_thumbprint"></a> [reverse\_proxy\_certificate\_certificate\_issuer\_thumbprint](#input\_reverse\_proxy\_certificate\_certificate\_issuer\_thumbprint) | The Issuer Thumbprint of the Certificate. | `string` | n/a | yes |
| <a name="input_reverse_proxy_certificate_common_names"></a> [reverse\_proxy\_certificate\_common\_names](#input\_reverse\_proxy\_certificate\_common\_names) | The common or subject name of the certificate. | `string` | n/a | yes |
| <a name="input_reverse_proxy_certificate_common_names_x509_store_name"></a> [reverse\_proxy\_certificate\_common\_names\_x509\_store\_name](#input\_reverse\_proxy\_certificate\_common\_names\_x509\_store\_name) | The X509 Store where the Certificate Exists, such as My. | `string` | `"My"` | no |
| <a name="input_reverse_proxy_certificate_thumbprint"></a> [reverse\_proxy\_certificate\_thumbprint](#input\_reverse\_proxy\_certificate\_thumbprint) | The Thumbprint of the Certificate. | `string` | n/a | yes |
| <a name="input_reverse_proxy_certificate_thumbprint_secondary"></a> [reverse\_proxy\_certificate\_thumbprint\_secondary](#input\_reverse\_proxy\_certificate\_thumbprint\_secondary) | The Secondary Thumbprint of the Certificate. | `string` | n/a | yes |
| <a name="input_reverse_proxy_certificate_x509_store_name"></a> [reverse\_proxy\_certificate\_x509\_store\_name](#input\_reverse\_proxy\_certificate\_x509\_store\_name) | The X509 Store where the Certificate Exists, such as My. | `string` | `"My"` | no |
| <a name="input_service_fabric_cluster_name"></a> [service\_fabric\_cluster\_name](#input\_service\_fabric\_cluster\_name) | Name of the Service Fabric Cluster | `string` | n/a | yes |
| <a name="input_service_fabric_cluster_nodes"></a> [service\_fabric\_cluster\_nodes](#input\_service\_fabric\_cluster\_nodes) | One or more node type blocks | <pre>list(object({<br>    name = string<br>    placement_properties = map(string)<br>    capacities           = map(string)<br>    instance_count       = number<br>    is_primary           = bool<br>    is_stateless         = bool<br>    multiple_availability_zones = string<br>    client_endpoint_port = number<br>    http_endpoint_port   = number<br>    durability_level     = string<br>    reverse_proxy_endpoint_port = number <br>    application_ports = list(object({<br>      start_port = number <br>      end_port = number<br>    }))<br>    ephemeral_ports   = list(object({<br>      start_port = number <br>      end_port = number<br>    }))<br>}))</pre> | n/a | yes |
| <a name="input_service_fabric_zonal_upgrade_mode"></a> [service\_fabric\_zonal\_upgrade\_mode](#input\_service\_fabric\_zonal\_upgrade\_mode) | Specifies the logical grouping of VMs in upgrade domains. Possible values are Hierarchical or Parallel. | `string` | `"Hierarchical"` | no |
| <a name="input_storage_account_blob_endpoint"></a> [storage\_account\_blob\_endpoint](#input\_storage\_account\_blob\_endpoint) | The Blob Endpoint of the Storage Account. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the Storage Account where the Diagnostics should be sent to. | `string` | n/a | yes |
| <a name="input_storage_account_queue_endpoint"></a> [storage\_account\_queue\_endpoint](#input\_storage\_account\_queue\_endpoint) | The Queue Endpoint of the Storage Account. | `string` | n/a | yes |
| <a name="input_storage_account_table_endpoint"></a> [storage\_account\_table\_endpoint](#input\_storage\_account\_table\_endpoint) | The Table Endpoint of the Storage Account. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with the resource. | `map(string)` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory Tenant ID. | `string` | n/a | yes |
| <a name="input_upgrade_mode"></a> [upgrade\_mode](#input\_upgrade\_mode) | Specifies the Upgrade Mode of the cluster. Possible values are Automatic or Manual. | `string` | n/a | yes |
| <a name="input_upgrade_policy"></a> [upgrade\_policy](#input\_upgrade\_policy) | n/a | <pre>list(object({<br>    force_restart = string<br>    health_check_retry_timeout = string<br>    health_check_stable_duration = string<br>    health_check_wait_duration = string<br>    upgrade_domain_timeout = string<br>    upgrade_replica_set_check_timeout = string<br>    upgrade_timeout = string<br>    health_policy = list(object({<br>      max_unhealthy_applications_percent = number<br>      max_unhealthy_nodes_percent = number<br>    }))<br>    delta_health_policy = list(object({<br>      max_delta_unhealthy_applications_percent = number<br>      max_delta_unhealthy_nodes_percent = number<br>      max_upgrade_domain_delta_unhealthy_nodes_percent = number<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_vm_image"></a> [vm\_image](#input\_vm\_image) | Image expected for the Service Fabric Cluster, such as Windows | `string` | n/a | yes |
| <a name="input_vmss_zonal_upgrade_mode"></a> [vmss\_zonal\_upgrade\_mode](#input\_vmss\_zonal\_upgrade\_mode) | Specifies the upgrade mode for the virtual machine scale set updates that happen in all availability zones at once. Possible values are Hierarchical or Parallel. | `string` | `"Hierarchical"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The Cluster Endpoint for this Service Fabric Cluster |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | ID of the Service Fabric Cluster |

## Module Usage
```
data "azurerm_client_config" "current" {}

#Reference to module that provisions service fabric cluster
module "service_fabric_cluster_module" {
  source                                                       = "../module"
  resource_group_name                                          = var.resource_group_name
  location                                                     = var.location
  service_fabric_cluster_name                                  = var.service_fabric_cluster_name
  reliability_level                                            = var.reliability_level
  management_endpoint                                          = var.management_endpoint
  upgrade_mode                                                 = var.upgrade_mode
  vm_image                                                     = var.vm_image
  cluster_code_version                                         = var.cluster_code_version
  add_on_features                                              = var.add_on_features
  service_fabric_zonal_upgrade_mode                            = var.service_fabric_zonal_upgrade_mode
  vmss_zonal_upgrade_mode                                      = var.vmss_zonal_upgrade_mode
  tenant_id                                                    = data.azurerm_client_config.current.tenant_id
  cluster_application_id                                       = var.cluster_application_id
  client_application_id                                        = var.client_application_id
  certificate_common_name                                      = var.certificate_common_name
  certificate_issuer_thumbprint                                = var.certificate_issuer_thumbprint
  certificate_common_names_x509_store_name                     = var.certificate_common_names_x509_store_name
  certificate_thumbprint                                       = var.certificate_thumbprint
  certificate_thumbprint_secondary                             = var.certificate_thumbprint_secondary
  certificate_x509_store_name                                  = var.certificate_x509_store_name
  reverse_proxy_certificate_thumbprint                         = var.reverse_proxy_certificate_thumbprint
  reverse_proxy_certificate_thumbprint_secondary               = var.reverse_proxy_certificate_thumbprint_secondary
  reverse_proxy_certificate_x509_store_name                    = var.reverse_proxy_certificate_x509_store_name
  reverse_proxy_certificate_common_names                       = var.reverse_proxy_certificate_common_names
  reverse_proxy_certificate_common_names_x509_store_name       = var.reverse_proxy_certificate_common_names_x509_store_name
  reverse_proxy_certificate_certificate_issuer_thumbprint      = var.reverse_proxy_certificate_certificate_issuer_thumbprint
  client_certificate_thumbprint                                = var.client_certificate_thumbprint
  client_certificate_common_name                               = var.client_certificate_common_name
  client_certificate_common_name_certificate_issuer_thumbprint = var.client_certificate_common_name_certificate_issuer_thumbprint
  client_certificate_common_name_is_admin                      = var.client_certificate_common_name_is_admin
  storage_account_name                                         = var.storage_account_name
  protected_account_key_name                                   = var.protected_account_key_name
  storage_account_blob_endpoint                                = var.storage_account_blob_endpoint
  storage_account_queue_endpoint                               = var.storage_account_queue_endpoint
  storage_account_table_endpoint                               = var.storage_account_table_endpoint
  fabric_settings                                              = var.fabric_settings
  service_fabric_cluster_nodes                                 = var.service_fabric_cluster_nodes
  upgrade_policy                                               = var.upgrade_policy
  tags                                                         = var.tags
}
```

### Points to be noted :
* If you want to make use of any certificate block(be it client certificate, reverse proxy certificate or common names certificates etc) then an azure keyvault resource is required (can create the resource in the module itself or create it on the portal and pass the values here). Make sure to enable access to Azure Virtual Machines for deployment and then create or save the certificate in keyvault.

* If you want to enable diagnostics config of service fabric cluster then the storage account resource is required. (Required values: Storage account name, protected key account, blob endpoint, queue endpoint and table endpoint)

* If you want to add nodes in your Service Fabric Cluster then create a Virtual machine scale set and add an extension of type ServiceFabricNode with clusterendpoint and certificate values in the settings part. Nodes cannot be added with service fabric cluster resource in terraform.

## Service Fabric Cluster : MSDOC
* Please refer this link to explore more about Azure Service Fabric Cluster: [Service_Fabric_Cluster](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-overview)

## Service Fabric Cluster : Terraform
* Please refer this link to understand more about Azure Service Fabric Cluster configurations through terraform: [Service_Fabric_Cluster_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_fabric_cluster#example-usage)

<!-- END_TF_DOCS -->