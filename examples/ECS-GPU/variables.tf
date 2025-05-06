variable "name" {
  description = "Specifies the name of the ECS VM instance"
  type        = string
  nullable    = false
  default     = "DEFAULT_NAME"
}

variable "name_postfix" {
  description = "Name Postfix for ECS VM instance"
  type        = string
  default     = null
}

variable "description" {
  description = "Specifies the description of the instance"
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the region in which to create the resource. If omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "key_pair" {
  description = "Specifies the SSH keypair name used for logging in to the instance"
  type        = string
  nullable    = false
}

variable "flavor_name" {
  description = "Specifies the name of the desired flavor for the instance"
  type        = string
  default     = "pi2.4xlarge.4"
}

variable "image_id" {
  description = "Specifies the image ID of the desired image for the instance"
  type        = string
  default     = null
}

variable "instance_image" {
  description = "Requirements for Compute Instance Image"
  type = object({
    name         = optional(string, "Huawei Cloud EulerOS 2.0 64bit with Tesla Driver 470.256.02 and CUDA 11.4")
    visibility   = optional(string, "public")
    architecture = optional(string, "x86")
    most_recent  = optional(bool, true)
  })
  default = {}
}

variable "subnet_id" {
  description = "VPC Subnet ID in UUID format"
  type        = string
  nullable    = false
  default     = "YOUR_VPC_SUBNET_GUID"
}

variable "availability_zone" {
  description = "Specifies the availability zone in which to create the instance"
  type        = string
  default     = null
}

variable "system_disk_type" {
  description = <<DES
  Specifies the system disk type of the instance:

  * `SAS`: high I/O disk type;
  * `SSD`: ultra-high I/O disk type;
  * `GPSSD`: general purpose SSD disk type;
  * `ESSD`: Extreme SSD type.
  DES
  type        = string
  default     = "SAS"
  validation {
    condition     = contains(["SAS", "SSD", "GPSSD", "ESSD"], var.system_disk_type)
    error_message = "Possible values are: 'SAS', 'SSD', 'GPSSD' and 'ESSD'."
  }
}

variable "system_disk_size" {
  description = "Specifies the system disk size in GB"
  type        = number
  default     = 40
  validation {
    condition     = 1 <= var.system_disk_size && var.system_disk_size <= 1024
    error_message = "Value range: 1 to 1024."
  }
}

variable "data_disks1" {
  description = "Specifies the ECS data disks and parameters"
  type = list(object({
    type = string
    size = number
  }))
  default = []
}

variable "data_disks" {
  description = <<DES
  Specifies the EVS Volumes and parameters:

  * `type` - Specifies the ECS data disk type, which must be one of available disk types, contains of SSD, GPSSD and SAS;
  * `size` - Specifies the data disk size, in GB. The value ranges form 10 to 32768;
  * `snapshot_id` - Specifies the snapshot id;
  * `kms_key_id` - Specifies the ID of a KMS key, this is used to encrypt the disk.
  DES
  type = list(object({
    volume_type = optional(string, "SSD")
    size        = optional(number, 40)
    snapshot_id = optional(string)
    kms_key_id  = optional(string)
  }))
  default = []
}

variable "security_group_ids" {
  description = "Specifies an array of one or more security group IDs to associate with the instance"
  type        = list(string)
  default     = []
}

variable "agency_name" {
  description = "Specifies the IAM agency name which is created on IAM to provide temporary credentials for ECS to access cloud services"
  type        = string
  default     = null
}

variable "eip_enabled" {
  description = "Enabler for EIP"
  type        = bool
  default     = false
}

variable "eip_address" {
  description = "Specifies the EIP address to associate"
  type        = string
  default     = null
}

variable "tags" {
  description = "Specifies the key/value pairs to associate with the VPC"
  type        = map(string)
  default     = {}
}
