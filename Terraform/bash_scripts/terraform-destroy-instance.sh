#!/bin/sh
cd /some/path #Include the path where the terraform scripts will be located
terraform destroy -auto-approve > ./draft-file 2> ./err.log
if [ $? -eq 0 ]
then
   echo -e $(date -u) >> ./output.log
   echo "" >> ./output.log
   echo "Instance Removal Successful" >> ./output.log
   echo "" >> ./output.log

else  
   echo -e $(date -u) >> ./output.log
   echo "" >> ./output.log
   echo "Instance Removal Failed, please see error logs" >> ./output.log
   echo "" >> ./output.log
fi


