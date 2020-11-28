#!/bin/bash

echo "Do you accept the EULA of MSSQL-Server 2019?"
echo "Answer with Y or N"

read eula_answer

if [ "$eula_answer" == "Y" ]
then

 echo "SA Password: "

 read -s sa_password



 sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$sa_password" \
    -p 1433:1433 --name sql1 -h sql1 \
    -d mcr.microsoft.com/mssql/server:2019-latest
 echo "Container was successfully deployed. :)"
 echo "Script created by Narvimpere"
else
  echo "You declined the license. Answer: $eula_answer"
fi


