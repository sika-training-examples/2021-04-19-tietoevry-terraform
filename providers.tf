variable "azure_subscription_id" {}
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

variable "cloudflare_api_token" {}
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
