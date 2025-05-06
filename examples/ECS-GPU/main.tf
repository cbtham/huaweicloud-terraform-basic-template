data "huaweicloud_availability_zones" "zones" {
  region = var.region
}

data "huaweicloud_images_image" "compute_instance_image" {
  name         = var.instance_image.name
  visibility   = var.instance_image.visibility
  architecture = var.instance_image.architecture
  most_recent  = var.instance_image.most_recent
  region       = var.region
}

locals {
  name = var.name_postfix == null ? var.name : format("%s-%s", var.name, var.name_postfix)
}

resource "huaweicloud_compute_instance" "main" {
  name               = local.name
  description        = var.description
  region             = var.region
  image_id           = var.image_id == null ? data.huaweicloud_images_image.compute_instance_image.id : var.image_id
  flavor_name        = var.flavor_name
  admin_pass         = "YOUR_PASSWORD"
  agency_name        = var.agency_name
  security_group_ids = var.security_group_ids
  availability_zone  = var.availability_zone == null ? element(data.huaweicloud_availability_zones.zones.names, 0) : var.availability_zone
  system_disk_size   = var.system_disk_size
  system_disk_type   = var.system_disk_type


  network {
    uuid = var.subnet_id
  }

  dynamic "data_disks" {
    for_each = var.data_disks
    content {
      type        = data_disks.value.type
      size        = data_disks.value.size
      snapshot_id = data_disks.value.snapshot_id
      kms_key_id  = data_disks.value.kms_key_id
    }
  }

  tags = var.tags
}


resource "huaweicloud_compute_eip_associate" "ecs_associated" {
  count = var.eip_enabled ? 1 : 0

  public_ip   = var.eip_address
  instance_id = huaweicloud_compute_instance.main.id
}
