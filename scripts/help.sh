#!/bin/sh
echo "creating a new path called: $1"

rly lite delete muzamint-2 
rly lite delete gameofzoneshub-2a 
rly paths generate muzamint-2 transfer gameofzoneshub-2a transfer $1 -f -d

rly config show | grep -A 20 "$1"

rly lite init muzamint-2 -f
rly lite init gameofzoneshub-2a -f
rly tx link $1 -d

rly ch l
rly pth l
