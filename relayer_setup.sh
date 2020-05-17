# install the relayer
#export RELAYER=$GOPATH/src/github.com/cosmos/relayer
#mkdir -p $(dirname $RELAYER) && git clone git@github.com:cosmos/relayer $RELAYER && cd $RELAYER
#make install

# then to configure your local relayer to talk to your remote chain
# get the json from $CHAINID.json on your server
rly cfg init
rly ch add -f muzamint-1b.json

# create a local rly key for the chain
rly keys add muzamint-1b testkey

# confiure the chain to use that key by default
rly ch edit muzamint-1b key testkey

# initialize the lite client for {{chain_id}}
rly lite init muzamint-1b -f

# request funds from the faucet to test it
rly tst request muzamint-1b testkey

# you should see a balance for the rly key now
rly q bal muzamint-1b 
