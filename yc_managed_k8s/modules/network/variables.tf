variable "network_name" {
  description = "Имя сети"
  type        = string
  default     =  "default"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     =  "default-ru-central1-a"
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