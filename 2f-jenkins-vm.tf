#create vm
resource "azurerm_virtual_machine" "jenkins" {
        name = "${var.jenkins}-vm"
        location = "${azurerm_resource_group.main.location}"
        resource_group_name = "${azurerm_resource_group.main.name}"
        network_interface_ids = ["${azurerm_network_interface.jenkins.id}"]
        vm_size = "Standard_B1ms"
        storage_image_reference {
                publisher = "Canonical"
                offer = "UbuntuServer"
                sku = "16.04-LTS"
                version = "latest"
        }
        storage_os_disk {
                name = "${var.jenkins}OsDisk"
                caching = "ReadWrite"
                create_option = "FromImage"
                managed_disk_type = "Standard_LRS"
        }
        os_profile {
                computer_name = "${var.jenkins}"
                admin_username = "admin123"
                admin_password = "Password1234!"
        }
        os_profile_linux_config {
                disable_password_authentication = true
                ssh_keys {
                        path = "/home/admin123/.ssh/authorized_keys"
                        key_data = "${file("/home/johnny/.ssh/id_rsa.pub")}"
        }
}
        tags = {
                environment = "staging"
        }

#add provisioner to allow remote connection - updates and installs jq
provisioner "remote-exec" {
        inline = ["sudo apt update", "sudo apt install -y jq", "git clone https://github.com/JPeckoverQA/JenkinsScripts.git", "cd JenkinsScripts && ./install.sh"]
        connection {
                type = "ssh"
                user = "admin123"
                private_key = "${file("/home/johnny/.ssh/id_rsa")}"
                host = "${azurerm_public_ip.jenkins.fqdn}"
}
}
}

