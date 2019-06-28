#create network interface card
resource "azurerm_network_interface" "jenkins" {
        name = "${var.jenkins}-NIC"
        location = "${azurerm_resource_group.main.location}"
        resource_group_name = "${azurerm_resource_group.main.name}"
        network_security_group_id = "${azurerm_network_security_group.jenkins.id}"
        ip_configuration {
                name = "${var.jenkins}-NICconfiguration"
                subnet_id = "${azurerm_subnet.internal.id}"
                private_ip_address_allocation = "dynamic"
                public_ip_address_id = "${azurerm_public_ip.jenkins.id}"
        }
}

