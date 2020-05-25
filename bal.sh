#!/bin/sh
echo "xxxx muzamint bank total ---"
gaiacli q bank total --chain-id muzamint-2
echo "---- cosmos10y9827y2s42kc7e5n8je3zqpdw37hjdzyh0xxj ---- bal"
gaiacli q bank balances cosmos10y9827y2s42kc7e5n8je3zqpdw37hjdzyh0xxj --chain-id muzamint-2


echo "-----------------------"
rly q acc gameofzoneshub-2a
rly q bal gameofzoneshub-2a
rly keys list gameofzoneshub-2a
echo "-----------------------"
rly q acc muzamint-2
rly q bal muzamint-2
rly keys list muzamint-2
echo "-----------------------"
rly ch l
rly pth l
