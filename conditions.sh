
#!/bin/bash 
# above line is called shebang and it is the interpreter of shell script

if [ $1 -gt $2 ]; then
echo "$1 is greater than $2"
elif [ $1 -eq $2 ]; then
echo "$1 is equal to $2"
else 
echo "$1 is less than $2"
fi 