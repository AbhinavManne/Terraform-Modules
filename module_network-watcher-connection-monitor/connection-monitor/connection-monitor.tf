data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

data "azurerm_application_gateway" "example" {
  name                = var.application_gateway_name
  resource_group_name = data.azurerm_resource_group.rg.name
}


data "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "example" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
}


data "azurerm_network_interface" "example" {
  name                = var.network_interface_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_virtual_machine" "example" {
  name                = var.virtual_machine
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_network_watcher" "example" {
  name                = var.network_watcher_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = var.tags
  
}
resource "azurerm_virtual_machine_extension" "example" {
  name                       = var.virtual_machine_extension_name
  virtual_machine_id         = data.azurerm_virtual_machine.example.id
  publisher                  = var.publisher
  type                       = var.type
  type_handler_version       = var.type_handler_version
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
}



resource "azurerm_network_connection_monitor" "example" {
  name               = var.connection_monitor_name
  network_watcher_id = azurerm_network_watcher.example.id
  location           = azurerm_network_watcher.example.location


  endpoint {
    name               = var.endpoint_name1
    target_resource_id = data.azurerm_virtual_machine.example.id

    filter {
      item {
        address = data.azurerm_virtual_machine.example.id
        type    = var.item_type
      }

      type = var.filter_type
    }
  }

  endpoint {
    name    = var.endpoint_name2
    address = var.endpoint_address
  }

  test_configuration {
    name                      = var.tc_name
    protocol                  = var.tc_protocol
    test_frequency_in_seconds = var.tc_frequency

    tcp_configuration {
      port = var.tc_port
    }
  }

  test_group {
    name                     = var.test_group_name
    destination_endpoints    = var.destination_endpoints
    source_endpoints         = var.source_endpoints
    test_configuration_names = var.test_configuration_names
  }


  output_workspace_resource_ids = [data.azurerm_log_analytics_workspace.example.id]

  depends_on = [azurerm_virtual_machine_extension.example]
}



