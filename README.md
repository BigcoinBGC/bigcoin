# Bigcoin (BGC) — The People's Coin 🪙

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Bigcoin (BGC) is a decentralized SHA-256 Proof of Work cryptocurrency — mine with any Bitcoin ASIC miner!

## Key Facts

| Property | Value |
|----------|-------|
| Ticker | BGC |
| Algorithm | SHA-256 (same as Bitcoin) |
| Max Supply | 21,000,000 BGC |
| Block Reward | 50 BGC |
| Block Time | 10 minutes |
| P2P Port | 8444 |
| Address Prefix | bgc1q... |
| DNS Seed | seed.bigcoin.me |

## Quick Links

- 🌐 **Website:** https://bigcoin.me
- 💰 **Wallet:** https://bigcoin.me/wallet
- 🔍 **Block Explorer:** https://bigcoin.me/explorer.html
- 📄 **Whitepaper:** https://bigcoin.me/whitepaper.html
- 🐦 **X:** https://x.com/bgc_bigcoin
- 💬 **Telegram:** https://t.me/OfficialBigcoin

---

## 🚀 Quick Start — Run a BGC Node (3 commands)

```bash
wget https://raw.githubusercontent.com/BigcoinBGC/bigcoin/master/setup.sh
chmod +x setup.sh
./setup.sh
```

That's it! The script automatically:
- Downloads BGC binaries from GitHub
- Creates configuration
- Downloads blockchain from bigcoin.me (535MB)
- Starts your node

**Check your node is running:**
```bash
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getblockcount
```

---

## ⛏️ Run a Mining Pool (3 commands)

First make sure your node is running and synced, then:

```bash
wget https://raw.githubusercontent.com/BigcoinBGC/bigcoin/master/setup_mining.sh
chmod +x setup_mining.sh
./setup_mining.sh
```

The script will ask for your BGC wallet address and set up everything automatically.

**Connect your ASIC miner to:**
```
URL:      stratum+tcp://YOUR-SERVER-IP:3333
Username: YOUR-BGC-ADDRESS.worker1
Password: x
```

Get a free BGC wallet at: **https://bigcoin.me/wallet**

---

## Mining on Main Pool

Any SHA-256 Bitcoin ASIC miner works:
- Antminer S9, S17, S19, S21
- Whatsminer M20, M30, M50
- Avalon A1246, A1466, Nano3

**Main Pool Settings:**
```
URL:      stratum+tcp://95.111.234.167:3333
Username: YourBGCAddress.worker1
Password: x
```

---

## Manual Node Setup

### Requirements
- Ubuntu 20.04 or later (Linux x64)
- 4 GB RAM minimum
- 50 GB storage minimum

### Step 1 — Download binaries
```bash
wget https://github.com/BigcoinBGC/bigcoin/releases/latest/download/bitcoind
wget https://github.com/BigcoinBGC/bigcoin/releases/latest/download/bitcoin-cli
chmod +x bitcoind bitcoin-cli
sudo mv bitcoind bitcoin-cli /usr/local/bin/
```

### Step 2 — Create configuration
```bash
mkdir -p ~/.bitcoin
echo "server=1" > ~/.bitcoin/bitcoin.conf
echo "daemon=1" >> ~/.bitcoin/bitcoin.conf
echo "rpcuser=bgcnode" >> ~/.bitcoin/bitcoin.conf
echo "rpcpassword=bgcnode2026" >> ~/.bitcoin/bitcoin.conf
echo "maxconnections=16" >> ~/.bitcoin/bitcoin.conf
```

### Step 3 — Download blockchain (faster sync)
```bash
wget https://bigcoin.me/bootstrap/bgc_bootstrap.tar.gz
tar -xzf bgc_bootstrap.tar.gz -C ~/.bitcoin/
rm bgc_bootstrap.tar.gz
```

### Step 4 — Start node
```bash
bitcoind
```

### Step 5 — Verify sync
```bash
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getblockcount
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getblockchaininfo
```

---

## Build from Source

### Install dependencies
```bash
sudo apt update
sudo apt install -y build-essential cmake git libssl-dev libevent-dev \
libboost-system-dev libboost-filesystem-dev libboost-thread-dev \
libminiupnpc-dev libzmq3-dev libsqlite3-dev
```

### Clone and build
```bash
git clone https://github.com/BigcoinBGC/bigcoin.git
cd bigcoin
cmake -B build -DENABLE_IPC=OFF -DBUILD_TESTS=OFF
cmake --build build -j4
sudo cmake --install build
```

---

## Auto-start on Boot

```bash
(crontab -l; echo "@reboot sleep 30 && bitcoind") | crontab -
```

---

## Useful Commands

```bash
# Check block height
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getblockcount

# Check sync status
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getblockchaininfo

# Check peers
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getpeerinfo

# Check mining info
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 getmininginfo

# Stop node
bitcoin-cli -rpcuser=bgcnode -rpcpassword=bgcnode2026 stop
```

---

## Network Info

- **Main Node:** 95.111.234.167:8444
- **DNS Seed:** seed.bigcoin.me
- **Mining Pool:** stratum+tcp://95.111.234.167:3333
- **Bootstrap:** https://bigcoin.me/bootstrap/bgc_bootstrap.tar.gz

---

## License

MIT License — see [COPYING](COPYING) for details.

---

*Bigcoin (BGC) — The People's Coin — bigcoin.me*
