module "data-lake" {

  source = "../../modules/module_data-lake-storage"

  data_lake_containers = var.data_lake_containers
  storage_account_id   = var.storage_account_id
  ace                  = var.ace
}
