### Подключение модулей
# Модуль k8s 
module "yandex_kubernetes_cluster" {
  source = "./modules/kubernetes"
  default_network_id = module.yandex_cloud_network.default_network_id
  default_subnet_id = module.yandex_cloud_network.default_subnet_id
  security_group_id = module.yandex_cloud_network.security_group_id
}

# Модуль сети
module "yandex_cloud_network" {
  source = "./modules/network"
}