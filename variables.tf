variable "name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the virtual network resource group."
  type        = string
}

variable "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}

variable "location" {
  description = "The location/region where the virtual network is created."
  type        = string
}

variable "bgp_community" {
  description = "The BGP community attribute in format <as-number>:<community-value>."
  type        = string
  default     = null
}

variable "dns_servers" {
  description = " List of IP addresses of DNS servers"
  type        = list(string)
  default     = null
}

variable "azurerm_network_ddos_protection_plan_id" {
  description = "Id of the DDOS protection plan"
  type        = string
  default     = ""
}
variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
