module "machine_learning_compute" {
  source = "../../modules/module_machine-learning-compute-instance/compute-instance"

  resource_group            = var.resource_group
  application_insights_name = var.application_insights_name
  key_vault_name            = var.key_vault_name
  storage_account_name      = var.storage_account_name
  workspace_name            = var.workspace_name
  identity_type             = var.identity_type
  vnet_name                 = var.vnet_name
  subnet_name               = var.subnet_name
  virtual_machine_size      = var.virtual_machine_size
  authorization_type        = var.authorization_type
  ssh_key                   = var.ssh_key
  compute_instance          = var.compute_instance
}