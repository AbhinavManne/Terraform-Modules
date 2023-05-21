module "imagemodule" {
  source             = "../../modules/module_image/image"
  rg_name            = var.rg_name
  vm_name            = var.vm_name
  managed_disk       = var.managed_disk
  image_name         = var.image_name
  tags               = var.tags
  img_location       = var.img_location
  os_type            = var.os_type
  hyper_v_generation = var.hyper_v_generation
}


module "module_resource-role-assignment" {

  source               = "../../modules/module_image/rbac"
  resource_group_name  = module.imagemodule.resource_group
  scope                = module.imagemodule.image_id
  role_definition_name = var.role_definition_name

}