#!/bin/sh
echo "creating a new path called: $1"

rly lite delete muzamint-1b 
rly lite delete gameofzoneshub-1b 
rly paths generate muzamint-1b transfer gameofzoneshub-1b transfer $1 -f -d

rly config show | grep -A 20 "$1"

rly lite init muzamint-1b -f
rly lite init gameofzoneshub-1b -f
rly tx link $1 -d


rly ch l
rly pth l
