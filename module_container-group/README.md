<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 09/11/2022
## Introduction

Manages as an Azure Container Group instance.

## File Structure 

This particular module is having the following configuration files.
- containergroup.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in containergroup.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group
3. Container instances
4. Container registry

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.28.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_group.container_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_config"></a> [container\_config](#input\_container\_config) | The definition of a container that is part of the group. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>gpu</i></b></li> <li><b><i>cpu_limit</i></b></li> <li><b><i>memory_limit</i></b></li> <li><b><i>gpu_limit</i></b></li> <li><b><i>ports</i></b></li> <li><b><i>environment_variables</i></b></li> <li><b><i>secure_environment_variables</i></b></li> <li><b><i>readiness_probe</i></b></li> <li><b><i>liveness_probe</i></b></li> <li><b><i>commands</i></b></li> <li><b><i>volume</i></b></li>| <pre>list(object({<br>    name = string<br>    image = string<br>    cpu = number<br>    memory = number<br>    gpu = list(object({<br>      count = number<br>      sku = string<br>    }))<br>    cpu_limit = number<br>    memory_limit = number<br>    gpu_limit = list(object({<br>      count = number<br>      sku = string<br>    }))<br>    ports = list(object({<br>      port = number<br>      protocol = string<br>    }))<br>    environment_variables = map(string)<br>    secure_environment_variables = map(string)<br>    readiness_probe = list(object({<br>      //one and only one of exec and http_get can be specified <br>      exec = list(string)<br>      /*http_get = list(object({<br>        path = string<br>        port = number<br>        scheme = string<br>        http_headers = map(string)<br>      }))*/<br>      initial_delay_seconds = number<br>      period_seconds = number<br>      failure_threshold = number<br>      success_threshold = number<br>      timeout_seconds = number<br>    }))<br>    liveness_probe = list(object({<br>      //one and only one of exec and http_get can be specified <br>      //exec = list(string)<br>      http_get = list(object({<br>        path = string<br>        port = number<br>        scheme = string<br>        http_headers = map(string)<br>      }))<br>      initial_delay_seconds = number<br>      period_seconds = number<br>      failure_threshold = number<br>      success_threshold = number<br>      timeout_seconds = number<br>    }))<br>    commands = list(string)<br>    volume = list(object({<br>      name = string<br>        mount_path = string<br>        read_only = bool<br>        empty_dir = bool<br>        storage_account_name = string<br>        storage_account_key = string<br>        share_name = string<br>        git_repo = list(object({<br>            url = string<br>            directory = string<br>            revision = string<br>        }))<br>        secret = map(string)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_diagnostics_config"></a> [diagnostics\_config](#input\_diagnostics\_config) | The definition of the diagnostic settings that are part of the group. It is mandatory to pass all the arguments in the object. | <pre>list(object({<br>    log_analytics = list(object({<br>      log_type = string<br>      workspace_id = string<br>      workspace_key = string<br>      metadata = map(string)<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_dns_config_config"></a> [dns\_config\_config](#input\_dns\_config\_config) | The definition of the DNS configuration settings that are part of the group. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>search_domains</i></b></li> <li><b><i>options</i></b></li> | <pre>list(object({<br>    nameservers = list(string)<br>    search_domains = list(string)<br>    options = list(string)<br>  }))</pre> | n/a | no |
| <a name="input_dns_name_label"></a> [dns\_name\_label](#input\_dns\_name\_label) | The DNS label/name for the container group's IP. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_dns_name_label_reuse_policy"></a> [dns\_name\_label\_reuse\_policy](#input\_dns\_name\_label\_reuse\_policy) | The value representing the security enum. Noreuse, ResourceGroupReuse, SubscriptionReuse, TenantReuse or Unsecure. Changing this forces a new resource to be created. | `string` | `"Unsecure"` | no |
| <a name="input_exposed_port_config"></a> [exposed\_port\_config](#input\_exposed\_port\_config) | The definition of the exposed port settings that is part of the group. It is mandatory to pass all the arguments in the object. | <pre>list(object({<br>    port = number<br>    protocol = string<br>  }))</pre> | n/a | no |
| <a name="input_identity_config"></a> [identity\_config](#input\_identity\_config) | Managed Service Identity configuration. It is mandatory to pass all the arguments in the object. It is required when type is set to UserAssigned or SystemAssigned, UserAssigned, otherwise please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>identity_ids</i></b></li>. | <pre>list(object({<br>    type = string<br>    identity_ids = list(string)<br>  }))</pre> | n/a | no |
| <a name="input_image_registry_credential_config"></a> [image\_registry\_credential\_config](#input\_image\_registry\_credential\_config) | Settings for connecting to the image registry. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>user_assigned_identity_id</i></b></li> <li><b><i>username</i></b></li> <li><b><i>password</i></b></li> | <pre>list(object({<br>    user_assigned_identity_id = string<br>    username = string<br>    password = string<br>    server = string<br>  }))</pre> | n/a | no |
| <a name="input_init_container_config"></a> [init\_container\_config](#input\_init\_container\_config) | The definition of an init container that is part of the group. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>environment_variables</i></b></li> <li><b><i>secure_environment_variables</i></b></li> <li><b><i>commands</i></b></li> <li><b><i>volume</i></b></li> | <pre>list(object({<br>    name = string<br>    image = string<br>    environment_variables = map(string)<br>    secure_environment_variables = map(string)<br>    commands = list(string)<br>    volume = list(object({<br>        name = string<br>        mount_path = string<br>        read_only = bool<br>        empty_dir = bool<br>        storage_account_name = string<br>        storage_account_key = string<br>        share_name = string<br>        git_repo = list(object({<br>            url = string<br>            directory = string<br>            revision = string<br>        }))<br>        secret = map(string)<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | Specifies the IP address type of the container. Public, Private or None. Changing this forces a new resource to be created. If set to Private, subnet\_ids also needs to be set. If set to Public, dns\_name\_label and dns\_name\_label\_reuse\_policy also needs to be set. | `string` | n/a | no |
| <a name="input_key_vault_key_id"></a> [key\_vault\_key\_id](#input\_key\_vault\_key\_id) | The Key Vault key URI for CMK encryption. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Container Group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The OS for the container group. Allowed s are Linux and Windows. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Container Group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_restart_policy"></a> [restart\_policy](#input\_restart\_policy) | Restart policy for the container group. Allowed values are Always, Never, OnFailure. Changing this forces a new resource to be created. | `string` | `"Always"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet resource IDs for a container group. Changing this forces a new resource to be created. | `list(string)` | n/a | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | no |
| <a name="input_zones"></a> [zones](#input\_zones) | A list of Availability Zones in which this Container Group is located. | `list(string)` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_group_gqdn"></a> [container\_group\_gqdn](#output\_container\_group\_gqdn) | The FQDN of the container group derived from dns\_name\_label. |
| <a name="output_container_group_id"></a> [container\_group\_id](#output\_container\_group\_id) | The ID of the Container Group. |
| <a name="output_container_group_identity_principal_id"></a> [container\_group\_identity\_principal\_id](#output\_container\_group\_identity\_principal\_id) | The Principal ID associated with this Managed Service Identity. |
| <a name="output_container_group_identity_tenant_id"></a> [container\_group\_identity\_tenant\_id](#output\_container\_group\_identity\_tenant\_id) | The Tenant ID associated with this Managed Service Identity. |
| <a name="output_container_group_ip_address"></a> [container\_group\_ip\_address](#output\_container\_group\_ip\_address) | The IP address allocated to the container group. |

## Module Usage

```
module "container_group_module" {
  source              = "../../modules/module_container-group"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  identity_config = [{
    type         = var.identity_config.0.type
    identity_ids = var.identity_config.0.identity_ids
  }]

  init_container_config = [{
    name                         = var.init_container_config.0.name
    image                        = var.init_container_config.0.image
    environment_variables        = var.init_container_config.0.secure_environment_variables
    secure_environment_variables = var.init_container_config.0.environment_variables
    commands                     = var.init_container_config.0.commands
    volume = [{
      name                 = var.init_container_config.0.volume.0.name
      mount_path           = var.init_container_config.0.volume.0.mount_path
      read_only            = var.init_container_config.0.volume.0.read_only
      empty_dir            = var.init_container_config.0.volume.0.empty_dir
      storage_account_name = var.init_container_config.0.volume.0.storage_account_name
      storage_account_key  = var.init_container_config.0.volume.0.storage_account_key
      share_name           = var.init_container_config.0.volume.0.share_name
      git_repo = [{
        url       = var.init_container_config.0.volume.0.git_repo.0.url
        directory = var.init_container_config.0.volume.0.git_repo.0.directory
        revision  = var.init_container_config.0.volume.0.git_repo.0.revision
      }]
      secret = var.init_container_config.0.volume.0.secret
    }]
  }]

  container_config = [{
    name   = var.container_config.0.name
    image  = var.container_config.0.image
    cpu    = var.container_config.0.cpu
    memory = var.container_config.0.memory
    gpu = [{
      count = var.container_config.0.gpu.0.count
      sku   = var.container_config.0.gpu.0.sku
    }]
    cpu_limit    = var.container_config.0.cpu_limit
    memory_limit = var.container_config.0.memory_limit
    gpu_limit = [{
      count = var.container_config.0.gpu_limit.0.count
      sku   = var.container_config.0.gpu_limit.0.sku
    }]
    ports = [{
      port     = var.container_config.0.ports.0.port
      protocol = var.container_config.0.ports.0.protocol
    }]
    environment_variables        = var.container_config.0.environment_variables
    secure_environment_variables = var.container_config.0.secure_environment_variables
    readiness_probe = [{
      exec                  = var.container_config.0.readiness_probe.0.exec
      initial_delay_seconds = var.container_config.0.readiness_probe.0.initial_delay_seconds
      period_seconds        = var.container_config.0.readiness_probe.0.period_seconds
      failure_threshold     = var.container_config.0.readiness_probe.0.failure_threshold
      success_threshold     = var.container_config.0.readiness_probe.0.success_threshold
      timeout_seconds       = var.container_config.0.readiness_probe.0.timeout_seconds
    }]
    liveness_probe = [{
      http_get = [{
        path         = var.container_config.0.liveness_probe.0.http_get.0.path
        port         = var.container_config.0.liveness_probe.0.http_get.0.port
        scheme       = var.container_config.0.liveness_probe.0.http_get.0.scheme
        http_headers = var.container_config.0.liveness_probe.0.http_get.0.http_headers
      }]
      initial_delay_seconds = var.container_config.0.liveness_probe.0.initial_delay_seconds
      period_seconds        = var.container_config.0.liveness_probe.0.period_seconds
      failure_threshold     = var.container_config.0.liveness_probe.0.failure_threshold
      success_threshold     = var.container_config.0.liveness_probe.0.success_threshold
      timeout_seconds       = var.container_config.0.liveness_probe.0.timeout_seconds
    }]
    commands = var.container_config.0.commands
    volume = [{
      name                 = var.container_config.0.volume.0.name
      mount_path           = var.container_config.0.volume.0.mount_path
      read_only            = var.container_config.0.volume.0.read_only
      empty_dir            = var.container_config.0.volume.0.empty_dir
      storage_account_name = var.container_config.0.volume.0.storage_account_name
      storage_account_key  = var.container_config.0.volume.0.storage_account_key
      share_name           = var.container_config.0.volume.0.share_name
      git_repo = [{
        url       = var.container_config.0.volume.0.git_repo.0.url
        directory = var.container_config.0.volume.0.git_repo.0.directory
        revision  = var.container_config.0.volume.0.git_repo.0.revision
      }]
      secret = var.container_config.0.volume.0.secret
    }]
  }]

  os_type = var.os_type

  dns_config_config = [{
    nameservers    = var.dns_config_config.0.nameservers
    search_domains = var.dns_config_config.0.search_domains
    options        = var.dns_config_config.0.options
  }]

  diagnostics_config = [{
    log_analytics = [{
      log_type      = var.diagnostics_config.0.log_analytics.0.log_type
      workspace_id  = var.diagnostics_config.0.log_analytics.0.workspace_id
      workspace_key = var.diagnostics_config.0.log_analytics.0.workspace_key
      metadata      = var.diagnostics_config.0.log_analytics.0.metadata
    }]
  }]

  dns_name_label              = var.dns_name_label
  dns_name_label_reuse_policy = var.dns_name_label_reuse_policy

  exposed_port_config = [{
    port     = var.exposed_port_config.0.port
    protocol = var.exposed_port_config.0.protocol
  }]

  ip_address_type  = var.ip_address_type
  key_vault_key_id = var.key_vault_key_id
  subnet_ids       = var.subnet_ids

  image_registry_credential_config = [{
    user_assigned_identity_id = var.image_registry_credential_config.0.user_assigned_identity_id
    username                  = var.image_registry_credential_config.0.username
    password                  = var.image_registry_credential_config.0.password
    server                    = var.image_registry_credential_config.0.server
  }]

  restart_policy = var.restart_policy
  zones          = var.zones
  tags           = var.tags
}
```
<!-- END_TF_DOCS -->