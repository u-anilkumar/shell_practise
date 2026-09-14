#!/bin/bash
source ./common.sh
LOG_DIR=/var/log/backup/
LOG_FILE=$LOG_DIR/backup.log
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

#enable colours
R='\e[31m'
G='\e[32m'
N='\e[0m'
Y='\e[33m'



USAGE()
{
    echo -e " USAGE IS: $R sudo sh backup.sh <SOURCE DIR> <DEST DIR> <14(days)> $N" | tee -a $LOG_FILE
    exit 1
}

CHECK_USER 
mkdir -p $LOG_DIR 

if [ ! -d "$SOURCE_DIR" ]; then
    USAGE
    echo -e "SOURCE DIRECTORY Doesnot exist" | tee -a $LOG_FILE
elif [ ! -d "$DEST_DIR" ]; then
    USAGE
    echo -e "DEST DIRECTORY Doesnot exist" | tee -a $LOG_FILE
fi

FILES_FOUND=$(find $SOURCE_DIR -type f -name "*.log" -mtime +$DAYS)
echo -e "$FILES_FOUND" | tee -a $LOG_FILE

if [ -z "$FILES_FOUND" ]; then
    echo -e "No files found to ARCHIVE...$Y SKIPPING $N" | tee -a $LOG_FILE
else   
    tar -czvf "$DEST_DIR/applogs_$(date +%Y_%m_%d_%H_%M_%S)" $FILES_FOUND &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        echo -e "$R Archval failed $N" | tee -a $LOG_FILE
    else
        echo -e "$G ARCHIVAL SUCCESS $N" | tee -a $LOG_FILE
        while IFS= read -r FILES
        do 
            echo "deleting $FILES"| tee -a $LOG_FILE
            if rm -f $FILES ; then 
                echo "deleted $FILES" | tee -a $LOG_FILE
            else 
                echo "deleting $FILES failed" | tee -a $LOG_FILE
            fi
        done <<<$FILES_FOUND
    fi
fi