#locals
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group)
  location = var.location
}

#----------------------------------RESOURCE: AUTOMATION ACCOUNT-------------------------------------------#
resource "azurerm_automation_account" "example" {
  name                = var.automation_account
  location            = local.location
  resource_group_name = local.resource_group_name
  sku_name            = var.sku_name
  tags                = var.tags
}

#----------------------------------RESOURCE: AUTOMATION RUNBOOK-------------------------------------------#
data "local_file" "example" {
  filename = "example.ps1"
}

resource "azurerm_automation_runbook" "example" {
  name                    = var.automation_runbook_name
  location                = local.location
  resource_group_name     = local.resource_group_name
  automation_account_name = azurerm_automation_account.example.name
  log_verbose             = var.log_verbose
  log_progress            = var.log_progress
  description             = var.description
  runbook_type            = var.runbook_type

  content = data.local_file.example.content
}

#----------------------------------LOCALS & RESOURCE: TIME OFFSET------------------------------------------#
locals {
  update_time     = "09:15"
  update_date     = substr(time_offset.tomorrow.rfc3339, 0, 10)
  update_timezone = "UTC"
}

resource "time_offset" "tomorrow" {
  offset_days = 1
}

#----------------------------------RESOURCE: AUTOMATION SCHEDULE-------------------------------------------#
resource "azurerm_automation_schedule" "example" {
  name                    = var.automation_schedule_name
  resource_group_name     = local.resource_group_name
  automation_account_name = azurerm_automation_account.example.name
  frequency               = var.frequency
  interval                = var.interval
  timezone                = local.update_timezone
  #start_time              = "2006-01-02T15:04:05Z07:00"
  start_time              = "${local.update_date}T${local.update_time}:00+02:00"
  description             = var.schedule_description
  week_days               = var.week_days #when frequency is month then comment this

  #When frequency is given month then the following code should not be commented
  /*
  month_days  = 30
  monthly_occurrence {
      day = "Monday"
      occurrence = 2
  }*/
}

#----------------------------------RESOURCE: AUTOMATION JOB SCHEDULE---------------------------------------#
resource "azurerm_automation_job_schedule" "example_job" {
  resource_group_name     = local.resource_group_name
  automation_account_name = azurerm_automation_account.example.name
  schedule_name           = azurerm_automation_schedule.example.name
  runbook_name            = azurerm_automation_runbook.example.name
  depends_on              = [azurerm_automation_schedule.example]
}

#----------------------------------------------------------------------------------------------------------#