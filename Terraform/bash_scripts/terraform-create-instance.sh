#!/bin/sh

cd /some/path  #Include the path where the terraform scripts will be located
touch err.log output.log draft-file # output.log - file containing useful outputs after terraform execution 
                                    # draft-file - file used as a draft to extract certain output text, for output.log
                                    # err.log - file containing possible errors during terraform execution
terraform init > /dev/null                                   
terraform apply -auto-approve > ./draft-file 2> ./err.log
if [ $? -eq 0 ]
then
   echo -e $(date -u) >> ./output.log
   echo "" >> ./output.log
   echo "Instance Creation Successful" >> ./output.log
   sed '/0m/d' ./draft-file >> ./output.log
   echo "" >> ./output.log

else 
   echo -e $(date -u) >> ./output.log
   echo "" >> ./output.log
   echo "Instance Creation Failed, please see error logs" >> ./output.log
   echo "" >> ./output.log
fi

