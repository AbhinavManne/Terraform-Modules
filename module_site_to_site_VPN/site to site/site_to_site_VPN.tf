#Site-to-Site VPN : Manualy created a On-Premise like environment at Azure Cloud
#and then provide the public ip of that On-Premise to local network gateway to establish the 
#site-to-site connection. 

resource "azurerm_resource_group" "example" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.vnet_address_space
}


resource "azurerm_subnet" "example" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.gateway_subnet_address
}

resource "azurerm_local_network_gateway" "onpremise" {
  name                = var.local_network_gateway
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  gateway_address     = var.gateway_address #public ip address of On-Premise Environment 
  address_space       = var.address_space   #vnet ip address of On-Premise Environment
}

resource "azurerm_public_ip" "example" {
  name                = var.public_ip
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = var.allocation_method
}

resource "azurerm_virtual_network_gateway" "example" {
  name                = var.vnet_gateway
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  type     = var.vnet_gateway_type
  vpn_type = var.vpn_type

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
  sku           = var.sku #--A whole load of oddities occur around SKUs, see MS Docs for details

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.example.id
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = azurerm_subnet.example.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "s2s" {
  name                = var.vnet_gateway_connection
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  type                       = var.connection_type #"IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.example.id
  local_network_gateway_id   = azurerm_local_network_gateway.onpremise.id

  shared_key = var.shared_key # have to put the same shared key while configuring the On-Premise
  tags       = var.tags
}

# ----------------------------------------STORAGE ACCOUNT-----------------------------------------------#
resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}