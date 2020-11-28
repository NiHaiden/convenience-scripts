#!/bin/bash

echo "SA Password: "

read -s sa_password



sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$sa_password" \
   -p 1433:1433 --name sql1 -h sql1 \
   -d mcr.microsoft.com/mssql/server:2019-latest

echo "Container successfully deployed"
echo "Copyright Niklas Haiden (narv.icu) 2020"
