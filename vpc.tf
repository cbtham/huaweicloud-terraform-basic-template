# Create a VPC
resource "huaweicloud_vpc" "platform_eng_vpc" {
  name = "dev_vpc_pe_001"
  cidr = "192.168.0.0/16" # Define the IP address range for your VPC
}

resource "huaweicloud_vpc_subnet" "appsubnet" {
  name       = "dev_subnet_pe_app_az1"
  cidr       = "192.168.10.0/24" # Define the IP address range for your subnet
  gateway_ip = "192.168.10.1"
  //dns is required for cce node installing
  primary_dns   = "100.125.1.250"
  secondary_dns = "100.125.21.250"
  vpc_id     = huaweicloud_vpc.platform_eng_vpc.id
}

resource "huaweicloud_vpc_subnet" "datasubnet" {
  name       = "dev_subnet_pe_data_az1"
  cidr       = "192.168.10.0/24" # Define the IP address range for your subnet
  gateway_ip = "192.168.10.1"
  //dns is required for cce node installing
  primary_dns   = "100.125.1.250"
  secondary_dns = "100.125.21.250"
  vpc_id     = huaweicloud_vpc.platform_eng_vpc.id
}

resource "huaweicloud_networking_secgroup" "pesecgroup" {
  name        = "dev_sg_pe_app_az1"
  description = "basic security group"
}

output "huaweicloud_vpc_id" {
  description = "Created VPC ID"
  value       = huaweicloud_vpc.platform_eng_vpc.id
  depends_on = [
    huaweicloud_vpc.platform_eng_vpc,
  ]
}

output "huaweicloud_vpc_appsubnet_id" {
  description = "Created App Subnet ID"
  value       = huaweicloud_vpc_subnet.appsubnet.id
    depends_on = [
    huaweicloud_vpc_subnet.appsubnet,
  ]
}

# output "huaweicloud_vpc_datasubnet_id" {
#   description = "Created Data Subnet ID"
#   value       = huaweicloud_vpc_subnet.datasubnet.id
#     depends_on = [
#     huaweicloud_vpc_subnet.datasubnet,
#   ]
# }

output "huaweicloud_networking_secgroup_id" {
  description = "Created security group ID"
  value       = huaweicloud_networking_secgroup.pesecgroup.id
    depends_on = [
    huaweicloud_networking_secgroup.pesecgroup,
  ]  
}
