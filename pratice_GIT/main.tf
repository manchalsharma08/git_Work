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

resource "azurerm_virtual_network" "vnet" {

    name = "man-vnet"
    location = "westus"
    resource_group_name = "man-rg"
    address_space = ["10.0.0.0/16"]
}


