output "default_network_id" {
  description = "ID сети"
  value       = data.yandex_vpc_network.default.id
} 

output "default_subnet_id" {
  description = "ID подсети"
  value       = data.yandex_vpc_subnet.default.id
} 

output "security_group_id" {
  description = "ID группы безопасности"
  value       = yandex_vpc_security_group.k8s-security-group.id
} 
