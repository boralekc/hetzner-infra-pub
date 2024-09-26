terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.120.0"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "hcloud-state"
    region = "ru-central1"
    key    = "hcloud-state/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # This option is required to describe backend for Terraform version 1.6.1 or higher.
    skip_s3_checksum            = true # This option is required to describe backend for Terraform version 1.6.3 or higher.
  }
}

provider "yandex" {
  cloud_id                 = var.CLOUD_ID
  folder_id                = var.FOLDER_ID
  zone                     = "ru-central1-a"
  service_account_key_file = var.TOKEN != "" ? "" : "D:\\Dev\\yandex-key\\authorized_key.json"
}
