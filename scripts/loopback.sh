#!/bin/bash
cd /home/mwang 
/home/mwang/go/bin/rly query balance muzamint-2 
/home/mwang/go/bin/rly query balance gameofzoneshub-2a 
echo "xxx loop back a muza token xxx"

/home/mwang/go/bin/rly tx transfer gameofzoneshub-2a muzamint-2 3muza false cosmos10y9827y2s42kc7e5n8je3zqpdw37hjdzyh0xxj 
echo "-------"
/home/mwang/go/bin/rly query balance muzamint-2 
echo "-------"
/home/mwang/go/bin/rly query balance gameofzoneshub-2a 
