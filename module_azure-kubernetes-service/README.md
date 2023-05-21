<!-- BEGIN_TF_DOCS -->
#### last updated : 30/08/22

## Introduction :
* By default all the dynamic blocks are optional except the default node pool block .

* Inside node pools we can create multiple nodes and node can be of vmss or availability type.

* If network_profile is not defined, kubenet profile will be used by default and Kubenet is a very basic, simple network plugin, on Linux only.If we want to use Windows OS as agent, use advanced network plugin, such as Azure-CNI--> (windows_profile block can only be set if network_plugin type is ```azure ``` or ```none ```)

* One of dns_prefix or dns_prefix_private_cluster must be specified.

* If network_profile is not defined, kubenet profile will be used by default.

* Microsoft defender ,oidc_issuer_enabled,private_cluster_public_fqdn_enabled,http_proxy_config ---this requires that the Preview Feature should be enabled for all these arguments .

* In aci_connector_linux block for getting the subnet name ,add a delegation to the subnet ->"Microsoft.ContainerInstance/containerGroups".

* If network_policy = "kubenet" then  assign the role to managed identity as “role_definition_name = "Managed Identity Operator" .

* Only one of `identity,service_principal` can be specified at a time.



## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.additional](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools) | want to create additional node pools | <pre>map(object({<br>    vm_size                      = string<br>    availability_zones           = list(number)<br>    node_count                   = number<br>    enable_auto_scaling          = bool<br>    min_count                    = number<br>    max_count                    = number<br>    enable_host_encryption       = bool<br>    enable_node_public_ip        = bool<br>    max_pods                     = number<br>    node_labels                  = map(string)<br>    only_critical_addons_enabled = bool<br>    orchestrator_version         = number<br>    os_disk_size_gb              = number<br>    os_disk_type                 = string<br>    type                         = string<br>    tags                         = map(any)<br>    subnet_id                       = string # must be a key from node_pool_subnets variable<br>    //max_surge                    = "1"<br>    os_type                      = string<br>  }))</pre> | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username of the local administrator to be created on the Kubernetes cluster. Set this variable to `null` to turn off the cluster's `linux_profile`. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_agents_availability_zones"></a> [agents\_availability\_zones](#input\_agents\_availability\_zones) | (Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created. | `list(string)` | `null` | no |
| <a name="input_agents_count"></a> [agents\_count](#input\_agents\_count) | The number of Agents that should exist in the Agent Pool. Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes. | `number` | `2` | no |
| <a name="input_agents_labels"></a> [agents\_labels](#input\_agents\_labels) | (Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created. | `map(string)` | `{}` | no |
| <a name="input_agents_max_count"></a> [agents\_max\_count](#input\_agents\_max\_count) | Maximum number of nodes in a pool | `number` | `6` | no |
| <a name="input_agents_max_pods"></a> [agents\_max\_pods](#input\_agents\_max\_pods) | (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created. | `number` | `79` | no |
| <a name="input_agents_min_count"></a> [agents\_min\_count](#input\_agents\_min\_count) | Minimum number of nodes in a pool | `number` | `1` | no |
| <a name="input_agents_pool_name"></a> [agents\_pool\_name](#input\_agents\_pool\_name) | The default Azure AKS agentpool (nodepool) name. | `string` | `"nodepool"` | no |
| <a name="input_agents_size"></a> [agents\_size](#input\_agents\_size) | The default virtual machine size for the Kubernetes agents | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_agents_tags"></a> [agents\_tags](#input\_agents\_tags) | (Optional) A mapping of tags to assign to the Node Pool. | `map(string)` | `{}` | no |
| <a name="input_agents_type"></a> [agents\_type](#input\_agents\_type) | (Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. | `string` | `"VirtualMachineScaleSets"` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | (Optional) The IP ranges to allow for incoming traffic to the server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaler_profile"></a> [auto\_scaler\_profile](#input\_auto\_scaler\_profile) | n/a | <pre>object({<br>      balance_similar_node_groups      = bool<br>      expander                         = string<br>      max_graceful_termination_sec     = number<br>      max_node_provisioning_time       = string<br>      max_unready_nodes                = number<br>      max_unready_percentage           = number<br>      new_pod_scale_up_delay           = string<br>      scale_down_delay_after_add       = string<br>      scale_down_delay_after_delete    = string<br>      scale_down_delay_after_failure   = string<br>      scan_interval                    = string<br>      scale_down_unneeded              = string<br>      scale_down_unready               = string<br>      scale_down_utilization_threshold = number<br>      empty_bulk_delete_max            = number<br>      skip_nodes_with_local_storage    = bool<br>      skip_nodes_with_system_pods      = bool<br>  })</pre> | <pre>{<br>  "balance_similar_node_groups": false,<br>  "empty_bulk_delete_max": 10,<br>  "expander": "random",<br>  "max_graceful_termination_sec": 600,<br>  "max_node_provisioning_time": "15m",<br>  "max_unready_nodes": 3,<br>  "max_unready_percentage": 45,<br>  "new_pod_scale_up_delay": "10s",<br>  "scale_down_delay_after_add": "10m",<br>  "scale_down_delay_after_delete": "10s",<br>  "scale_down_delay_after_failure": "3m",<br>  "scale_down_unneeded": "10m",<br>  "scale_down_unready": "20m",<br>  "scale_down_utilization_threshold": 0.5,<br>  "scan_interval": "10s",<br>  "skip_nodes_with_local_storage": true,<br>  "skip_nodes_with_system_pods": true<br>}</pre> | no |
| <a name="input_automatic_channel_upgrade"></a> [automatic\_channel\_upgrade](#input\_automatic\_channel\_upgrade) | (OPtional) the upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable | `string` | `null` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Enable Azure Policy Addon. | `bool` | `false` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | (Optional) The Client ID (appId) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | (Optional) The Client Secret (password) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_cluster_log_analytics_workspace_name"></a> [cluster\_log\_analytics\_workspace\_name](#input\_cluster\_log\_analytics\_workspace\_name) | (Optional) The name of the Analytics workspace | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | (Optional) The name for the AKS resources created in the specified Azure Resource Group. This variable overwrites the 'prefix' var (The 'prefix' var will still be applied to the dns\_prefix if it is set) | `string` | n/a | yes |
| <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id) | (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_dns_prefix_private_cluster"></a> [dns\_prefix\_private\_cluster](#input\_dns\_prefix\_private\_cluster) | (optional) Specifies the DNS prefix to use with private clusters | `string` | `""` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable node pool autoscaling | `bool` | `true` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Enable Host Encryption for default node pool. Encryption at host feature must be enabled on the subscription: https://docs.microsoft.com/azure/virtual-machines/linux/disks-enable-host-based-encryption-cli | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | (Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false. | `bool` | `false` | no |
| <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy) | The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. | `string` | `null` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Enable HTTP Application Routing Addon (forces recreation). | `bool` | `false` | no |
| <a name="input_http_proxy_config"></a> [http\_proxy\_config](#input\_http\_proxy\_config) | n/a | <pre>map(object({<br>    http_proxy= string<br>    https_proxy= string<br>    no_proxy=list(string)<br>    trusted_ca= string<br>  }))</pre> | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kubernetes Cluster. | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`(to enable both). If `UserAssigned` or `SystemAssigned, UserAssigned` is set, an `identity_ids` must be set as well. | `string` | `"SystemAssigned"` | no |
| <a name="input_ingress_application_gateway_enabled"></a> [ingress\_application\_gateway\_enabled](#input\_ingress\_application\_gateway\_enabled) | Whether to deploy the Application Gateway ingress controller to this Kubernetes Cluster? | `bool` | `false` | no |
| <a name="input_ingress_application_gateway_id"></a> [ingress\_application\_gateway\_id](#input\_ingress\_application\_gateway\_id) | The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_name"></a> [ingress\_application\_gateway\_name](#input\_ingress\_application\_gateway\_name) | The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_subnet_cidr"></a> [ingress\_application\_gateway\_subnet\_cidr](#input\_ingress\_application\_gateway\_subnet\_cidr) | The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_subnet_id"></a> [ingress\_application\_gateway\_subnet\_id](#input\_ingress\_application\_gateway\_subnet\_id) | The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_key_vault_secrets_provider_enabled"></a> [key\_vault\_secrets\_provider\_enabled](#input\_key\_vault\_secrets\_provider\_enabled) | (Optional) Whether to use the Azure Key Vault Provider for Secrets Store CSI Driver in an AKS cluster. For more details: https://docs.microsoft.com/en-us/azure/aks/csi-secrets-store-driver | `bool` | `false` | no |
| <a name="input_kubelet_config"></a> [kubelet\_config](#input\_kubelet\_config) | (Optional)block for kublet | <pre>map(object({<br>        allowed_unsafe_sysctls    = list(string)<br>        container_log_max_line    = number<br>        container_log_max_size_mb = string<br>        cpu_cfs_quota_enabled     = bool<br>        cpu_cfs_quota_period      = string<br>        cpu_manager_policy        = string<br>        image_gc_high_threshold   = number<br>        image_gc_low_threshold    = number<br>        pod_max_pid               = number<br>        topology_manager_policy   = string<br>  }))</pre> | `null` | no |
| <a name="input_kubelet_identity"></a> [kubelet\_identity](#input\_kubelet\_identity) | (Optional block) | `map(map(string))` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Specify which Kubernetes release to use. The default used is the latest Kubernetes version available in the region | `string` | `null` | no |
| <a name="input_linux_os_config"></a> [linux\_os\_config](#input\_linux\_os\_config) | (Optional) block inside node pool | <pre>map(object({<br>    allowed_unsafe_sysctls=number<br>    sysctl_config=map(any)<br>    transparent_huge_page_defrag  = string<br>    transparent_huge_page_enabled = string <br>  }))</pre> | `null` | no |
| <a name="input_linux_os_config_additional"></a> [linux\_os\_config\_additional](#input\_linux\_os\_config\_additional) | for addtitionl node pools | <pre>map(object({<br>  swap_file_size_mb = number<br>  transparent_huge_page_defrag  = string<br>  transparent_huge_page_enabled = string<br>  sysctl_config=map(any)<br>}))</pre> | `null` | no |
| <a name="input_load_balancer_profile"></a> [load\_balancer\_profile](#input\_load\_balancer\_profile) | Optional -block for load balancer profile in network profile | <pre>map(object({<br>          idle_timeout_in_minutes   = number<br>          managed_outbound_ip_count = number<br>          outbound_ip_prefix_ids    = number<br>          outbound_ip_address_ids   = string<br>          outbound_ports_allocated  = number<br>          <br>   }))</pre> | `null` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | (Optional) - If `true` local accounts will be disabled. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information. | `bool` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of cluster, if not defined it will be read from the resource-group | `string` | `null` | no |
| <a name="input_log_analytics_solution_id"></a> [log\_analytics\_solution\_id](#input\_log\_analytics\_solution\_id) | (Optional) Existing azurerm\_log\_analytics\_solution ID. Providing ID disables creation of azurerm\_log\_analytics\_solution. | `string` | `null` | no |
| <a name="input_log_analytics_workspace"></a> [log\_analytics\_workspace](#input\_log\_analytics\_workspace) | (Optional) Existing azurerm\_log\_analytics\_workspace to attach azurerm\_log\_analytics\_solution. Providing the config disables creation of azurerm\_log\_analytics\_workspace. | <pre>map(object({<br>    id   = string<br>    name = string<br>  }))</pre> | `null` | no |
| <a name="input_log_analytics_workspace_enabled"></a> [log\_analytics\_workspace\_enabled](#input\_log\_analytics\_workspace\_enabled) | Enable the integration of azurerm\_log\_analytics\_workspace and azurerm\_log\_analytics\_solution: https://docs.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-onboard | `bool` | `true` | no |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | (Optional) Resource group name to create azurerm\_log\_analytics\_solution. | `string` | `null` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018 | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | The retention period for the logs in days | `number` | `30` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | n/a | <pre>object({<br>    allowed=object({<br>          day   = string<br>          hours = list(number)<br>    })<br>    not_allowed=object({<br>        end = string<br>        start =string<br>    })<br>  })</pre> | <pre>{<br>  "allowed": {<br>    "day": "Sunday",<br>    "hours": [<br>      1,<br>      2<br>    ]<br>  },<br>  "not_allowed": null<br>}</pre> | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Should this Node Pool be used for System or User resources? | `string` | `null` | no |
| <a name="input_nat_gateway_profile"></a> [nat\_gateway\_profile](#input\_nat\_gateway\_profile) | (optional) part of network profile | `map(number)` | `null` | no |
| <a name="input_net_profile_dns_service_ip"></a> [net\_profile\_dns\_service\_ip](#input\_net\_profile\_dns\_service\_ip) | (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_net_profile_docker_bridge_cidr"></a> [net\_profile\_docker\_bridge\_cidr](#input\_net\_profile\_docker\_bridge\_cidr) | (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_net_profile_outbound_type"></a> [net\_profile\_outbound\_type](#input\_net\_profile\_outbound\_type) | (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer. | `string` | `"loadBalancer"` | no |
| <a name="input_net_profile_pod_cidr"></a> [net\_profile\_pod\_cidr](#input\_net\_profile\_pod\_cidr) | (Optional) The CIDR to use for pod IP addresses. This field can only be set when network\_plugin is set to kubenet. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_net_profile_service_cidr"></a> [net\_profile\_service\_cidr](#input\_net\_profile\_service\_cidr) | (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Network plugin to use for networking. | `string` | `"kubenet"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_node_taints"></a> [node\_taints](#input\_node\_taints) | A list of Kubernetes taints which should be applied to nodes in the agent pool | `list(string)` | `null` | no |
| <a name="input_oidc_issuer_enabled"></a> [oidc\_issuer\_enabled](#input\_oidc\_issuer\_enabled) | Enable or Disable the OIDC issuer URL. Defaults to false. | `bool` | `false` | no |
| <a name="input_oms_agent"></a> [oms\_agent](#input\_oms\_agent) | n/a | `map(string)` | n/a | yes |
| <a name="input_only_critical_addons_enabled"></a> [only\_critical\_addons\_enabled](#input\_only\_critical\_addons\_enabled) | (Optional) Enabling this option will taint default node pool with `CriticalAddonsOnly=true:NoSchedule` taint. Changing this forces a new resource to be created. | `bool` | `null` | no |
| <a name="input_open_service_mesh_enabled"></a> [open\_service\_mesh\_enabled](#input\_open\_service\_mesh\_enabled) | Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about). | `bool` | `null` | no |
| <a name="input_orchestrator_version"></a> [orchestrator\_version](#input\_orchestrator\_version) | Specify which Kubernetes release to use for the orchestration layer. The default used is the latest Kubernetes version available in the region | `string` | `null` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | Disk size of nodes in GBs. | `number` | `50` | no |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this forces a new resource to be created. | `string` | `"Managed"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) The prefix for the resources created in the specified Azure Resource Group | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool | `string` | `null` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | If true cluster API server will be exposed only on internal IP address and available only in cluster vnet. | `bool` | `false` | no |
| <a name="input_private_cluster_public_fqdn_enabled"></a> [private\_cluster\_public\_fqdn\_enabled](#input\_private\_cluster\_public\_fqdn\_enabled) | (Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | (Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, `System` to have AKS manage this or `None`. In case of `None` you will need to bring your own DNS server and set up resolving, otherwise cluster will have issues after provisioning. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_proximity_placement_group_id"></a> [proximity\_placement\_group\_id](#input\_proximity\_placement\_group\_id) | The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this Kubernetes Cluster | `bool` | `true` | no |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | A custom ssh key to control access to the AKS cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID of groups with admin access. | `list(string)` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | (Optional) Is Role Based Access Control based on Azure AD enabled? | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | The Client ID of an Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Is the Azure Active Directory integration Managed, meaning that Azure will create/manage the Service Principal used for integration. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | The Server ID of an Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | The Server Secret of an Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | (Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name to be imported | `string` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Enable Role Based Access Control. | `bool` | `false` | no |
| <a name="input_run_command_enabled"></a> [run\_command\_enabled](#input\_run\_command\_enabled) | Whether to enable run command for the cluster or not | `bool` | `true` | no |
| <a name="input_secret_rotation_enabled"></a> [secret\_rotation\_enabled](#input\_secret\_rotation\_enabled) | Is secret rotation enabled? This variable is only used when `key_vault_secrets_provider_enabled` is `true` and defaults to `false` | `bool` | `false` | no |
| <a name="input_secret_rotation_interval"></a> [secret\_rotation\_interval](#input\_secret\_rotation\_interval) | The interval to poll for secret rotation. This attribute is only set when `secret_rotation` is `true` and defaults to `2m` | `string` | `"2m"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid | `string` | `"Free"` | no |
| <a name="input_spot_max_price"></a> [spot\_max\_price](#input\_spot\_max\_price) | The maximum price you're willing to pay in USD per Virtual Machine | `number` | `null` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | name of subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags that should be present on the AKS cluster resources | `map(string)` | `{}` | no |
| <a name="input_upgrade_settings"></a> [upgrade\_settings](#input\_upgrade\_settings) | optional block in node pool | `map(map(number))` | `null` | no |
| <a name="input_upgrade_settings_additional"></a> [upgrade\_settings\_additional](#input\_upgrade\_settings\_additional) | optional block in node pool | `map(map(number))` | `null` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_windows_profile"></a> [windows\_profile](#input\_windows\_profile) | n/a | `map(string)` | <pre>{<br>  "admin_password": "sfsfasfa@Safc4557g344",<br>  "admin_username": "fcasfaw6788",<br>  "license": "Windows_Server"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aci_connector_linux"></a> [aci\_connector\_linux](#output\_aci\_connector\_linux) | The `aci_connector_linux` block of `azurerm_kubernetes_cluster` resource. |
| <a name="output_aci_connector_linux_enabled"></a> [aci\_connector\_linux\_enabled](#output\_aci\_connector\_linux\_enabled) | Has `aci_connector_linux` been enabled on the `azurerm_kubernetes_cluster` resource? |
| <a name="output_admin_client_certificate"></a> [admin\_client\_certificate](#output\_admin\_client\_certificate) | The `client_certificate` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block.  Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_aks_id"></a> [aks\_id](#output\_aks\_id) | The `azurerm_kubernetes_cluster`'s id. |
| <a name="output_azure_policy_enabled"></a> [azure\_policy\_enabled](#output\_azure\_policy\_enabled) | The `azurerm_kubernetes_cluster`'s `azure_policy_enabled` argument. Should the Azure Policy Add-On be enabled? For more details please visit [Understand Azure Policy for Azure Kubernetes Service](https://docs.microsoft.com/en-ie/azure/governance/policy/concepts/rego-for-aks) |
| <a name="output_cluster_identity"></a> [cluster\_identity](#output\_cluster\_identity) | The `azurerm_kubernetes_cluster`'s `identity` block. |
| <a name="output_host"></a> [host](#output\_host) | The `host` in the `azurerm_kubernetes_cluster`'s `kube_config` block. The Kubernetes cluster server host. |
| <a name="output_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#output\_http\_application\_routing\_enabled) | The `azurerm_kubernetes_cluster`'s `http_application_routing_enabled` argument. (Optional) Should HTTP Application Routing be enabled? |
| <a name="output_ingress_application_gateway"></a> [ingress\_application\_gateway](#output\_ingress\_application\_gateway) | The `azurerm_kubernetes_cluster`'s `ingress_application_gateway` block. |
| <a name="output_ingress_application_gateway_enabled"></a> [ingress\_application\_gateway\_enabled](#output\_ingress\_application\_gateway\_enabled) | Has the `azurerm_kubernetes_cluster` turned on `ingress_application_gateway` block? |
| <a name="output_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#output\_key\_vault\_secrets\_provider) | The `azurerm_kubernetes_cluster`'s `key_vault_secrets_provider` block. |
| <a name="output_key_vault_secrets_provider_enabled"></a> [key\_vault\_secrets\_provider\_enabled](#output\_key\_vault\_secrets\_provider\_enabled) | Has the `azurerm_kubernetes_cluster` turned on `key_vault_secrets_provider` block? |
| <a name="output_kube_admin_config_raw"></a> [kube\_admin\_config\_raw](#output\_kube\_admin\_config\_raw) | The `azurerm_kubernetes_cluster`'s `kube_admin_config_raw` argument. Raw Kubernetes config for the admin account to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled. |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | The `azurerm_kubernetes_cluster`'s `kube_config_raw` argument. Raw Kubernetes config to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. |
| <a name="output_kubelet_identity"></a> [kubelet\_identity](#output\_kubelet\_identity) | The `azurerm_kubernetes_cluster`'s `kubelet_identity` block. |
| <a name="output_location"></a> [location](#output\_location) | The `azurerm_kubernetes_cluster`'s `location` argument. (Required) The location where the Managed Kubernetes Cluster should be created. |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | The OIDC issuer URL that is associated with the cluster. |
| <a name="output_oms_agent"></a> [oms\_agent](#output\_oms\_agent) | The `azurerm_kubernetes_cluster`'s `oms_agent` argument. |
| <a name="output_oms_agent_enabled"></a> [oms\_agent\_enabled](#output\_oms\_agent\_enabled) | Has the `azurerm_kubernetes_cluster` turned on `oms_agent` block? |
| <a name="output_open_service_mesh_enabled"></a> [open\_service\_mesh\_enabled](#output\_open\_service\_mesh\_enabled) | (Optional) Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about). |
| <a name="output_password"></a> [password](#output\_password) | The `password` in the `azurerm_kubernetes_cluster`'s `kube_config` block. A password or token used to authenticate to the Kubernetes cluster. |
| <a name="output_username"></a> [username](#output\_username) | The `username` in the `azurerm_kubernetes_cluster`'s `kube_config` block. A username used to authenticate to the Kubernetes cluster. |


## Module Usage 

```
#Reference to the kubernetes service creation module
module "kubernetes_service" {
  source              = "../../modules/module_azure-kubernetes-service/kubernetes"
  resource_group_name = var.resource_group_name
  location            = var.location

  cluster_name = var.cluster_name

  api_server_authorized_ip_ranges     = var.api_server_authorized_ip_ranges
  azure_policy_enabled                = var.azure_policy_enabled
  disk_encryption_set_id              = var.disk_encryption_set_id
  prefix                              = var.prefix
  http_application_routing_enabled    = var.http_application_routing_enabled
  kubernetes_version                  = var.kubernetes_version
  local_account_disabled              = var.local_account_disabled
  node_resource_group                 = var.node_resource_group
  oidc_issuer_enabled                 = var.oidc_issuer_enabled
  open_service_mesh_enabled           = var.open_service_mesh_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  role_based_access_control_enabled   = var.role_based_access_control_enabled
  sku_tier                            = var.sku_tier
  agents_pool_name                    = var.agents_pool_name
  agents_size                         = var.agents_size
  enable_auto_scaling                 = var.enable_auto_scaling
  enable_host_encryption              = var.enable_host_encryption
  enable_node_public_ip               = var.enable_node_public_ip
  agents_max_count                    = var.agents_max_count
  agents_max_pods                     = var.agents_max_pods
  agents_min_count                    = var.agents_min_count
  agents_count                        = var.agents_count
  agents_labels                       = var.agents_labels
  only_critical_addons_enabled        = var.only_critical_addons_enabled
  orchestrator_version                = var.orchestrator_version
  os_disk_size_gb                     = var.os_disk_size_gb
  os_disk_type                        = var.os_disk_type
  tags                                = var.tags
  agents_type                         = var.agents_type
  vnet_subnet_id                      = var.vnet_subnet_id
  agents_availability_zones           = var.agents_availability_zones
  rbac_aad_admin_group_object_ids     = var.rbac_aad_admin_group_object_ids
  rbac_aad_azure_rbac_enabled         = var.rbac_aad_azure_rbac_enabled

  rbac_aad_tenant_id = var.rbac_aad_tenant_id
  identity_type      = var.identity_type
  identity_ids       = var.identity_ids

  ingress_application_gateway_id          = var.ingress_application_gateway_id
  ingress_application_gateway_name        = var.ingress_application_gateway_name
  ingress_application_gateway_subnet_cidr = var.ingress_application_gateway_subnet_cidr
  ingress_application_gateway_subnet_id   = var.ingress_application_gateway_subnet_id

  secret_rotation_enabled  = var.secret_rotation_enabled
  secret_rotation_interval = var.secret_rotation_interval
  subnet_name              = var.subnet_name
  admin_username           = var.admin_username

  network_plugin                 = var.network_plugin
  net_profile_dns_service_ip     = var.net_profile_dns_service_ip
  net_profile_docker_bridge_cidr = var.net_profile_docker_bridge_cidr
  network_policy                 = var.network_policy
  net_profile_outbound_type      = var.net_profile_outbound_type
  net_profile_pod_cidr           = var.net_profile_pod_cidr
  net_profile_service_cidr       = var.net_profile_service_cidr

  client_id           = var.client_id
  kubelet_identity_enabled     = var.kubelet_identity_enabled
  object_id                    = var.object_id
  client_secret       = var.client_secret
  oms_agent           = var.oms_agent
  nat_gateway_profile = var.nat_gateway_profile
  public_ssh_key      = var.public_ssh_key
  additional_node_pools        = var.additional_node_pools
  node_taints                  = var.node_taints
  eviction_policy              = var.eviction_policy
  proximity_placement_group_id = var.proximity_placement_group_id
  spot_max_price               = var.spot_max_price
  priority                     = var.priority
  mode                         = var.mode
}

```
<!-- END_TF_DOCS -->