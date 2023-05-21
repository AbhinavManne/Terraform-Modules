resource_group_name     = "rg-001"
resource_group_location = "east us"

app_service_plan_name = "asp-236824612899"
tier                  = "Standard"
size                  = "S1"

app_service_name = "webappservicmoh"
https_only       = true

contact_person = "mohit patil"
cost_center    = 999

backup_name        = "demo_backup"
frequency_interval = 30
frequency_unit     = "Day"

dotnet_framework_version = "v4.0"
scm_type                 = "LocalGit"
min_tls_version          = 1.2
always_on                = true
use_32_bit_worker_process= true
vnet_route_all_enabled   = true

scm_ip_restriction_name = "demo_rule"
ip_address              = "10.0.0.0/16"
priority1               = 300
action1                 = "Allow"

ip_restriction_name = "demo_outbound_rule"
priority2           = 300
action2             = "Allow"

name1 = "Database"
type1 = "SQLServer"

type2 = "SystemAssigned"

auth_settings_enabled = true
default_provider      = "MicrosoftAccount"
token_store_enabled   = true

application_insights_name = "$webappname-wa-ai"
application_type          = "Node.JS"

vnet_name     = "example-vnet"
address_space = ["10.0.0.0/16"]

subnet_name      = "example-subnet"
address_prefixes = ["10.0.1.0/24"]

storage_account_name     = "abcstorgg639"
account_tier             = "Standard"
account_replication_type = "GRS"

container_name        = "democontainer"
container_access_type = "private"

start_date = "2021-12-23"
end_date   = "2022-12-22"


log_analytics_name ="log123e"