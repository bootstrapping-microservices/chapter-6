
resource "tls_private_key" "key" {
    algorithm = "RSA"
}

resource "azurerm_kubernetes_cluster" "cluster" {
    name                = var.cluster_name
    location            = var.location
    resource_group_name = azurerm_resource_group.flixtube.name
    dns_prefix          = var.dns_prefix # TODO: Is this needed?
    kubernetes_version  = "1.15.7"

    linux_profile {
        admin_username = var.admin_username

        ssh_key {
            key_data = "${trimspace(tls_private_key.key.public_key_openssh)} ${var.admin_username}@azure.com"
        }
    }

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_B2ms"
    }

    # https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html
    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }

    addon_profile {
        kube_dashboard {
            enabled = true
        }
    }
}
