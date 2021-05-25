#!/bin/bash

#functions for maths table operators
function add(){
	COUNTER=1
	while [ $COUNTER -lt 16 ]
	do
		SUM=$(expr $1 + $COUNTER)
		echo "$1 + $COUNTER = $SUM"
		((COUNTER++))
	done
}

function sub(){
	COUNTER=1
	while [ $COUNTER -lt 16 ]
	do
		SUM=$(expr $1 - $COUNTER)
		echo "$1 - $COUNTER = $SUM"
		((COUNTER++))
	done
}

function multi(){
	COUNTER=1
	while [ $COUNTER -lt 16 ]
	do
		SUM=$(($1 * $COUNTER))
		echo "$1 * $COUNTER = $SUM"
		((COUNTER++))
	done
}

function div(){
	COUNTER=1
	while [ $COUNTER -lt 16 ]
	do
		SUM=$(expr $1 / $COUNTER)
		echo "$1 / $COUNTER = $SUM"
		((COUNTER++))
	done
}

function exp(){
	COUNTER=1
	while [ $COUNTER -lt 16 ]
	do
		SUM=$(($1 ^ $COUNTER))
		echo "$1 ^ $COUNTER = $SUM"
		((COUNTER++))
	done
}

function newline(){
	echo ""
}

#start of program output
echo Maths Tables
newline

#variable to keep loop running 
keepRunning=true

#start of loop to keep program running
while [ $keepRunning ]
do

echo "Enter '+' for Addition, '-' for Subtraction, '*' for Multiplication, '/' for Division or '^' for Exponent.."

#read user input for operator
read OP

#check to make sure a correct operator has been selected
if [ "$OP" != "+" -a  "$OP" != "-" -a "$OP" != "*" -a "$OP" != "/" -a "$OP" != "^" ];
then
	read -p "Invalid input, please try again: " OP 
fi

if [ "$OP" == "+" ];
then
	OPERATOR="addition"
elif [ "$OP" == "-" ];
then 
	OPERATOR="subtraction"
elif [ "$OP" == "*" ];
then
	OPERATOR="multiplication"
elif [ "$OP" == "/" ];
then 
	OPERATOR="division"
elif [ "$OP" == "^" ];
then
	OPERATOR="exponent"
fi

echo "You have selected: " "$OPERATOR"
newline

#read user input for operand
read -p "Enter number from 1-15 to operate with: " NUM

#check if input number is between 1-15 inclusive
if [ $NUM -gt 15 -o $NUM -lt 1 ];
then
	read -p "Invalid input, please try again: " NUM
fi

newline

#if statements to call function depending on chosen operator
if [ "$OP" == "+" ];
then
	add $NUM
elif [ "$OP" == "-" ];
then
	sub $NUM
elif [ "$OP" == "*" ];
then
	multi $NUM
elif [ "$OP" == "/" ];
then
	div $NUM
elif [ "$OP" == "^" ];
then
	exp $NUM
else
	echo "Invalid input"
fi

newline

#end of program loop
done
