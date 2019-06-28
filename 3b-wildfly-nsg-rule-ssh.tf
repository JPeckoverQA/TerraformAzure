resource "azurerm_network_security_rule" "server-ssh" {
        name = "SSH"
        priority = "400"
        access = "Allow"
        direction = "Inbound"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        resource_group_name = "${azurerm_resource_group.main.name}"
        network_security_group_name = "${azurerm_network_security_group.server.name}"

}

