terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud" # https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs
      version = ">= 1.36.0"
    }
  }
}

provider "huaweicloud" {
  access_key = "YOUR_AK"
  secret_key = "YOUR_SK"
  region     = "ap-southeast-3"
}
