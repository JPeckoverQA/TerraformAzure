#create resource group if it doesn't exist
#"main" allows you to call attributes as variables later on
resource "azurerm_resource_group" "main" {
        name = "${var.prefix}-resources"
        location = "uksouth"
}

