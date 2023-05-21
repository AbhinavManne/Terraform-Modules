module "hdinsight" {
  source = "../../modules/module_HDInsight"

  rg_name                  = var.rg_name
  cluster_version          = var.cluster_version
  tier                     = var.tier
  component_version        = var.component_version
  username                 = var.username
  password                 = var.password
  is_default               = var.is_default
  hnode_vm_size            = var.hnode_vm_size
  hnode_username           = var.hnode_username
  hnode_password           = var.hnode_password
  wnode_vm_size            = var.wnode_vm_size
  wnode_username           = var.wnode_username
  wnode_password           = var.wnode_password
  target_instance_count    = var.target_instance_count
  znode_vm_size            = var.znode_vm_size
  znode_username           = var.znode_username
  znode_password           = var.znode_password
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  storage_account_name     = var.storage_account_name
  container_name           = var.container_name
  container_access_type    = var.container_access_type
  hadoop_cluster_name      = var.hadoop_cluster_name
}