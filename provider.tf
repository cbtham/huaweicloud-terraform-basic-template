terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud" # https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs
      version = ">= 1.36.0"
    }
  }
}

provider "huaweicloud" {
  access_key = "REDACTED-AK" # Access key to provision resource, create in console
  secret_key = "REDACTED-SK" # Secret key to provision resource, part of access key on creation
  region     = "ap-southeast-3"
}
