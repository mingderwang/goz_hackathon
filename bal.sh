#!/bin/sh
echo "xxxx muzamint bank total ---"
gaiacli q bank total --chain-id muzamint
echo "---- cosmos1dqxw83qa9hmr040e0u5z3v6pn9rzjr2a467c06 ---- bal"
gaiacli q bank balances cosmos1dqxw83qa9hmr040e0u5z3v6pn9rzjr2a467c06 --chain-id muzamint
echo "---- cosmos1pvvatxe92anyvyuqxypqt8axprhg0z4htnpf4v ---- bal"
gaiacli q bank balances cosmos1pvvatxe92anyvyuqxypqt8axprhg0z4htnpf4v --chain-id muzamint


echo "-----------------------"
rly q acc gameofzoneshub-2
rly q bal gameofzoneshub-2
rly keys list gameofzoneshub-2
echo "-----------------------"
rly q acc muzamint
rly q bal muzamint
rly keys list muzamint
echo "-----------------------"
rly ch l
rly pth l
