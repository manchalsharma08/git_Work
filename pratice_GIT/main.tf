resource "azurerm_resource_group" "rg" {
name = "man-rg"
location = "westus"
}

resource "azurerm_storage_account" "st" {
name= "man846586mn"
location ="westus"
resource_group_name = "man-rg"
account_replication_type = "LRS"
account_tier = "Standard"
}

resource "azurerm_app_service_plan" "appplan" {
name = "appplan-man008"
location = "westus"
resource_group_name = "man-rg"

sku {
tier ="Standard"
size ="S1"
}
}

## Add app Services Block
resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
resource "azurerm_virtual_network" "vnet" {

    name = "man-vnet"
    location = "westus"
    resource_group_name = "man-rg"
    address_space = ["10.0.0.0/16"]
}


resource "azurerm_network_interface" "nic" {
name = "man-nic"
location ="westus"
resource_group_name = "man-rg"

ip_configuration {
name = "ipconman"
subnet_id = azurerm_subnet.snet.id
private_ip_address_allocation = "Dynamic"
}
}

