variable "name" {
  description = "The name of the environment."
}

variable "environment_tag" {
  description = "The environment tag"
}

variable "vpn_name" {
  description = " The name of the VPN."
}

variable "vpn_gateway_id" {
  description = " The ID of the virtual private gateway."
}

variable "customer_gateway_id" {
  description = "The ID of the customer gateway."
}

variable "type" {
  description = "The type of VPN connection. The only type AWS supports at this time is 'ipsec.1'."
  default     = "ipsec.1"
}

variable "static_routes_only" {
  description = "Whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP."
  default     = true
}

variable "destination_cidr_block" {
  description = "The CIDR block associated with the local subnet of the customer network."
}
