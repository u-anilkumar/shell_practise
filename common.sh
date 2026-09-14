#!bin/bash
USER=$(id -u)

#enable colours
R='\e[31m'
G='\e[32m'
N='\e[0m'
Y='\e[33m'

#check user
CHECK_USER()
{
    if [ $USER -ne 0 ]; then
        echo -e "You do not have permission to run this script"
        exit 1
    fi
}

