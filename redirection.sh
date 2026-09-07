#!/bin/bash
TS=$(date)
echo "script execution started at $TS" | tee -a $LOG_FILE
USERID=$(id -u)
#store logs in /var/log/shell_p
LOG_DIR=/var/log/shell_p
LOG_FILE=$LOG_DIR/$0.log
mkdir -p $LOG_DIR

if [ $USERID -ne 0 ]; then
    echo "Admin access is needed to run this script" | sudo tee -a $LOG_FILE
    exit 1
fi

dnf install nginx -y &>> $LOG_FILE

if [ $? -ne 0 ]; then
    echo "nginx installation is ... Failure" | tee -a $LOG_FILE
else 
    echo "Nginx Installation is .. SUCCESS" | tee -a $LOG_FILE
fi
TS_END=$(date)
echo "script execution ended at $TS_END" | tee -a $LOG_FILE