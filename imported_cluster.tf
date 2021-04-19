resource "azurerm_kubernetes_cluster" "foobar" {
  name                = "foobar"
  dns_prefix          = "foobar-dns"
  location            = azurerm_resource_group.ondrejsika.location
  resource_group_name = azurerm_resource_group.ondrejsika.name

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    availability_zones = [
      "1",
      "2",
      "3",
    ]
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kubeconfig-foobar" {
  value     = azurerm_kubernetes_cluster.foobar.kube_config_raw
  sensitive = true
}
