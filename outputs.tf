output "app_builder_dns_name" {
  value = aws_instance.app_builder.public_dns
}

output "prod_server_dns_name" {
  value = aws_instance.prod_server.public_dns
}