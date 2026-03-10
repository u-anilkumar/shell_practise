#!/bin/bash
mkdir -p /var/log/shell_script
logFile=$($0)
echo "script name is : $logFile" | tee -a logFile
# below codes are to add colours to improve readability of the script
R="\e[31m"
N="\e[0m"
G="\e[32m"
#to check userid
USER_ID=$(id -u) 
 
echo "user id is: $USER_ID" | tee -a logFile
#fnction to validate the status of the command and use for error handlig

validate() 
{
    # we are passing arguments as $1 and $2
    if [ $1 -eq 0 ]; then
    echo -e "$2 $G SUCCESS" | tee -a logFile

    else
    echo -e "$2 $R FAILURE $N" | tee -a logFile

    fi
}

#check if user is sudo user 
if [ $USER_ID -ne 0 ]; then
echo "USER should have sudo permission to run this script" | tee -a logFile
else
for package in $@
# $@ --> all the arguments passed to the script
do
dnf list installed $package & >> logFile
if [ $? -eq 0 ]; then
echo "$package is already installed" | tee -a logFile
else
dnf install $package -y & >> logFile
validate $? "$package installation" 
fi
done
fi