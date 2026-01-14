terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
}
provider "azurerm" {
  features {}
  #subscription_id = "a4638f3f-afa7-4287-8a26-626647841902"
}