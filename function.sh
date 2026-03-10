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
for package in $@
do
dnf list installed $package
if [ $? -eq 0 ]; then
echo "$package is already installed"
else
dnf install $package -y 
validate $? "$package installation"
fi

fi