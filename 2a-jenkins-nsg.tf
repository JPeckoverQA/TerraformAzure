#create network security group
resource "azurerm_network_security_group" "jenkins" {
        name = "${var.jenkins}-NSG"
        location = "${azurerm_resource_group.main.location}"
        resource_group_name = "${azurerm_resource_group.main.name}"
}

