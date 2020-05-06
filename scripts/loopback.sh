#!/bin/bash
cd /home/mwang 
/home/mwang/go/bin/rly query balance gameofzoneshub-1a 
echo "xxx loop back a muza token xxx"

/home/mwang/go/bin/rly tx transfer gameofzoneshub-1a muzamint 1muza false cosmos1ht626k90s43jrwjfjt805zmad8hgy5fxskc2ly -d
echo "-------"
/home/mwang/go/bin/rly query balance muzamint 
echo "-------"
/home/mwang/go/bin/rly query balance gameofzoneshub-1a 
