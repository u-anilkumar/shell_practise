#!/bin/bash

USER_ID= id -u
 
echo "user id is: $USER_ID"
validate()
{
    if [$1 ne 0 ]; then
    echo "$2 FAILURE"

    else
    echo "$2 SUCCESS"
}

dnf install nginx -y
validate $? nginix installation