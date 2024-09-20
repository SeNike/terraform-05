output "subnet_ids" {
  description = "List of subnet IDs"
  value       = [for subnet in yandex_vpc_subnet.this : subnet.id]
}

output "subnet_cidrs" {
  description = "List of subnet CIDR blocks"
  value       = [for subnet in yandex_vpc_subnet.this : subnet.v4_cidr_blocks[0]]
}

output "security_group_id" {
  value = yandex_vpc_security_group.example.id
}
