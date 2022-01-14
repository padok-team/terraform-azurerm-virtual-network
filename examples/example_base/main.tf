# This example deploys a basic virtual network.

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  address_space = ["10.0.0.0/8"]
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

module "example-virtual-network" {
  source = "../../"

  name                = "example-virutal-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = local.address_space
}
