
#Creating an Application Security Group
resource "azurerm_application_security_group" "asg" {
  name                = var.application_security_group
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}