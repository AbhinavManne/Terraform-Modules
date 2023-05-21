data "azurerm_resource_group" "rg" {
  name = var.rg_name
}
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
 resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container_access_type
}

resource "azurerm_hdinsight_hadoop_cluster" "example" {
  name                = var.hadoop_cluster_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  cluster_version     = var.cluster_version
  tier                = var.tier

  #Here we can provide framework(Hadoop/kafka/spark etc) accordingly
  component_version {
    hadoop = var.component_version  #Cluster used here is Hadoop
  }
  
  gateway {
    username = var.username
    password = var.password
  }

  storage_account {
    storage_container_id = azurerm_storage_container.example.id
    storage_account_key  = azurerm_storage_account.example.primary_access_key
    is_default           = var.is_default
  }

  roles {
    head_node {
      vm_size  =  var.hnode_vm_size
      username =  var.hnode_username
      password =  var.hnode_password
    }

    worker_node {
      vm_size               = var.wnode_vm_size
      username              = var.wnode_username
      password              = var.wnode_password
      target_instance_count = var.target_instance_count
    }

    zookeeper_node {
      vm_size  = var.znode_vm_size
      username = var.znode_username
      password = var.znode_password
    }
  }
}