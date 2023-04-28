resource "sbercloud_css_cluster" "this" {
  count           = var.create ? 1 : 0
  region          = var.region
  name            = var.name
  engine_type     = var.engine_type
  engine_version  = var.engine_version
  expect_node_num = var.expect_node_num
  security_mode   = var.security_mode
  password        = var.password

  dynamic "node_config" {
    for_each = var.node_config
    content {
      availability_zone = lookup(node_config.value, "availability_zone", null)
      flavor            = lookup(node_config.value, "flavor")

      dynamic "network_info" {
        for_each = lookup(node_config.value, "network_info")
        content {
          security_group_id = lookup(network_info.value, "security_group_id")
          subnet_id         = lookup(network_info.value, "subnet_id")
          vpc_id            = lookup(network_info.value, "vpc_id")
        }
      }

      dynamic "volume" {
        for_each = lookup(node_config.value, "volume")
        content {
          volume_type = lookup(volume.value, "volume_type")
          size        = lookup(volume.value, "size")
        }
      }

    }
  }

  dynamic "backup_strategy" {
    for_each = var.backup_strategy != null ? var.backup_strategy : []
    content {
      start_time = lookup(backup_strategy.value, "start_time")
      keep_days  = lookup(backup_strategy.value, "keep_days", null)
      prefix     = lookup(backup_strategy.value, "prefix", null)
    }
  }

  tags = var.tags
}