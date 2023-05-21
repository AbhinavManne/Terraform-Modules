output "subnet_name_and_subnet_id" {
  value       = local.subnet_name_and_subnet_id
  description = "Subnet Id with respected Subnet Name(subnet_name-virtual_network_name)."
}
output "subnet_name" {
  value = local.subnet_name
  description = "Names of Subnets."
}
output "subnet_id" {
  value = local.subnet_id
  description = "Ids of Subnets"
}