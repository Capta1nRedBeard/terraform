data "yandex_vpc_network" "default" {
  name = var.network_name
}

data "yandex_vpc_subnet" "default" {
  name = var.subnet_name
} 


# Создание группы безопасности
resource "yandex_vpc_security_group" "k8s-security-group" {
  name        = "k8s-security-group"
  description = "Правила группы разрешают подключение к сервисам из интернета."
  network_id  = data.yandex_vpc_network.default.id
  ingress {
    protocol          = "TCP"
    description       = "Правило разрешает проверки доступности с диапазона адресов балансировщика нагрузки. Нужно для работы отказоустойчивого кластера Managed Service for k8srnetes и сервисов балансировщика."
    predefined_target = "loadbalancer_healthchecks"
    from_port         = 0
    to_port           = 65535
  }
    ingress {
    protocol          = "TCP"
    description       = "Правило разрешает входящий HTTPS трафик из интернета."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 443
    to_port           = 443
  }
    ingress {
    protocol          = "TCP"
    description       = "Правило разрешает входящий HTTP трафик из интернета."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 80
    to_port           = 80
  }
  ingress {
    protocol          = "ANY"
    description       = "Правило разрешает взаимодействие мастер-узел и узел-узел внутри группы безопасности."
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol          = "ANY"
    description       = "Правило разрешает взаимодействие под-под и сервис-сервис. Укажите подсети вашего кластера Managed Service for k8srnetes и сервисов."
    v4_cidr_blocks    = [var.cluster_ipv4_range, var.service_ipv4_range]
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol          = "ICMP"
    description       = "Правило разрешает отладочные ICMP-пакеты из внутренних подсетей."
    v4_cidr_blocks    = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  }
  ingress {
    protocol          = "TCP"
    description       = "Правило разрешает входящий трафик из интернета на диапазон портов NodePort."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 30000
    to_port           = 32767
  }
  egress {
    protocol          = "ANY"
    description       = "Правило разрешает весь исходящий трафик. Узлы могут связаться с Yandex Container Registry, Yandex Object Storage, Docker Hub и т. д."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 0
    to_port           = 65535
  }
}
