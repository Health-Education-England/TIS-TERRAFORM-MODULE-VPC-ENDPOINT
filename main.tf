data aws_vpc "local_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}_vpc"]
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}_private_*"]
  }
}

resource "aws_vpc_endpoint" "endpoint" {
  vpc_id            = data.aws_vpc.local_vpc.id
  service_name      = "com.amazonaws.eu-west-2.${var.service_name}"
  vpc_endpoint_type = var.endpoint_type

  subnet_ids = flatten([data.aws_subnets.private_subnets.ids])

  private_dns_enabled = true

  tags = var.tags
}