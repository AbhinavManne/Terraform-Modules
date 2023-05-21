module "nw_flow_log" {
  source = "../../modules/module_nw_flow_log"

  resource_group_name = var.resource_group_name
  location            = var.location
  nw_flow_log         = var.nw_flow_log
}
