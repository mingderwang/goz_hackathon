#!/bin/sh
echo "creating a new path called: $1"

rly lite delete ibc0 
rly lite delete ibc1 
rly paths generate ibc0 transfer ibc1 transfer $1 -f -d

rly config show | grep -A 20 "$1"

rly lite init ibc0 -f
rly lite init ibc1 -f
rly tx link $1 -d


rly ch l
rly pth l
