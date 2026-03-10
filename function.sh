#!/bin/bash

# below codes are to add colours to improve readability of the script
R="\e[31m"
N="\e[0m"
G="\e[32m"
#to check userid
USER_ID=$(id -u)
 
echo "user id is: $USER_ID"
#fnction to validate the status of the command and use for error handlig

validate() 
{
    # we are passing arguments as $1 and $2
    if [ $1 -eq 0 ]; then
    echo -e "$2 $G SUCCESS"

    else
    echo -e "$2 $R FAILURE $N"

    fi
}

#check if user is sudo user 
if [ $USER_ID -ne 0 ]; then
echo "USER should have sudo permission to run this script" 
else
for package in $@
# $@ --> all the arguments passed to the script
do
dnf list installed $package
if [ $? -eq 0 ]; then
echo "$package is already installed"
else
dnf install $package -y 
validate $? "$package installation"
fi
done
fi