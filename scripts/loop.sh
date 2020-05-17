#!/bin/bash
cd /home/mwang 
/home/mwang/go/bin/rly query balance muzamint-1b
/home/mwang/go/bin/rly query balance gameofzoneshub-1b 
echo "--> send muza token"
/home/mwang/go/bin/rly tx transfer muzamint-1b gameofzoneshub-1b 1muza true cosmos1runeqr6aagcgv9ysw420mvw0sfymsz58szxew9 -d
echo "-------"
/home/mwang/go/bin/rly query balance muzamint-1b 
echo "-------"
/home/mwang/go/bin/rly query balance gameofzoneshub-1b 
