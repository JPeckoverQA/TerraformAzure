#create public ip
resource "azurerm_public_ip" "jenkins" {
        name = "${var.jenkins}-publicIP"
        location = "${azurerm_resource_group.main.location}"
        resource_group_name = "${azurerm_resource_group.main.name}"
        domain_name_label = "jp-${var.jenkins}-${formatdate("DDMMYYhhmmss", timestamp())}"
        allocation_method = "Dynamic"

        tags = {
                environment = "staging"
        }
}

