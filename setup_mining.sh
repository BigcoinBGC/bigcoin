#!/bin/bash
echo ""
echo "=============================="
echo " Bigcoin BGC Mining Pool Setup"
echo " The Peoples Coin - bigcoin.me"
echo "=============================="
echo ""
echo "Enter your BGC wallet address:"
read WALLET

if [ -z "$WALLET" ]; then
    echo "Error: wallet address cannot be empty!"
    exit 1
fi

GH="https://github.com/BigcoinBGC/bigcoin/releases/latest/download"

echo "[1/3] Downloading ckpool from GitHub..."
wget -q --show-progress $GH/ckpool -O /usr/local/bin/ckpool
chmod +x /usr/local/bin/ckpool

echo "[2/3] Creating mining pool configuration..."
mkdir -p /etc/ckpool /var/log/ckpool

cat > /etc/ckpool/ckpool.conf << CKCONF
{
  "btcd": [{"url": "127.0.0.1:8332", "auth": "bgcnode", "pass": "bgcnode2026", "notify": true}],
  "btcaddress": "${WALLET}",
  "btcsig": "BGC Pool",
  "blockpoll": 100,
  "serverurl": ["0.0.0.0:3333"],
  "mindiff": 512,
  "startdiff": 4096,
  "btcsolo": true,
  "logdir": "/var/log/ckpool"
}
CKCONF

echo "[3/3] Starting mining pool..."
ckpool -c /etc/ckpool/ckpool.conf -B

echo ""
echo "=============================="
echo " BGC Mining Pool is running!"
echo "=============================="
echo ""
echo "Connect miners to: stratum+tcp://YOUR-SERVER-IP:3333"
echo "Worker format: YOUR-BGC-ADDRESS.worker1"
echo "Password: x"
echo ""
echo "Website: https://bigcoin.me"
