output "id" {
  value = aws_vpc_endpoint.endpoint.id
}

output "arn" {
  value = aws_vpc_endpoint.endpoint.arn
}

output "dns_entry" {
  value = aws_vpc_endpoint.endpoint.dns_entry
}

output "network_interface_ids" {
  value = aws_vpc_endpoint.endpoint.network_interface_ids
}