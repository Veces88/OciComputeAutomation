resource "oci_core_instance" "gpu" {
    availability_domain = local.availability_domain
    compartment_id = var.compartment_ocid
    shape = var.instance_shape
    display_name = var.instance_display_name
    preserve_boot_volume = true
    source_details {
        source_type = "bootVolume"
        source_id = var.boot_volume_id 
    }
    create_vnic_details {
      subnet_id = var.subnet_ocid
          assign_public_ip = true
    }
    metadata = {
      ssh_authorized_keys = file(var.ssh_public_key)
    }
}

    output "instance_private_ip" {
      value = oci_core_instance.gpu.*.private_ip
    }

    output "instance_public_ip" {
      value = oci_core_instance.gpu.*.public_ip
    }

    output "instance_ocid" {
      value = oci_core_instance.gpu.id
    }
 




