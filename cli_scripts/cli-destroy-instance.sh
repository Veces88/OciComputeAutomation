#!/usr/bin/bash
avail_domain="TkFi:EU-FRANKFURT-1-AD-1"
compartment_id="ocid1.compartment.oc1..xxx"
shape="VM.Standard2.2"
display_name="CLI-Instance"
log="/some/path/instance.log" # Add path for the log file

instance_ocid=$(oci compute instance list --compartment-id $compartment_id --display-name $display_name --output table --query "data [*].{InstanceName:\"display-name\", OCID:id, State:\"lifecycle-state\"}"  | grep -v "TERMINAT" | awk 'NR>2{print $4}' | grep ocid)

echo $(date -u) "Terminating instance $display_name" | tee -a $log

oci compute instance terminate --instance-id $instance_ocid --preserve-boot-volume true --force > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo $(date -u) "Termination of instance $display_name - SUCCESSFUL. OCID - $instance_ocid" | tee -a $log
else
        echo $(date -u) "Termination of instance $display_name - FAILED. OCID - $instance_ocid"  | tee -a $log
fi

