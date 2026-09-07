#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Admin access is needed to run this script"
    exit 1
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "nginx installation is ... Failure"
else 
    echo "Nginx Installation is .. SUCCESS"
fi
