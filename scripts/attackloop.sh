#!/bin/bash
rly q unrelay
rly tx rly d5 -d
while true; do 
for i in {1..3}
do
	echo "try $i times"
   ./loop.sh
done
rly tx rly d5 -d
echo "---flush------------------"
rly q unrelayed d5
echo "---------------------"
done
