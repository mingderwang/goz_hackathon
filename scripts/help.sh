#!/bin/sh
echo "creating a new path called: $1"

rly lite delete gameofzoneshub-2 
rly lite delete muzamint
rly paths generate muzamint transfer gameofzoneshub-2 transfer $1 -f -d

rly config show | grep -A 20 "$1"

rly lite init gameofzoneshub-2 -f
rly lite init muzamint -f
rly tx link $1 -d


rly ch l
rly pth l
