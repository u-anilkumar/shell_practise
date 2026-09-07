#!/bin/bash
#shebang
NUM1=1
NUM2=3
SUM=$(($NUM1+$NUM2))
echo "Total is $SUM"

echo "Current user is $USER"
echo "$USER Home directory is $HOME"
echo "Current working directoty is $PWD"
echo "Script Name is $0"
echo "PID is $$"
echo "$(id -u) is the user id."
echo "Args passed to script are $@"
echo " Num of args is $#"
echo "output of previos command is $?"
echo "$1 and $2 are args passed"