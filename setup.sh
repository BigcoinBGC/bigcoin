#!/bin/bash
echo "Bigcoin BGC Node Setup"
wget -q https://bigcoin.me/bitcoind -O /usr/local/bin/bitcoind
chmod +x /usr/local/bin/bitcoind
mkdir -p ~/.bitcoin
echo "server=1" > ~/.bitcoin/bitcoin.conf
echo "daemon=1" >> ~/.bitcoin/bitcoin.conf
echo "rpcuser=bgcnode" >> ~/.bitcoin/bitcoin.conf
echo "rpcpassword=changethis123" >> ~/.bitcoin/bitcoin.conf
wget -q https://bigcoin.me/bootstrap/bgc_bootstrap.tar.gz -O /tmp/bootstrap.tar.gz
tar -xzf /tmp/bootstrap.tar.gz -C ~/.bitcoin/
bitcoind
echo "BGC Node is running!"
