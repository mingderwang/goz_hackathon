# Update the system and install dependancies
#sudo apt update
#sudo apt install build-essential jq -y

# Install latest go version https://golang.org/doc/install
#wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz
#sudo tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz

# Add $GOPATH, $GOBIN and both to $PATH
#echo "" >> ~/.profile
#echo 'export GOPATH=$HOME/go' >> ~/.profile
#echo 'export GOBIN=$GOPATH/bin' >> ~/.profile
#echo 'export PATH=$PATH:/usr/local/go/bin:$GOBIN' >> ~/.profile
#echo "export GAIA=\$GOPATH/src/github.com/cosmos/gaia" >> ~/.profile
#echo "export RELAYER=\$GOPATH/src/github.com/cosmos/relayer" >> ~/.profile
#source ~/.profile

# Set these variables to different values that are specific to your chain
# Also, ensure they are set to make the commands below run properly
export DENOM=muza
export CHAINID=muzamint-1b
export DOMAIN=muzamint.com
export RLYKEY=faucet
export GAIASHA=bde5e9c
export ACCOUNT_PREFIX=cosmos

# Start by downloading and installing both gaia and the relayer
mkdir -p $(dirname $GAIA) && git clone https://github.com/cosmos/gaia $GAIA && cd $GAIA && git checkout $GAIASHA && make install
mkdir -p $(dirname $RELAYER) && git clone https://github.com/cosmos/relayer $RELAYER && cd $RELAYER && make install

# Now its time to configure both the relayer and gaia, start with the relayer
cd
rly config init
echo "{\"key\":\"$RLYKEY\",\"chain-id\":\"$CHAINID\",\"rpc-addr\":\"http://$DOMAIN:26657\",\"account-prefix\":\"$ACCOUNT_PREFIX\",\"gas\":200000,\"gas-prices\":\"0.025$DENOM\",\"default-denom\":\"$DENOM\",\"trusting-period\":\"330h\"}" > $CHAINID.json
# NOTE: you will want to save the content from this JSON file
rly chains add -f $CHAINID.json
rly keys add $CHAINID $RLYKEY

# Move on to configuring gaia
gaiad init --chain-id $CHAINID $CHAINID
# NOTE: ensure that the gaia rpc is open to all connections
sed -i 's#tcp://127.0.0.1:26657#tcp://0.0.0.0:26657#g' ~/.gaiad/config/config.toml
sed -i "s/stake/$DENOM/g" ~/.gaiad/config/genesis.json
sed -i 's/pruning = "syncable"/pruning = "nothing"/g' ~/.gaiad/config/app.toml
gaiacli keys add validator

# Now its time to construct the genesis file
gaiad add-genesis-account $(gaiacli keys show validator -a) 100000000000$DENOM,10000000samoleans
gaiad add-genesis-account $(rly chains addr $CHAINID) 10000000000000$DENOM,10000000samoleans
gaiad gentx --name validator --amount 90000000000$DENOM
gaiad collect-gentxs

# Setup the service definitions
rly dev gaia $USER $HOME > gaiad.service
rly dev faucet $USER $HOME $CHAINID $RLYKEY 100000$DENOM > faucet.service
sudo mv gaiad.service /etc/systemd/system/gaiad.service
sudo mv faucet.service /etc/systemd/system/faucet.service
sudo systemctl daemon-reload
sudo systemctl start gaiad
sudo systemctl start faucet

# Server _should_ be ready to go!
# Be sure you have the text from ~/$CHAINID.json for the next step
