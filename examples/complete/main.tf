provider "sbercloud" {
  auth_url = "https://iam.ru-moscow-1.hc.sbercloud.ru/v3"
  region   = "ru-moscow-1"
}

module "css" {
  source = "../.."

  name            = "css-example"
  engine_version  = "7.10.2"
  expect_node_num = "1"
  password        = "ChangeMe123!ChangeMe123!"
  region          = "ru-moscow-1"

  node_config = [
    {
      availability_zone = "ru-moscow-1a"
      flavor            = "ess.spec-4u8g"

      network_info = [
        {
          security_group_id = "00000000-0000-0000-0000-000000000000"
          subnet_id         = "00000000-0000-0000-0000-000000000000"
          vpc_id            = "00000000-0000-0000-0000-000000000000"
        }
      ]

      volume = [
        {
          volume_type = "HIGH"
          size        = 40
        }
      ]
    }
  ]

  backup_strategy = [
    {
      start_time = "00:00 GMT+08:00"
      keep_days  = 7
    }
  ]
}
