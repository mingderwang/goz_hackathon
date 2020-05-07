#!/bin/bash
cd /home/mwang
#/home/mwang/go/bin/rly transact raw update-client muzamint gameofzoneshub-1a uzamintclientx
#/home/mwang/go/bin/rly transact raw update-client muzamint gameofzoneshub-1a uzamintclientx

#test='{"height":"0","txhash":"97F19EE2A9ABACF145840EF4FFBDB73862090FF1FE864C8C84B93C6559E0E8FF","codespace":"client","code":9,"gas_wanted":"500000","gas_used":"65618"}'
go_run=true


loop() {
if $go_run 
then
	echo "go in $1"
result=$(/home/mwang/update22.sh | jq .height -)
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
