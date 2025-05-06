variable "vpc_name" {
  default = "iac_vpc"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "subnet_name" {
  default = "iac_subnet"
}

variable "subnet_cidr" {
  default = "172.16.10.0/24"
}

variable "subnet_gateway" {
  default = "172.16.10.1"
}

variable "primary_dns" {
  default = "100.125.1.250"
}

variable "secondary_dns" {
  default = "100.125.21.250"
}

variable "bandwidth_name" {
  default = "iac_bandwidth"
}

variable "key_pair_name" {
  default = "iac_keypair"
}

variable "cce_cluster_name" {
  default = "techwave25-iac"
}

variable "cce_cluster_flavor" {
  default = "cce.s1.small"
}

variable "node_name" {
  default = "gpunode"
}

variable "node_flavor" {
  default = "pi2.4xlarge.4"
}

variable "root_volume_size" {
  default = 40
}

variable "root_volume_type" {
  default = "SSD"
}

variable "data_volume_size" {
  default = 100
}

variable "data_volume_type" {
  default = "SSD"
}

variable "ecs_flavor" {
  #default = "pi2.2xlarge.4"
  default = "pi2.4xlarge.4"
}

variable "ecs_name" {
  default = "iac_gpu_node"
}

variable "os" {
  default = "EulerOS 2.9" # Master Node EulerOS https://support.huaweicloud.com/intl/en-us/api-cce/node-os.html
}

variable "image_name" {
  default = "Huawei Cloud EulerOS 2.0 64bit with Tesla Driver 470.256.02 and CUDA 11.4"
}
