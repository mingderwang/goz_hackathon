#!/bin/bash
cd /home/mwang 
/home/mwang/go/bin/rly query balance muzamint 
/home/mwang/go/bin/rly query balance gameofzoneshub-1a 
echo "--> send muza token"
/home/mwang/go/bin/rly tx transfer muzamint gameofzoneshub-1a 1muza true cosmos1runeqr6aagcgv9ysw420mvw0sfymsz58szxew9 -d
echo "-------"
/home/mwang/go/bin/rly query balance muzamint 
echo "-------"
/home/mwang/go/bin/rly query balance gameofzoneshub-1a 
