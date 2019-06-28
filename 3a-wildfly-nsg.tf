#create network security group
resource "azurerm_network_security_group" "server" {
        name = "${var.server}-NSG"
        location = "${azurerm_resource_group.main.location}"
        resource_group_name = "${azurerm_resource_group.main.name}"
}

