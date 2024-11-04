<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.87.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_kms_symmetric_key.k8s-kms-key](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kms_symmetric_key) | resource |
| [yandex_kubernetes_cluster.zonal-k8s-cluster-01](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster) | resource |
| [yandex_kubernetes_node_group.node-group-01](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group) | resource |
| [yandex_iam_service_account.service-account](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/iam_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ipv4_range"></a> [cluster\_ipv4\_range](#input\_cluster\_ipv4\_range) | Диапазон IP-адресов, из которого будут выделяться IP-адреса для подов | `string` | `"10.112.0.0/16"` | no |
| <a name="input_default_network_id"></a> [default\_network\_id](#input\_default\_network\_id) | ID сети | `string` | n/a | yes |
| <a name="input_default_subnet_id"></a> [default\_subnet\_id](#input\_default\_subnet\_id) | ID подсети | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | ID группы безопасности | `string` | n/a | yes |
| <a name="input_service_ipv4_range"></a> [service\_ipv4\_range](#input\_service\_ipv4\_range) | Диапазон IP-адресов, из которого будут выделяться IP-адреса для сервисов | `string` | `"10.96.0.0/16"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Зона доступности | `string` | `"ru-central1-a"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->