#create subnet
resource "azurerm_subnet" "internal" {
        name = "${var.prefix}-subnet"
        resource_group_name = "${azurerm_resource_group.main.name}"
        virtual_network_name = "${azurerm_virtual_network.main.name}"
        address_prefix = "10.0.1.0/24"
}

