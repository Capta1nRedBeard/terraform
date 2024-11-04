variable "zone" {
  description = "Зона доступности"
  type        = string
  default     =  "ru-central1-a"
}

variable "default_network_id" {
  description = "ID сети"
  type        = string
}

variable "default_subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "security_group_id" {
  description = "ID группы безопасности"
  type        = string
}

variable "cluster_ipv4_range" {
  description = "Диапазон IP-адресов, из которого будут выделяться IP-адреса для подов"
  type        = string
  default     =  "10.112.0.0/16"
}

variable "service_ipv4_range" {
  description = "Диапазон IP-адресов, из которого будут выделяться IP-адреса для сервисов"
  type        = string
  default     =  "10.96.0.0/16"
}


