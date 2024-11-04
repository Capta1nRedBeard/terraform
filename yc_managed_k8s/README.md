<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.87.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_yandex_cloud_network"></a> [yandex\_cloud\_network](#module\_yandex\_cloud\_network) | ./modules/tf-yc-network | n/a |
| <a name="module_yandex_kubernetes_cluster"></a> [yandex\_kubernetes\_cluster](#module\_yandex\_kubernetes\_cluster) | ./modules/tf-yc-kubernetes | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | ID облака | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID каталога | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->