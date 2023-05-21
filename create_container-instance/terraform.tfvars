container_group      = "myContGroup"
resource_group       = "rg"
container_group_name = "myContGroup"
dns_name_label       = "cont01-example"
os_type              = "linux"
image_name           = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
container_name       = "mycont01"
cpu_core_number      = "0.5"
memory_size          = "1.5"
port_number          = "80"
protocol             = "TCP"
ip_address_type      = "public"
tags = {
 App_Name="container instance"
 Cost_center=9999
 Contact_name ="Nikita"
}
role_definition_name = ["Reader"]
