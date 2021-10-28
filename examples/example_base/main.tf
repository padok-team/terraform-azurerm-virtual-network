locals {
  address_space = ["10.0.0.0/8"]
}

module "resource_group" {
  source   = "git@github.com:padok-team/terraform-azurerm-resource-group.git"
  name     = "example-resources"
  location = "West Europe"
}

module "example-virtual-network" {
  source = "../../"

  name                = "example-virutal-network"
  resource_group_name = module.resource_group.this.name
  location            = module.resource_group.this.location
  address_space       = local.address_space
}
