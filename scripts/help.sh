#!/bin/sh
echo "creating a new path called: $1"

rly lite delete gameofzoneshub-1a 
rly lite delete muzamint 
rly paths generate muzamint transfer gameofzoneshub-1a transfer $1 -f -d

rly config show | grep -A 20 "$1"

rly lite init gameofzoneshub-1a -f
rly lite init muzamint -f
rly tx link $1 -d


rly ch l
rly pth l
