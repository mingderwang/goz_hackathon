#!/bin/sh
rm -r ~/.relayer
rly cfg init
rly cfg add-dir /home/mwang/goz_hackathon/demo/

rly keys restore  gameofzoneshub-2a faucet "essay cancel enroll auction breeze chronic assume laundry explain strategy woman execute cup scare client urban random gap neck genuine paddle only twelve deputy"

rly keys restore muzamint-2 faucet "shallow smooth find flush measure letter sustain plastic enact toward valley exile report above clerk govern ready blame insane gauge liberty donate expire gate"

rly keys list gameofzoneshub-2a
rly keys list muzamint-2

rly cfg add-dir /home/mwang/goz_hackathon/demo/


rly lite init muzamint-2 -f
rly lite init gameofzoneshub-2a -f
#rly tx link demo -d
#scripts/help.sh demo1


rly ch l
rly pth l
