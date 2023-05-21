output "sqlmi_instance_id" {
  description = "sqlmi instance ID"
  value = azurerm_mssql_managed_instance.sqlmi.id
}


output "sqlmi_db" {
  description = "sqlmi database ID"
  value = [for i in azurerm_mssql_managed_database.db : i.id]
}

output "sqlmi_secondary_instance_id" {
  description = "sqlmi secondary instance ID"
  value = [for k in azurerm_mssql_managed_instance.secondary : k.id]
}