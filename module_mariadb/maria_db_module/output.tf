output "mariadb_server_id" {
  value       = azurerm_mariadb_server.mariadb_server.id
  description = "ID of the MariaDB Server"
}

output "mariadb_id" {
  value       = var.mariadb_database_settings != null ? [for k in azurerm_mariadb_database.mariadb_database : k.id] : null
  description = "ID of the Maria DB "
}

output "mariadb_configuration_id" {
  value       = var.mariadb_configuration_settings != null ? [for k in azurerm_mariadb_configuration.mariadb_configuration : k.id] : null
  description = "The ID of the MariaDB Configuration."
}

output "mariadb_firewall_id" {
  value       = var.mariadb_firewall_rules != null ? [for k in azurerm_mariadb_firewall_rule.mariadb_fr : k.id] : null
  description = " The ID of the MariaDB Firewall Rule."
}

output "mariadb_vnetrule_id" {
  value       = azurerm_mariadb_virtual_network_rule.mariadb_vnetrule.id
  description = "The ID of the MariaDB Virtual Network Rule."
}