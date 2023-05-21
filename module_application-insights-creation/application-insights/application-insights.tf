#Reading existing resource group info
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}


#-----------log analyitcs workspace for application insights---------
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace 
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  sku                 = var.sku 
  retention_in_days   = var.retention_in_days
}

#-------------------------Creating an application insights component------------------------
resource "azurerm_application_insights" "service-application-insights" {
  name                = var.application_insights_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  workspace_id        = azurerm_log_analytics_workspace.example.id
  application_type    = var.application_insights_type
  daily_data_cap_in_gb                  = var.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  retention_in_days                     = var.retention_in_days
  sampling_percentage                   = var.sampling_percentage
  disable_ip_masking                    = var.disable_ip_masking
  tags                                  = var.tags
}
#---------For network isolation---------------------------------------
resource "azurerm_monitor_private_link_scope" "example" {
  name                = var.private_link_scope
  resource_group_name = data.azurerm_resource_group.example.name
}

resource "azurerm_monitor_private_link_scoped_service" "example" {
  name                = var.private_link_scoped_service
  resource_group_name = data.azurerm_resource_group.example.name
  scope_name          = azurerm_monitor_private_link_scope.example.name
  linked_resource_id  = azurerm_application_insights.service-application-insights.id
}
#--------------------------------------------------------------------------------------------

#----------Smart detection rule for app insight---------------------------------##
resource "azurerm_application_insights_smart_detection_rule" "example" {
  name                    =  var.smart_detection_rule 
  application_insights_id = azurerm_application_insights.service-application-insights.id
  enabled                 = var.enabled 
}


#------------API keys------------------------------------------------------------
resource "azurerm_application_insights_api_key" "read_telemetry" {
  name                    = var.read_telemetry 
  application_insights_id = azurerm_application_insights.service-application-insights.id
  read_permissions        = var.read_permissions1
}

resource "azurerm_application_insights_api_key" "write_annotations" {
  name                    = var.write_annotations
  application_insights_id = azurerm_application_insights.service-application-insights.id
  write_permissions       = var.write_permissions  
}

resource "azurerm_application_insights_api_key" "authenticate_sdk_control_channel" {
  name                    = var.authenticate_sdk_control_channel 
  application_insights_id = azurerm_application_insights.service-application-insights.id
  read_permissions        = var.read_permissions2
}

resource "azurerm_application_insights_api_key" "full_permissions" {
  name                    = var.full_permissions 
  application_insights_id = azurerm_application_insights.service-application-insights.id
  read_permissions        = var.read_permissions 
  write_permissions       = var.write_permissions 
}

#---------------------------------------------------------------------------------------------#