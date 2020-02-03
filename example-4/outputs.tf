
output "registry_hostname" {
  value = "${var.container_registry_name}.azurecr.io"
}

output "registry_un" {
  value = "${azurerm_container_registry.container_registry.admin_username}"
}

output "registry_pw" {
  value = "${azurerm_container_registry.container_registry.admin_password}"
}

output "cluster_client_key" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.client_key}"
}

output "cluster_client_certificate" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate}"
}

output "cluster_cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate}"
}

output "cluster_cluster_username" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.username}"
}

output "cluster_cluster_password" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.password}"
}

output "cluster_kube_config" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config_raw}"
}

output "cluster_host" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.host}"
}

output "cluster_private_key" {
  value = "${tls_private_key.key.private_key_pem}"
}

output "cluster_public_key" {
  value = "${tls_private_key.key.public_key_pem}"
}

# todo: needed?
output "configure" {
  value = <<CONFIGURE

Run the following commands to configure the Kubernetes client:

$ terraform output kube_config > ~/.kube/aksconfig
$ export KUBECONFIG=~/.kube/aksconfig

Test configuration using kubectl:

$ kubectl get nodes
CONFIGURE
}
