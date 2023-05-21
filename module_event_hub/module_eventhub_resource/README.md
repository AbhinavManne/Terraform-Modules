<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 28/11/2022

## Introduction

Manages the eventhub resource in the parent eventhub namespace.

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

| Name                                                                                                                   | Type     |
| ---------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_eventhub.event_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |

## Inputs

| Name                                                                                                      | Description                                                                                                                                   | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Required |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_event_hub_namespace_name"></a> [event_hub_namespace_name](#input_event_hub_namespace_name) | The name of the namespace under which the eventhubs needs to be created                                                                       | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |   yes    |
| <a name="input_event_hubs"></a> [event_hubs](#input_event_hubs)                                           | Specifies the eventhub for a particular eventhub namespace resource                                                                           | <pre>map(object({<br> event_hub_name = string,<br> partition_count = string,<br> message_retention = number,<br> capture_description = list(object({<br> enabled = bool,<br> encoding = string,<br> interval_in_seconds = number,<br> size_limit_in_bytes = number,<br> skip_empty_archives = bool,<br> destination = list(object({<br> name = string,<br> archive_name_format = string,<br> blob_container_name = string,<br> storage_account_id = string<br> }))<br> })),<br> status = string<br> }))</pre> | <pre>{<br> "event-hub-1": {<br> "capture_description": [<br> {<br> "destination": [<br> {<br> "archive_name_format": "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}",<br> "blob_container_name": "eventhubcontainer",<br> "name": "EventHubArchive.AzureBlockBlob",<br> "storage_account_id": "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Storage/storageAccounts/storagegroup2001"<br> }<br> ],<br> "enabled": true,<br> "encoding": "Avro",<br> "interval_in_seconds": 300,<br> "size_limit_in_bytes": 314572800,<br> "skip_empty_archives": false<br> }<br> ],<br> "event_hub_name": "cil-automated-event-hub-test",<br> "message_retention": 1,<br> "partition_count": 2,<br> "status": "Active"<br> }<br>}</pre> |    no    |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)                | (Required) The name of the resource group in which the EventHub's parent Namespace exists. Changing this forces a new resource to be created. | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |   yes    |

## Outputs

| Name                                                                    | Description                                                                 |
| ----------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| <a name="output_eventhub_ids"></a> [eventhub_ids](#output_eventhub_ids) | Specifies the ids for the eventhub created in the parent eventhub namespace |

## Module Usage

module "eventhub_resource" {
source = "../../modules/event_hub-creation/module_eventhub_resource"
event_hubs = var.event_hubs
resource_group_name = var.resource_group_name
event_hub_namespace_name = var.use_same_eventhub_namespace == true ? var.event_hub_namespace_name : var.event_hub_resource_namespace_name
depends_on = [
module.eventhub_namespace
]
}

<!-- END_TF_DOCS -->
