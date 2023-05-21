output "data-lake-storage-id" {

  value = [for k in azurerm_storage_data_lake_gen2_filesystem.data_lake : k.id]

}