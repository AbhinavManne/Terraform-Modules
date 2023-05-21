module "nsg_association" {
  source = "../../modules/module_nsg_association"
  subnet_name_and_subnet_id = var.subnet_name_and_subnet_id
  subnet_name_and_nsg_id = var.subnet_name_and_nsg_id
}