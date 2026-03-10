#!/bin/bash
R="\e[31m"
N="\e[0m"
G="\e[32m"
USER_ID=$(id -u)
 
echo "user id is: $USER_ID"
validate()
{
    if [ $1 -eq 0 ]; then
    echo -e "$2 $G SUCCESS"

    else
    echo -e "$2 $R FAILURE $N"

    fi
}

if [ $USER_ID -ne 0 ]; then
echo "USER should have sudo permission to run this script" 
else

dnf list installed nginx
if [ $? -eq 0 ]; then
echo "nginx is already installed"
else
dnf install nginx -y 
validate $? "nginx installation"
fi

fi