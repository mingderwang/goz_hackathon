# first ensure the chain is configured locally
cd $RELAYER

# do it either individually...
rly ch a -f testnets/relayer-alpha-2/pylonchain.json

# or add all the chain configurations for the testnet at once...
rly chains add-dir testnets/relayer-alpha-2/

# ensure the lite clients are created locally...
rly lite init {{src_chain_id}} -f 
rly l i {{dst_chain_id}} -f

# ensure each chain has its appropriate key...
rly keys add {{src_chain_id}}
rly k a {{dst_chain_id}}

# ensure you have funds on both chains...
# this adds tokens to your addresses from each chain's faucet
rly testnets request {{src_chain_id}}
rly tst req {{dst_chain_id}}

# either manually add a path by following the prompts...
rly paths add {{src_chain}} {{dst_chain_id}} {{path_name}}

# or generate one...
rly pth gen {{src_chain_id}} transfer {{dst_chain_id}} transfer {{path_name}}

# NOTE: path_name can be any string, but one convention is srcchain_dstchain

# or find all the existing paths...
# NOTE: this command is still under development, but will output
#  a number of existing paths between chains
rly pth find

# ensure that the path exists
rly tx link {{path_name}}

# then send some funds back and forth!
rly q bal {{src_chain_id}}
rly q bal {{dst_chain_id}}
rly tx transfer {{src_chain_id}} {{dst_chain_id}} {{amount}} true $(rly ch addr {{dst_chain_id}})
rly q bal {{src_chain_id}}
rly q bal {{dst_chain_id}}
rly tx xfer {{dst_chain_id}} {{src_chain_id}} {{amount}} false $(rly ch addr {{src_chain_id}})
rly q bal {{src_chain_id}}
rly q bal {{dst_chain_id}}
