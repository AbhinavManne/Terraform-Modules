#----DEFAULT VALUES: RESOURCE GROUP----#
resource_group        = "rg-003"
create_resource_group = true
location              = "East US"

#----DEFAULT VALUES: AUTOMATION ACCOUNT----#
automation_account    = "testautomationAccount1"
sku_name              = "Basic"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Automation_account"
}

#----DEFAULT VALUES: AUTOMATION RUNBOOK----#
automation_runbook_name = "test-VM-Runbook"
log_verbose             = true
log_progress            = true
description             = "This is an example runbook"
runbook_type            = "PowerShell"

#----DEFAULT VALUES: AUTOMATION SCHEDULE----#
automation_schedule_name = "test-automation-schedule"
frequency                = "Week"
interval                 = 1
schedule_description     = "This is an example schedule"
week_days                = ["Thursday"]