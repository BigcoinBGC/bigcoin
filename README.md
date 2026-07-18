# Bigcoin (BGC) — The People's Coin 🪙

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Bigcoin (BGC) is a decentralized SHA-256 Proof of Work cryptocurrency — mine with any Bitcoin ASIC miner!

## Key Facts

- **Ticker:** BGC
- **Algorithm:** SHA-256 (same as Bitcoin)
- **Max Supply:** 21,000,000 BGC
- **Block Reward:** 50 BGC
- **Block Time:** 10 minutes
- **Port:** 8444
- **Address Prefix:** bgc1q...

## Quick Links

- 🌐 **Website:** https://bigcoin.me
- 💰 **Wallet:** https://bigcoin.me/wallet
- 🔍 **Block Explorer:** https://bigcoin.me/explorer.html
- 📄 **Whitepaper:** https://bigcoin.me/whitepaper.html
- 🐦 **X:** https://x.com/bgc_bigcoin
- 💬 **Telegram:** https://t.me/OfficialBigcoin

---

## Mining BGC

Any SHA-256 Bitcoin ASIC miner works:
- Antminer S9, S17, S19, S21
- Whatsminer M20, M30, M50
- Avalon A1246, A1466, Nano3

**Pool Settings:**
```
URL:      stratum+tcp://95.111.234.167:3333
Username: YourBGCAddress.worker1
Password: x
```

Get your free BGC wallet at: **https://bigcoin.me/wallet**

---

## Running a BGC Node

### Option 1 — Download Pre-compiled Binaries (Recommended)

**Requirements:**
- Ubuntu 20.04 or later (Linux x64)
- 4 GB RAM minimum
- 50 GB storage minimum

**Step 1 — Download binaries:**
```bash
wget https://github.com/BigcoinBGC/bigcoin/releases/download/v1.0.1/bitcoind
wget https://github.com/BigcoinBGC/bigcoin/releases/download/v1.0.1/bitcoin-cli
```

**Step 2 — Make executable and install:**
```bash
chmod +x bitcoind bitcoin-cli
sudo mv bitcoind bitcoin-cli /usr/local/bin/
```

**Step 3 — Create configuration file:**
```bash
mkdir -p ~/.bitcoin
cat > ~/.bitcoin/bitcoin.conf << 'CONF'
server=1
daemon=1
txindex=1
rpcuser=bgcrpc
rpcpassword=YourSecurePassword
rpcport=8332
port=8444
maxconnections=8
addnode=95.111.234.167:8444
fallbackfee=0.0002
walletbroadcast=1
maxtxfee=1.0
nocheckpoints=1
CONF
```

**Step 4 — Start the node:**
```bash
bitcoind
```

**Step 5 — Check sync status:**
```bash
bitcoin-cli getblockcount
bitcoin-cli getpeerinfo
```

---

### Option 2 — Build from Source

**Install dependencies:**
```bash
sudo apt update
sudo apt install -y build-essential cmake git libssl-dev libevent-dev \
libboost-system-dev libboost-filesystem-dev libboost-thread-dev \
libminiupnpc-dev libzmq3-dev libsqlite3-dev
```

**Clone and build:**
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
bitcoin-cli getblockcount

# Check network info
bitcoin-cli getnetworkinfo

# Check balance
bitcoin-cli scantxoutset start '["addr(YourBGCAddress)"]'

# Stop node
bitcoin-cli stop
```

---

## Network Info

- **Main Node:** 95.111.234.167:8444
- **Mining Pool:** stratum+tcp://95.111.234.167:3333
- **Genesis Block:** c048ee6c34f9a061feb673738ef500911ad440fb52a462e20a1e09c319025635

---

## License

MIT License — see [COPYING](COPYING) for details.

---

*Bigcoin (BGC) — The People's Coin — bigcoin.me*
