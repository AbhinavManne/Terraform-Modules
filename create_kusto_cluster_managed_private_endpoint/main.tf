module "kusto_cluster_managed_private_endpoint" {
  source                                 = "../../modules/module_kusto_cluster_managed_private_endpoint"
  kusto_cluster_managed_private_endpoint = var.kusto_cluster_managed_private_endpoint

  private_link_resource_id     = var.private_link_resource_id
  private_link_resource_region = var.private_link_resource_region
  group_id                     = var.group_id
  request_message              = var.request_message
  kusto_cluster                = var.kusto_cluster
  resource_group_name          = var.resource_group_name
  tags                         = var.tags
}
