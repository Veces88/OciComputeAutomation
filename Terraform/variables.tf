# OCI Provider variables
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}

variable "instance_display_name" {
    type = string
    description = "Display name of the instance"
}

variable "instance_shape"{
    type = string
    description = "Shape of the instance"
}

variable "boot_volume_id" {
    type = string
    description = "Boot Volume OCID used to create the instance"
}

variable "subnet_ocid" {
    type = string
    description = "OCID of the subnet where the instance will be created"
}

variable "ssh_public_key" {
  type        = string
  description = "path to public ssh key for the gpu instance"
}
