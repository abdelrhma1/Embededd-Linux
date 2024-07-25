#!/usr/bin/bash
#Descraption : this code use to sum and substract two number.
#input: user enter two number and operation.
#output: the result.
#-------------------------------------------------------------/
##function to add two number## 
function add()
{
    echo "result="$((num1+num2))
}
##function to subtract two number## 
function sub()
{
    echo "result="$((num1-num2))
}
#------------------------------------------------------------/
##function main## 
function main()
{
declare -i num1=0
declare -i num2=0
declare operation=""
echo "Please Enter frist Number : "
read num1
echo "Please Enter second Number : "
read num2
echo "Please Enter operation +/-"
read operation
if [[ "${operation}" == "+" ]];then 
 add
elif [[ "${operation}" == "-" ]];then 
 sub
else 
echo "invalid operation "
exit 1
fi
}
main