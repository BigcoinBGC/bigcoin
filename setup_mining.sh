#!/bin/bash
echo "Bigcoin BGC Mining Pool Setup - bigcoin.me"
echo "Enter your BGC wallet address:"
read WALLET
GH="https://github.com/BigcoinBGC/bigcoin/releases/latest/download"
echo "[1/3] Downloading ckpool from GitHub..."
wget -q --show-progress $GH/ckpool -O /usr/local/bin/ckpool
chmod +x /usr/local/bin/ckpool
echo "[2/3] Creating mining pool configuration..."
mkdir -p /etc/ckpool /var/log/ckpool
echo "{" > /etc/ckpool/ckpool.conf
echo "  "btcd": [{"url": "127.0.0.1:8332", "auth": "bgcnode", "pass": "bgcnode2026", "notify": true}]," >> /etc/ckpool/ckpool.conf
echo "  "btcaddress": ""," >> /etc/ckpool/ckpool.conf
echo "  "btcsig": "BGC Pool"," >> /etc/ckpool/ckpool.conf
echo "  "blockpoll": 100," >> /etc/ckpool/ckpool.conf
echo "  "serverurl": ["0.0.0.0:3333"]," >> /etc/ckpool/ckpool.conf
echo "  "mindiff": 512," >> /etc/ckpool/ckpool.conf
echo "  "startdiff": 4096," >> /etc/ckpool/ckpool.conf
echo "  "btcsolo": true," >> /etc/ckpool/ckpool.conf
echo "  "logdir": "/var/log/ckpool"" >> /etc/ckpool/ckpool.conf
echo "}" >> /etc/ckpool/ckpool.conf
echo "[3/3] Starting mining pool..."
ckpool -c /etc/ckpool/ckpool.conf -B
echo ""
echo "BGC Mining Pool is running!"
echo "Connect miners to: stratum+tcp://YOUR-SERVER-IP:3333"
echo "Worker format: YOUR-BGC-ADDRESS.worker1"
echo "Password: x"
