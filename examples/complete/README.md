# Complete CSS example

This example provisions one SberCloud CSS cluster through the parent module.

Before applying it, export `SBC_ACCESS_KEY` and `SBC_SECRET_KEY`, then replace
the placeholder VPC, subnet, and security-group IDs in `main.tf`.

```sh
terraform init -backend=false
terraform validate
terraform plan
```

The example pins `sbercloud-terraform/sbercloud` to `1.10.0`, the version
validated with this module.
