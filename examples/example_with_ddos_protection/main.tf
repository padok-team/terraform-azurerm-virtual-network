# This exemple deploys a virtual network with ddos protection.

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

resource "azurerm_network_ddos_protection_plan" "this" {
  name                = "example-protection-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

module "example-virtual-network" {
  source = "../../"

  name                                    = "example-virutal-network"
  resource_group_name                     = azurerm_resource_group.example.name
  location                                = azurerm_resource_group.example.location
  address_space                           = local.address_space
  azurerm_network_ddos_protection_plan_id = azurerm_network_ddos_protection_plan.this.id
}
