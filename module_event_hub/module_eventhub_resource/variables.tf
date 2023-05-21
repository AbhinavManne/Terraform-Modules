############################# Event Hub Resource ####################################
variable "event_hubs" {
  description = "Specifies the eventhub for a particular eventhub namespace resource"
  type = map(object({
    event_hub_name    = string,
    partition_count   = string,
    message_retention = number,
    capture_description = list(object({
      enabled             = bool,
      encoding            = string,
      interval_in_seconds = number,
      size_limit_in_bytes = number,
      skip_empty_archives = bool,
      destination = list(object({
        name                = string,
        archive_name_format = string,
        blob_container_name = string,
        storage_account_id  = string
      }))
    })),
    status = string
  }))
  default = {
    "event-hub-1" = {
      capture_description = [{
        destination = [{
          archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
          blob_container_name = "eventhubcontainer"
          name                = "EventHubArchive.AzureBlockBlob"
          storage_account_id  = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Storage/storageAccounts/storagegroup2001"
        }]
        enabled             = true
        encoding            = "Avro"
        interval_in_seconds = 300
        size_limit_in_bytes = 314572800
        skip_empty_archives = false
      }]
      event_hub_name    = "cil-automated-event-hub-test"
      message_retention = 1
      partition_count   = 2
      status            = "Active"
    }
  }
}


variable "event_hub_namespace_name" {
  description = "The name of the namespace under which the eventhubs needs to be created"
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the EventHub's parent Namespace exists. Changing this forces a new resource to be created."
  type        = string
}