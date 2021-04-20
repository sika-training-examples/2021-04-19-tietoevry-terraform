resource "azurerm_resource_group" "ondrejsika" {
  name     = "ondrejsika"
  location = "West Europe"
}

module "ondrejsika" {
  source                 = "ondrejsika/azure-k8s/module"
  version                = "0.2.0"
  name                   = "ondrejsika"
  azurerm_resource_group = azurerm_resource_group.ondrejsika
  node_count             = 3
  kubernetes_version     = "1.19.7"
}

resource "azurerm_public_ip" "ingress" {
  name                = "ondrejsika-ingress"
  resource_group_name = module.ondrejsika.azurerm_kubernetes_cluster.node_resource_group
  location            = module.ondrejsika.azurerm_kubernetes_cluster.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

output "kubeconfig" {
  value     = module.ondrejsika.kubeconfig
  sensitive = true
}

output "ingress-ip" {
  value     = azurerm_public_ip.ingress.ip_address
  sensitive = true
}
