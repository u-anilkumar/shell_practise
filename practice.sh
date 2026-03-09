#!/bin/bash
echo "Hello Anil"

SUM=$(($1+$2))

echo "sum is $SUM"

echo "Total num of args passed: $#"
echo " All vars passed in script: $@"
echo "current working directoty is $PWD"
echo "Current user is $USER and user home directory is $HOME"
echo "PID of script $$"
echo "name of script $0"
