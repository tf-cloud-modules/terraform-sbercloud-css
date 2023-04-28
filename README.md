# Sbercloud CSS Terraform module

## Provider configuration
```hcl
provider "sbercloud" {
  auth_url = "https://iam.ru-moscow-1.hc.sbercloud.ru/v3"
  region   = "ru-moscow-1"
}
```

## Usage
```hcl
module "css" {
    source  = "tf-cloud-modules/css/sbercloud"

    name            = "css-test"
    engine_version  = "7.10.2"
    expect_node_num = 1
    password        = "your$trongP@ssWord1241"

    node_config = [
    {
        availability_zone = "ru-moscow-1a"
        flavor            = "ess.spec-4u8g"

        network_info = [{
        security_group_id = "8d485ffa-3a2e-44d0-9b84-337b9a412c8b"
        subnet_id         = "a9a83f7e-b47a-4fb5-a61e-0a13a552c178"
        vpc_id            = "9a2628cc-e82b-4611-bad7-aabcc6e5ba66"
        }]
        volume = [{
        volume_type = "HIGH"
        size        = 40
        }]
    }
  ]

    backup_strategy = [
    {
        start_time = "00:00 GMT+08:00"
        keep_days  = 7
    }
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_sbercloud"></a> [sbercloud](#requirement\_sbercloud) | >= 1.9.0, < 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sbercloud"></a> [sbercloud](#provider\_sbercloud) | 1.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sbercloud_css_cluster.this](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/css_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_strategy"></a> [backup\_strategy](#input\_backup\_strategy) | Specifies the advanced backup policy. | `list(any)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_engine_type"></a> [engine\_type](#input\_engine\_type) | Engine type. | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Engine version. | `string` | n/a | yes |
| <a name="input_expect_node_num"></a> [expect\_node\_num](#input\_expect\_node\_num) | Number of cluster instances. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Cluster name. | `string` | n/a | yes |
| <a name="input_node_config"></a> [node\_config](#input\_node\_config) | Node configuration. | `list(any)` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password of the cluster administrator admin in security mode. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which to create the cluster resource. | `string` | `null` | no |
| <a name="input_security_mode"></a> [security\_mode](#input\_security\_mode) | Whether to enable communication encryption and security authentication. | `bool` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The key/value pairs to associate with the cluster. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Indicates the IP address and port number. |
| <a name="output_id"></a> [id](#output\_id) | Specifies a resource ID in UUID format. |
| <a name="output_password"></a> [password](#output\_password) | Password of the cluster administrator admin in security mode. |
<!-- END_TF_DOCS -->