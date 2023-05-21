module "machine_learning_cluster" {
  source = "../../modules/module_machine-learning-compute-cluster/compute-cluster"

  resource_group                       = var.resource_group
  application_insights_name            = var.application_insights_name
  key_vault_name                       = var.key_vault_name
  storage_account_name                 = var.storage_account_name
  workspace_name                       = var.workspace_name
  identity_type                        = var.identity_type
  vnet_name                            = var.vnet_name
  subnet_name                          = var.subnet_name
  compute_cluster                      = var.compute_cluster
  vm_priority                          = var.vm_priority
  vm_size                              = var.vm_size
  min_node_count                       = var.min_node_count
  max_node_count                       = var.max_node_count
  scale_down_nodes_after_idle_duration = var.scale_down_nodes_after_idle_duration
}