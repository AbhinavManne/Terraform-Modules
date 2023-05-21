module "gallerymodule" {
  source                 = "../../modules/module_image-gallery/image-gallery"
  create_resource_group  = var.create_resource_group
  resource_group         = var.resource_group
  location               = var.location
  gallery_name           = var.gallery_name
  tags                   = var.tags
  shared_image_name      = var.shared_image_name
  os_type                = var.os_type
  publisher              = var.publisher
  offer                  = var.offer
  sku                    = var.sku
}

module "module_resource-role-assignment" {

  source               = "../../modules/module_image-gallery/rbac"
  resource_group_name  = module.gallerymodule.resource_group
  scope                = module.gallerymodule.image-gallery_id
  role_definition_name = var.role_definition_name

}