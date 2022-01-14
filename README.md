# Azurerm Virual-Network Terraform module

Terraform module which creates Virtual-Network resources on Azurerm.

## User Stories for this module

- AAOPS I can create a virtual network for my resources.
- AAOPS I can create a virtual network with DDOS protection.

## Usage

```hcl
module "example-virtual-network" {
  source = "git@github.com:padok-team/terraform-azurerm-virtual-network.git?ref=v1.0.0"

  name                = "example-virutal-network"
  resource_group_name = "my-resource-group-name"
  location            = "West Europe"
  address_space       = ["10.0.0.0/8"]
}
```

## Examples

- [A basic virtual network](examples/example_base/main.tf)
- [A virtual network with basic DDOS protection](examples/example_with_ddos_protection/main.tf)

<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used for the virtual network. You can supply more than one address space. | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the virtual network is created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the virtual network resource group. | `string` | n/a | yes |
| <a name="input_azurerm_network_ddos_protection_plan_id"></a> [azurerm\_network\_ddos\_protection\_plan\_id](#input\_azurerm\_network\_ddos\_protection\_plan\_id) | ID of the DDOS protection plan | `string` | `""` | no |
| <a name="input_bgp_community"></a> [bgp\_community](#input\_bgp\_community) | The BGP community attribute in format <as-number>:<community-value>. | `string` | `null` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of DNS servers IP addresses | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | The virtual network resource. |
<!-- END_TF_DOCS -->

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
