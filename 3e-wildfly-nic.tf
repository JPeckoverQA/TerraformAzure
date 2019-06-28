#create network interface card
resource "azurerm_network_interface" "server" {
        name = "${var.server}-NIC"
        location = "${azurerm_resource_group.main.location}"
        resource_group_name = "${azurerm_resource_group.main.name}"
        network_security_group_id = "${azurerm_network_security_group.server.id}"
        ip_configuration {
                name = "${var.server}-NICconfiguration"
                subnet_id = "${azurerm_subnet.internal.id}"
                private_ip_address_allocation = "dynamic"
                public_ip_address_id = "${azurerm_public_ip.server.id}"
        }
}

