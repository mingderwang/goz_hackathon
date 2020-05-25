#!/bin/bash
cd /home/mwang 
/home/mwang/go/bin/rly query balance muzamint-2
/home/mwang/go/bin/rly query balance gameofzoneshub-2a 
echo "--> send muza token"
/home/mwang/go/bin/rly tx transfer muzamint-2 gameofzoneshub-2a 1muza true cosmos1runeqr6aagcgv9ysw420mvw0sfymsz58szxew9 -d
echo "-------"
/home/mwang/go/bin/rly query balance muzamint-2 
echo "-------"
/home/mwang/go/bin/rly query balance gameofzoneshub-2a 
