resource "aws_vpn_connection" "vpn" {
  vpn_gateway_id        = "${var.vpn_gateway_id}"
  customer_gateway_id   = "${var.customer_gateway_id}"
  type                  = "${var.type}"
  static_routes_only    = "${var.static_routes_only}"
  tunnel1_preshared_key = "${data.aws_ssm_parameter.VPN-PSK.value}"
  tunnel2_preshared_key = "${data.aws_ssm_parameter.VPN-PSK.value}"

  tags = {
    Name = "${upper(var.name)}-${var.vpn_name}"
  }
}

resource "aws_vpn_connection_route" "office" {
  destination_cidr_block = "${var.destination_cidr_block}"
  vpn_connection_id      = "${aws_vpn_connection.vpn.id}"
}

data "aws_ssm_parameter" "VPN-PSK" {
  name = "${var.environment_tag}-VPN${var.vpn_name}PSK"
}
