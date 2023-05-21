<!-- BEGIN_TF_DOCS -->

#### last updated on :

## Introduction
This module manages a data lake gen2 file system within an storage account.

* By default we need to create a storage account manually with account_kind to be either StorageV2 or BlobStorage. In addition, is_hns_enabled has to be set to true.

* We can creat one or more ace blocks in the module .Ace block is for handling the read/write permissions(Access control lists(ACLs))

* By default ace block is optional.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.23.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_storage_data_lake_gen2_filesystem.data_lake](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_data_lake_gen2_filesystem) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_lake_containers"></a> [data\_lake\_containers](#input\_data\_lake\_containers) | A list of Data Lake Gen 2 file system container names and ACL permissions. | <pre>map(object({<br>     properties         = list(string)<br>     owner              = string<br>     group              = string<br>    ace = map(object({<br>        ace_scope      = string<br>        ace_type       = string<br>        ace_id         = string<br>        ace_perm       = string<br>        }))<br>  }))</pre> | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | id of storage acount | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data-lake-storage-id"></a> [data-lake-storage-id](#output\_data-lake-storage-id) | n/a |

## Module Usage

```
module "data-lake" {

  source = "../../modules/module_data-lake-storage"

  data_lake_containers = var.data_lake_containers
  storage_account_id=var.storage_account_id

}
```
<!-- END_TF_DOCS -->