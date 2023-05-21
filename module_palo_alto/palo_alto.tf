
locals {
  prefix = "palo"
}

data "azurerm_subnet" "subnet1" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}


data "azurerm_subnet" "lbsubnet" {
  name                 = var.lb_subnet_name
  virtual_network_name = var.lb_vnet_name
  resource_group_name  = var.resource_group_name
}



# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_availability_set" "paloset" {
  name                = "aset_${local.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  lifecycle { ignore_changes = [tags, ] }
}

resource "azurerm_network_interface" "fwnic0" {
  name                = "nic_${local.prefix}-0"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconf_${local.prefix}-nic0"
    subnet_id                     = data.azurerm_subnet.subnet1.id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
    private_ip_address            = cidrhost(data.azurerm_subnet.subnet1.address_prefix, 6)

  }
  lifecycle { ignore_changes = [tags, ] }
}

resource "azurerm_marketplace_agreement" "palo_agreement" {
  publisher = var.publisher
  offer     = var.offer
  plan      = var.plan
}

# Create linux virtual machine
resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                  = var.linux_virtual_machine_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.fwnic0.id]
  size                  = var.linux_vm_size

  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }

  plan {
    name      = var.vm_plan_name
    publisher = var.vm_publisher
    product   = var.vm_product
  }

  computer_name                   = var.computer_name
  admin_username                  = var.admin_username
  disable_password_authentication = var.disable_password_authentication

  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  /*  boot_diagnostics {
    storage_account_uri = data.azurerm_storage_account.storage.primary_blob_endpoint
  }
*/
  tags = {
    environment = "PoC"
  }
}



resource "azurerm_lb" "palointlb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                          = var.lb_frontend_ip_name
    subnet_id                     = data.azurerm_subnet.lbsubnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
  lifecycle { ignore_changes = [tags, ] }
}

resource "azurerm_lb_probe" "intfwprobe" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.palointlb.id
  name                = var.lb_probe_name
  port                = var.lb_probe_port
}

resource "azurerm_lb_backend_address_pool" "palointlbpool" {
  loadbalancer_id = azurerm_lb.palointlb.id
  name            = var.lb_backend_address_pool_name

}

resource "azurerm_network_interface_backend_address_pool_association" "fw1intnicassoc" {
  network_interface_id    = azurerm_network_interface.fwnic0.id
  ip_configuration_name   = azurerm_network_interface.fwnic0.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.palointlbpool.id
}

resource "azurerm_lb_rule" "palointrule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.palointlb.id
  name                           = var.lb_rule
  backend_address_pool_id        = azurerm_lb_backend_address_pool.palointlbpool.id
  probe_id                       = azurerm_lb_probe.intfwprobe.id
  frontend_ip_configuration_name = azurerm_lb.palointlb.frontend_ip_configuration[0].name
  protocol                       = var.lb_rule_protocol
  frontend_port                  = var.lb_frontend_port
  backend_port                   = var.lb_backend_port
}
