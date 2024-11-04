data "yandex_iam_service_account" "service-account" {
  name = "service-account"
}

# Кластер Kubernetes
resource "yandex_kubernetes_cluster" "zonal-k8s-cluster-01" {
  name        = "zonal-k8s-cluster-01"
  description = "Кластер k8s"
  network_id = var.default_network_id
  cluster_ipv4_range = var.cluster_ipv4_range
  service_ipv4_range = var.service_ipv4_range

  master {
    version = "1.27"
    zonal {
      zone      = var.zone
      subnet_id = var.default_subnet_id
    }

    public_ip = true

    security_group_ids = [var.security_group_id]

    maintenance_policy {
      auto_upgrade = true
    }
  }

  service_account_id      = data.yandex_iam_service_account.service-account.id
  node_service_account_id = data.yandex_iam_service_account.service-account.id

  kms_provider {
    key_id = "${yandex_kms_symmetric_key.k8s-kms-key.id}"
  }
}


# Ключ Yandex Key Management Service для шифрования важной информации, такой как пароли, OAuth-токены и SSH-ключи.
resource "yandex_kms_symmetric_key" "k8s-kms-key" { 
  name              = "k8s-kms-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}


# Группа узлов кластера
resource "yandex_kubernetes_node_group" "node-group-01" {
  cluster_id  = "${yandex_kubernetes_cluster.zonal-k8s-cluster-01.id}"
  name        = "node-group-01"
  description = "Группа узлов клстера k8s"
  version     = "1.27"

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat                = true
      subnet_ids         = [var.default_subnet_id]
      security_group_ids = [var.security_group_id]
    }

    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }

  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true
  }
}


# Создание публичной зоны DNS и ресурсной записи
resource "yandex_dns_zone" "xxxxxx-ru-zone" { # Заменить!
  name        = "xxxxxx-ru-zone" # Заменить!
  description = "Зона DNS для xxxxxx.ru" # Заменить!

  zone       = "xxxxxx.ru." # Заменить!
  public     = true
}