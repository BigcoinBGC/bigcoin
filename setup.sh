#!/bin/bash
echo "Bigcoin BGC Node Setup - bigcoin.me"
GH="https://github.com/BigcoinBGC/bigcoin/releases/latest/download"
RAW="https://raw.githubusercontent.com/BigcoinBGC/bigcoin/master"
echo "[1/5] Downloading binaries from GitHub..."
wget -q --show-progress $GH/bitcoind -O /usr/local/bin/bitcoind
wget -q --show-progress $GH/bitcoin-cli -O /usr/local/bin/bitcoin-cli
chmod +x /usr/local/bin/bitcoind /usr/local/bin/bitcoin-cli
echo "[2/5] Creating configuration..."
mkdir -p ~/.bitcoin
echo server=1 > ~/.bitcoin/bitcoin.conf
echo daemon=1 >> ~/.bitcoin/bitcoin.conf
echo rpcuser=bgcnode >> ~/.bitcoin/bitcoin.conf
echo rpcpassword=bgcnode2026 >> ~/.bitcoin/bitcoin.conf
echo maxconnections=16 >> ~/.bitcoin/bitcoin.conf
echo "[3/5] Downloading blockchain from bigcoin.me..."
wget -q --show-progress https://bigcoin.me/bootstrap/bgc_bootstrap.tar.gz -O /tmp/bgc_bootstrap.tar.gz
tar -xzf /tmp/bgc_bootstrap.tar.gz -C ~/.bitcoin/
rm /tmp/bgc_bootstrap.tar.gz
echo "[4/5] Setting up systemd service..."
wget -q $RAW/bitcoind.service -O /etc/systemd/system/bitcoind.service
systemctl daemon-reload
systemctl enable bitcoind
echo "[5/5] Starting BGC node..."
systemctl start bitcoind
echo ""
echo "BGC Node is running as a system service!"
echo "Check status: systemctl status bitcoind"
echo "Check sync: bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getblockcount"
echo "Mining pool: stratum+tcp://95.111.234.167:3333"
echo "Website: https://bigcoin.me"
