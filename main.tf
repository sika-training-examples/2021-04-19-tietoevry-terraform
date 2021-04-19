resource "azurerm_resource_group" "ondrejsika" {
  name     = "ondrejsika"
  location = "West Europe"
}

module "ondrejsika" {
  source                 = "ondrejsika/azure-k8s/module"
  version                = "0.2.0"
  name                   = "ondrejsika"
  azurerm_resource_group = azurerm_resource_group.ondrejsika
  node_count             = 2
  kubernetes_version     = "1.19.7"
}

output "kubeconfig" {
  value     = module.ondrejsika.kubeconfig
  sensitive = true
}
