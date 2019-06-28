#create public ip
resource "azurerm_public_ip" "server" {
        name = "${var.server}-publicIP"
        location = "${azurerm_resource_group.main.location}"
        resource_group_name = "${azurerm_resource_group.main.name}"
        domain_name_label = "jp-${var.server}-${formatdate("DDMMYYhhmmss", timestamp())}"
        allocation_method = "Dynamic"

        tags = {
                environment = "staging"
        }
}

