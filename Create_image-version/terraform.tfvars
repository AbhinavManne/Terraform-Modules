create_resource_group     = false
resource_group            = "rg"
location                  = "East US"
image_name                = "demovm-image1"
shared_image_name         = "my-image"
os_type                   = "Windows"
hyper_v_generation        = "V2"
publisher                 = "PublisherName"
offer                     = "OfferName"
sku                       = "ExampleSku"
shared_image_gallery_name = "example_image_gallery"
shared_image_version_name = "1.0.0"
tags = {
  "Contact_person"   : "Mohit Patil"
  "cost_center"      : 999
  "Application Name" : "Image_version"
}
regional_replica_count   = 5
storage_account_type     = "Standard_LRS"
