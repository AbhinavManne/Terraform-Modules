#-----------------------------------------------Resource Group-----------------------------------------------------
resource "azurerm_resource_group" "example" {
  name = var.resource_group_name
  location= var.resource_group_location     
}

#-------------------------------------------------app service plan----------------------------------------------------
resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  

  sku {
    tier = var.tier       
    size = var.size   
  }
  tags = {

    Name             = var.contact_person
    cost_center      = var.cost_center
    application_name = "App Service Plan"
  }
}


#-----------------------------------------------------app service-----------------------------------------------------
resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  https_only          = var.https_only             
  
  backup {
    name                = var.backup_name             
    storage_account_url = "https://${azurerm_storage_account.example.name}.blob.core.windows.net/${azurerm_storage_container.example.name}${data.azurerm_storage_account_sas.example.sas}&sr=b"

    schedule {
      frequency_interval = var.frequency_interval     
      frequency_unit     = var.frequency_unit      
    }
  }
  site_config {
    dotnet_framework_version = var.dotnet_framework_version    
    scm_type                 = var.scm_type                    

    min_tls_version          = var.min_tls_version              
    vnet_route_all_enabled   = var.vnet_route_all_enabled         
    

    always_on = var.always_on     
    use_32_bit_worker_process = var.use_32_bit_worker_process
    default_documents = [
    "Default.htm",
    ]

  scm_ip_restriction {
    name = var.scm_ip_restriction_name                 
    ip_address = var.ip_address                     
    priority = var.priority1                        
    action = var.action1                            
    
  }  
  ip_restriction {
      
      name = var.ip_restriction_name                
      priority = var.priority2                          
      action = var.action2                 
      virtual_network_subnet_id = azurerm_subnet.example.id

    }

  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = "${azurerm_application_insights.example.instrumentation_key}"
    APPINSIGHTS_PROFILERFEATURE_VERSION             = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION             = "1.0.0"
    DiagnosticServices_EXTENSION_VERSION            = "~3"
    InstrumentationEngine_EXTENSION_VERSION         = "disabled"
    SnapshotDebugger_EXTENSION_VERSION              = "disabled"
    XDT_MicrosoftApplicationInsights_BaseExtensions = "disabled"
    XDT_MicrosoftApplicationInsights_Java           = "1"
    XDT_MicrosoftApplicationInsights_Mode           = "recommended"
    XDT_MicrosoftApplicationInsights_NodeJS         = "1"
    XDT_MicrosoftApplicationInsights_PreemptSdk     = "disabled"
  }

  depends_on = [
    "azurerm_app_service_plan.example",
    "azurerm_application_insights.example"
  ]


  connection_string {
    name  = var.name1         
    type  = var.type1           
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }

  identity  {
    type = var.type2           
  }

  auth_settings {
    enabled = var.auth_settings_enabled           
    default_provider = var.default_provider     
    token_store_enabled  = var.token_store_enabled  

  }
}

#----------------------------------------------Threat Protection-------------------------------------------------------
resource "azurerm_security_center_workspace" "example" {
  scope        = azurerm_app_service.example.id
  workspace_id = azurerm_app_service_plan.example.id
}

#--------------------Log Analytics -----------------------------------#
data "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_name
  resource_group_name = azurerm_resource_group.example.name
}
#------------------------------------------------Application Insights---------------------------------------------------
resource "azurerm_application_insights" "example" {
name = var.application_insights_name                 
location = azurerm_resource_group.example.location
resource_group_name = azurerm_resource_group.example.name
workspace_id        = data.azurerm_log_analytics_workspace.example.id
application_type = var.application_type              
}

#----------------------------------------------------Virtual Network---------------------------------------------------
resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name                   
  address_space       = var.address_space             
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

#---------------------------------------------------------Subnet---------------------------------------------------------
resource "azurerm_subnet" "example" {
  name                 = var.subnet_name                 
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.address_prefixes           
}

#------------------------------------------------------Storage Account----------------------------------------------------
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name   
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.account_tier                
  account_replication_type = var.account_replication_type  
}

#-------------------------------------------------------Storage Container-------------------------------------------------
resource "azurerm_storage_container" "example" {
  name                  = var.container_name        
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container_access_type     
}

#---------------------------------------------------Storage Container SAS-------------------------------------------------
data "azurerm_storage_account_sas" "example" {
  connection_string = azurerm_storage_account.example.primary_connection_string
  https_only        = true

  resource_types {
    service   = false
    container = false
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = var.start_date       
  expiry = var.end_date           

  permissions {
    read    = false
    write   = true
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}