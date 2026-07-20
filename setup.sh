#!/bin/bash
echo "Bigcoin BGC Node Setup - bigcoin.me"
GH="https://github.com/BigcoinBGC/bigcoin/releases/latest/download"
echo "[1/4] Downloading binaries from GitHub..."
wget -q --show-progress $GH/bitcoind -O /usr/local/bin/bitcoind
wget -q --show-progress $GH/bitcoin-cli -O /usr/local/bin/bitcoin-cli
chmod +x /usr/local/bin/bitcoind /usr/local/bin/bitcoin-cli
echo "[2/4] Creating configuration..."
mkdir -p ~/.bitcoin
echo server=1 > ~/.bitcoin/bitcoin.conf
echo daemon=1 >> ~/.bitcoin/bitcoin.conf
echo rpcuser=bgcnode >> ~/.bitcoin/bitcoin.conf
echo rpcpassword=bgcnode2026 >> ~/.bitcoin/bitcoin.conf
echo maxconnections=16 >> ~/.bitcoin/bitcoin.conf
echo "[3/4] Downloading blockchain from bigcoin.me..."
wget -q --show-progress https://bigcoin.me/bootstrap/bgc_bootstrap.tar.gz -O /tmp/bgc_bootstrap.tar.gz
tar -xzf /tmp/bgc_bootstrap.tar.gz -C ~/.bitcoin/
rm /tmp/bgc_bootstrap.tar.gz
echo "[4/4] Starting BGC node..."
bitcoind
echo "BGC Node is running!"
echo "Check: bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getblockcount"
echo "Mining: stratum+tcp://95.111.234.167:3333"
