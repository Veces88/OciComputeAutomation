#Add your tenancy OCID
tenancy_ocid = "ocid1.tenancy.oc1..xxx"

#Add the user OCID
user_ocid = "ocid1.user.oc1..xxx"

#Add the path of the private API Signing Key in .pem format; https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#four
private_key_path = "/some/path/private_key.pem"

#Add the fingerprint associated to public API signing key
fingerprint = "99:5f:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"

#Add the OCID of the compartment where the instance will be deployed
compartment_ocid = "ocid1.compartment.oc1..xxx"

#Add your home region
region = "eu-frankfurt-1"

#Add the instance display name
instance_display_name = "gpu-instance"

#Add the shape used for the creation of the instance (ex.: VM.GPU3.2)
instance_shape = "VM.Standard2.1" 

#Add the boot volume OCID which will be used to create the instance
boot_volume_id = "ocid1.bootvolume.oc1.eu-frankfurt-1.xxx"

#Add the OCID of the subnet where the instance will be deployed
subnet_ocid = "ocid1.subnet.oc1.eu-frankfurt-1.xxx"

#Add the  path to the ssh public key (this key is different from the public API signing key in .pem format), together with the ssh private key used to access the instance 
ssh_public_key = "~/some/path/pub_key.pub"




