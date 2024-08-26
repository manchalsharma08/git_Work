resource "azurerm_resource_group" "rg" {
name = "man-rg"
location = "westus"
}

resource "azurerm_storage_account" "st" {
name= "man846586mn"
location ="westus"
resourec_group_name = "man-rg"
account_replication_type = "LRS"
account_tier = "Standard"
}


