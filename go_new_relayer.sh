#!/bin/sh
rm -r ~/.relayer
rly cfg init
rly cfg add-dir /home/mwang/goz_hackathon/demo/

rly keys restore  gameofzoneshub-1b faucet "essay cancel enroll auction breeze chronic assume laundry explain strategy woman execute cup scare client urban random gap neck genuine paddle only twelve deputy"

rly keys restore muzamint-1b faucet "current exile nest fault crouch short impose come brother only pony bench arm donor shed like vault blur fever easily year toddler basic goat"

rly keys list gameofzoneshub-1b
rly keys list muzamint-1b

rly cfg add-dir /home/mwang/goz_hackathon/demo/


rly lite init muzamint-1b -f
rly lite init gameofzoneshub-1b -f
#rly tx link demo -d
scripts/help.sh demo1


rly ch l
rly pth l
