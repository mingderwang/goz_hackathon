#!/bin/bash
go_run=true


loop() {
if $go_run 
then
	echo "go in $1"
result=$(./update11.sh | jq .height -)
echo $result
#result='"0"'
#result=$(echo $test | jq .height -)
if [ -z $result ]
then 
	echo "is empty"
else
if [ $result = '"0"' ] 
then
	echo "is 0"
else 
	echo "is not 0"
	go_run=false
fi

fi
#else
#	echo "stop"
fi

}

for i in {1..999}
do
   #echo "try $i times"
   loop $i
done
