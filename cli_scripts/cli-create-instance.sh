#!/usr/bin/bash
avail_domain="TkFi:EU-FRANKFURT-1-AD-1" # Add AD where the instance will be deployed

compartment_id="ocid1.compartment.oc1..xxx"    #Add compartment OCID where the instance will be created

shape="VM.Standard2.2" # Add shape used to create the instance

subnet_id="ocid1.subnet.oc1.eu-frankfurt-1.xxxx" # Add subnet OCID where the instance will be created
                                                                            
display_name="CLI-Instance" # Add display name of the instance

boot_volume="ocid1.bootvolume.oc1.eu-frankfurt-1.xxx" # Add boot volume OCID used to create the instance
                   
log="/some/path/instance.log" # Add path for the log file

public_key="/some/path/pub_key.pub" # Add path of the ssh public key 

echo $(date -u) "Creating instance $display_name" | tee -a $log

oci compute instance launch --availability-domain $avail_domain --compartment-id $compartment_id --shape $shape --subnet-id $subnet_id --display-name $display_name --source-boot-volume-id $boot_volume --ssh-authorized-keys-file $public_key > /dev/null 2>&1
if [ $? -eq 0 ]
then
        instance_ocid=$(oci compute instance list --compartment-id $compartment_id --display-name $display_name --output table --query "data [*].{InstanceName:\"display-name\", OCID:id, State:\"lifecycle-state\"}"  | grep -v "TERMINAT" | awk 'NR>2{print $4}' | grep ocid)
        echo $(date -u) "Creation of instance $display_name - SUCCESSFUL. OCID - $instance_ocid" | tee -a $log
else
        instance_ocid=$(oci compute instance list --compartment-id $compartment_id --display-name $display_name --output table --query "data [*].{InstanceName:\"display-name\", OCID:id, State:\"lifecycle-state\"}"  | grep -v "TERMINAT" | awk 'NR>2{print $4}' | grep ocid)
        echo $(date -u) "Creation of instance $display_name - FAILED" | tee -a $log
fi

