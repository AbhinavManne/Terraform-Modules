#---CASSANDRA KEYSPACE----#
resource "azurerm_cosmosdb_cassandra_keyspace" "ckeyspace" {
  name                = var.cass_keyspace_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.keyspace_throughput
  dynamic "autoscale_settings" {
    for_each = var.keyspace_max_throughput != null ? [1] : []
    content {
      max_throughput = var.keyspace_throughput == null ? var.keyspace_max_throughput : null
    }
  }
}

#----CASSANDRA TABLE----#
resource "azurerm_cosmosdb_cassandra_table" "ctable" {
  name                   = var.cass_table_name
  cassandra_keyspace_id  = azurerm_cosmosdb_cassandra_keyspace.ckeyspace.id
  throughput             = var.ctable_throughput
  default_ttl            = var.default_ttl
  analytical_storage_ttl = var.analytical_storage_ttl

  schema {
    dynamic "column" {
      for_each = var.schema.column 
      content {
        name = column.value.name
        type = column.value.type
      }
    }
    dynamic "partition_key" {
      for_each = var.schema.partition_key 
      content {
        name = partition_key.value.name
      }
    }
    dynamic "cluster_key" {
      for_each = var.schema.cluster_key != null ? var.schema.cluster_key : []
      content {
        name     = cluster_key.value.name
        order_by = cluster_key.value.order_by
      }
    }
  }

  dynamic "autoscale_settings" {
    for_each = var.ctable_max_throughput != null ? [1] : []
    content {
      max_throughput = var.ctable_throughput == null ? var.ctable_max_throughput : null
    }
  }
}
