module "rt_association" {
  source = "../../modules/module_route_table_association"
  subnet_name_and_subnet_id = var.subnet_name_and_subnet_id
  subnet_name_and_rt_id = var.subnet_name_and_rt_id
}