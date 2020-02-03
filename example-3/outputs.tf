
output "registry_hostname" {
  value = "${var.container_registry_name}.azurecr.io"
}

output "registry_un" {
  value = "${azurerm_container_registry.container_registry.admin_username}"
}

output "registry_pw" {
  value = "${azurerm_container_registry.container_registry.admin_password}"
}

# todo: this will be wrong!!
output "configure" {
  value = <<CONFIGURE

Run the following commands to configure the Kubernetes client:

$ terraform output kube_config > ~/.kube/aksconfig
$ export KUBECONFIG=~/.kube/aksconfig

Test configuration using kubectl:

$ kubectl get nodes
CONFIGURE
}
