<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 28/11/2022

## Introduction

Manages the disaster recovery configuration for the eventhub namespace.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | n/a     |

## File Structure

This particular module is having the following configuration files.

- main.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in main.tf.
- outputs.tf : This file will be having the resource output details generated.

## Resources

| Name                                                                                                                                                                                                                            | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_eventhub_namespace_disaster_recovery_config.event_hub_namespace_disaster_recovery_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_disaster_recovery_config) | resource |

## Inputs

| Name                                                                                                                                                                                                                                 | Description                                                                                                         | Type     | Default                      | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- | -------- | ---------------------------- | :------: |
| <a name="input_create_disaster_recovery_configuration"></a> [create_disaster_recovery_configuration](#input_create_disaster_recovery_configuration)                                                                                  | Specifies whether we want a disaster recovery configuration or not                                                  | `bool`   | `false`                      |    no    |
| <a name="input_event_hub_namespace_disaster_recovery_config_name"></a> [event_hub_namespace_disaster_recovery_config_name](#input_event_hub_namespace_disaster_recovery_config_name)                                                 | Specifies the name of the Disaster Recovery Config. Changing this forces a new resource to be created.              | `string` | `"disaster_recovery_config"` |    no    |
| <a name="input_event_hub_namespace_disaster_recovery_config_wait_for_replication"></a> [event_hub_namespace_disaster_recovery_config_wait_for_replication](#input_event_hub_namespace_disaster_recovery_config_wait_for_replication) | Should the resource wait for replication upon creation? Defaults to false. Not Working. Can be Deprecated           | `bool`   | `false`                      |    no    |
| <a name="input_event_hub_namespace_name"></a> [event_hub_namespace_name](#input_event_hub_namespace_name)                                                                                                                            | Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created.           | `string` | n/a                          |   yes    |
| <a name="input_event_hub_sku"></a> [event_hub_sku](#input_event_hub_sku)                                                                                                                                                             | Defines which tier to use. Valid options are Basic, Standard, and Premium.                                          | `string` | n/a                          |   yes    |
| <a name="input_partner_eventhub_namespace_id"></a> [partner_eventhub_namespace_id](#input_partner_eventhub_namespace_id)                                                                                                             | The id of the partner eventhub namespace where the replication typically needs to happen.                           | `string` | n/a                          |   yes    |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)                                                                                                                                           | The name of the resource group in which to create the namespace. Changing this forces a new resource to be created. | `string` | n/a                          |   yes    |

## Outputs

| Name                                                                                                                                                                          | Description                                                  |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| <a name="output_eventhub_namespace_disaster_recovery_config_id"></a> [eventhub_namespace_disaster_recovery_config_id](#output_eventhub_namespace_disaster_recovery_config_id) | Specifies the eventhub namespace disaster recovery config id |

## Module Usage

module "event_hub_disaster_recovery_config" {
source = "../../modules/event_hub-creation/module_event_hub_disaster_recovery_config"
create_disaster_recovery_configuration = var.create_disaster_recovery_configuration
event_hub_namespace_disaster_recovery_config_name = var.event_hub_namespace_disaster_recovery_config_name
event_hub_namespace_disaster_recovery_config_wait_for_replication = var.event_hub_namespace_disaster_recovery_config_wait_for_replication
resource_group_name = var.resource_group_name
partner_eventhub_namespace_id = module.eventhub_namespace_disaster_recovery_partner_namespace.eventhub_namespace_id
event_hub_namespace_name = var.event_hub_namespace_name
event_hub_sku = var.event_hub_sku
depends_on = [
module.eventhub_namespace_disaster_recovery_partner_namespace
]
}

<!-- END_TF_DOCS -->
