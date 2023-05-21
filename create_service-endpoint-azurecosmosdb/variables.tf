#-----------------------------VARIABLE: RESOURCE GROUP------------------------------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#----------------------------------------VARIABLE: VIRTUAL NETWORK-------------------------------------------------#
variable "virtual_network" {
  type        = string
  description = "Virtual network name in Azure"
}

variable "address_space" {
  type        = list(string)
  description = "address spaces for vnet"
}

variable "dns_servers" {
  type        = list(string)
  description = "DNS server"
}

variable "enable_ddos_protection_plan1" {
  type        = bool
  description = "enable ddos protection plan "
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#----------------------------------------VARIABLES: DDOS Protection------------------------------------------------#
variable "network_ddos_protection_plan" {
  type        = string
  description = "network ddos protection plan"
}

#---------------------------------------------VARIABLE: SUBNET-----------------------------------------------------#
variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the subnet"
}

variable "service_endpoints" {
  type        = list(string)
  description = "List of service endpoints of the subnet"
}

#---------------------------------------- Public IP variables -----------------------------------------
variable "public_ip" {
  type        = string
  description = "public ip name"
}

variable "allocation_method" {
  type        = string
  description = "allocation method"
}

variable "sku" {
  type        = string
  description = "sku"
}

#------------------------------------------VARIABLES: Firewall ---------------------------------------------------#
variable "firewall_name" {
  type        = string
  description = "name of the firewall"
}

variable "threat_intel_mode" {
  type        = string
  description = "threat intel mode"
}


variable "ip_config" {
  type        = string
  description = "ip configuration"
}

#-------------------------------------------VARIABLES: COSMOS DB-------------------------------------------------#
variable "cosmosdb_account_name" {
  type        = string
  description = "CosmosDB account name in Azure"
}

variable "offer_type" {
  type        = string
  description = "Offer Type to use for this CosmosDB Account"
}

variable "kind" {
  type        = string
  description = "Kind of CosmosDB to create" #possible values are GlobalDocumentDB and MongoDB
}

variable "enable_automatic_failover" {
  type        = bool
  description = "Enable automatic fail over for this Cosmos DB account."
}

variable "is_virtual_network_filter_enabled" {
  type        = bool
  description = " Enables virtual network filtering for this Cosmos DB account."
}

variable "consistency_level" {
  type        = string
  description = "The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
}

variable "max_interval_in_seconds" {
  type        = number
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness."
}

variable "max_staleness_prefix" {
  type        = number
  description = " When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency_level is set to BoundedStaleness."
}

variable "geo_location_failover_priority" {
  type        = number
  description = "The failover priority of the region. A failover priority of 0 indicates a write region. The maximum value for a failover priority = (total number of regions - 1). Failover priority values must be unique for each of the regions in which the database account exists. Changing this causes the location to be re-provisioned and cannot be changed for the location with failover priority 0."
}

variable "ignore_missing_vnet_service_endpoint" {
  type        = bool
  description = " If set to true, the specified subnet will be added as a virtual network rule even if its CosmosDB service endpoint is not active. Defaults to false."
}

#----------------------------------------VARIABLES: RBAC MODULE---------------------------------------------------#

variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}
#-----------------------------------------------------------------------------------------------------------------#