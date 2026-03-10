#!/bin/bash
R="\e[31m"
USER_ID=$(id -u)
 
echo "user id is: $USER_ID"
validate()
{
    if [ $1 -eq 0 ]; then
    echo "$2 $R SUCCESS"

    else
    echo "$2 FAILURE"

    fi
}

if [ $USER_ID -ne 0 ]; then
echo "USER should have sudo permission to run this script" 
else
dnf install nginx -y 
validate $? "nginx installation"

fi