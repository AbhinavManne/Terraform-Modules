module "imageversion" {
  source                    = "../../modules/module_image-version/image-version"
  create_resource_group     = var.create_resource_group
  resource_group            = var.resource_group
  location                  = var.location
  image_name                = var.image_name
  shared_image_name         = var.shared_image_name
  os_type                   = var.os_type
  hyper_v_generation        = var.hyper_v_generation
  publisher                 = var.publisher
  offer                     = var.offer
  sku                       = var.sku
  shared_image_gallery_name = var.shared_image_gallery_name
  shared_image_version_name = var.shared_image_version_name
  tags                      = var.tags
  regional_replica_count    = var.regional_replica_count
  storage_account_type      = var.storage_account_type
}

module "module_resource-role-assignment" {

  source               = "../../modules/module_image-version/rbac"
  resource_group_name  = module.imageversion.resource_group_name
  scope                = module.imageversion.resource_id
  role_definition_name = var.role_definition_name

}