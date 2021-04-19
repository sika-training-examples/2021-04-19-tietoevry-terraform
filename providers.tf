variable "azure_subscription_id" {}
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}
