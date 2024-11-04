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
| [yandex_vpc_security_group.k8s-security-group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_security_group) | resource |
| [yandex_vpc_network.default](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_network) | data source |
| [yandex_vpc_subnet.default](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ipv4_range"></a> [cluster\_ipv4\_range](#input\_cluster\_ipv4\_range) | Диапазон IP-адресов, из которого будут выделяться IP-адреса для подов | `string` | `"10.112.0.0/16"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Имя сети | `string` | `"default"` | no |
| <a name="input_service_ipv4_range"></a> [service\_ipv4\_range](#input\_service\_ipv4\_range) | Диапазон IP-адресов, из которого будут выделяться IP-адреса для сервисов | `string` | `"10.96.0.0/16"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Имя подсети | `string` | `"default-ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_network_id"></a> [default\_network\_id](#output\_default\_network\_id) | ID сети |
| <a name="output_default_subnet_id"></a> [default\_subnet\_id](#output\_default\_subnet\_id) | ID подсети |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID группы безопасности |
<!-- END_TF_DOCS -->