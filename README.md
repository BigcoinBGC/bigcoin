# Bigcoin (BGC)

## The People’s Coin 🪙

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0.0-gold)](https://github.com/BigcoinBGC/bigcoin)
[![Network](https://img.shields.io/badge/network-mainnet-green)](https://bigcoin.me)

Bigcoin (BGC) is a decentralized peer-to-peer digital currency for everyone in the world. Built on proven Bitcoin Core technology with a fixed supply of **21,000,000 BGC**.

> **“The People’s Coin”** — Secure, Decentralized, Accessible to Everyone.

-----

## 🌐 Links

- **Website:** <https://bigcoin.me>
- **Mining Dashboard:** <https://bigcoin.me>
- **BGC Wallet:** <https://bigcoin.me/wallet>
- **Whitepaper:** <https://bigcoin.me/whitepaper.html>
- **Telegram:** <https://t.me/OfficialBigcoin>

-----

## ⚡ Key Features

- ✅ **21,000,000 BGC** hard cap — deflationary by design
- ✅ **SHA-256 Proof of Work** — same as Bitcoin
- ✅ **10 minute blocks** — stable and reliable
- ✅ **Native SegWit addresses** — bgc1q… format
- ✅ **Halving every 210,000 blocks** — every 4 years
- ✅ **Open Source** — fully auditable code
- ✅ **Mobile Wallet** — iOS and Android

-----

## 📊 Technical Specifications

|Parameter       |Value                 |
|----------------|----------------------|
|Ticker          |BGC                   |
|Max Supply      |21,000,000 BGC        |
|Smallest Unit   |1 Sam (0.00000001 BGC)|
|Block Reward    |50 BGC                |
|Block Time      |10 minutes            |
|Halving Interval|210,000 blocks        |
|Algorithm       |SHA-256 (PoW)         |
|Address Format  |bgc1q… (bech32)       |
|P2P Port        |8444                  |
|Mining Port     |3333                  |

-----

## 🔧 Building from Source

### Requirements

- Ubuntu 20.04 or later (recommended)
- 4GB RAM minimum
- 50GB storage

### Install Dependencies

```bash
sudo apt-get update
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config \
  bsdmainutils python3 libssl-dev libevent-dev libboost-system-dev \
  libboost-filesystem-dev libboost-test-dev libboost-thread-dev \
  libminiupnpc-dev libzmq3-dev libsqlite3-dev
```

### Clone and Build

```bash
git clone https://github.com/BigcoinBGC/bigcoin.git
cd bigcoin
./autogen.sh
./configure --without-gui --disable-tests --disable-bench
make -j4
sudo make install
```

-----

## 🚀 Running a BGC Node

### Create Configuration

```bash
mkdir -p ~/.bitcoin
cat > ~/.bitcoin/bitcoin.conf << EOF
server=1
daemon=1
txindex=1
rpcuser=yourrpcuser
rpcpassword=yoursecurepassword
rpcport=8332
port=8444
maxconnections=8
addnode=95.111.234.167
fallbackfee=0.0002
walletbroadcast=1
EOF
```

### Start the Node

```bash
bitcoind
```

### Check Status

```bash
bitcoin-cli getblockchaininfo
bitcoin-cli getblockcount
```

-----

## ⛏️ Mining BGC

BGC uses SHA-256 algorithm — compatible with all Bitcoin ASIC miners.

**Pool Settings:**

```
URL:      stratum+tcp://95.111.234.167:3333
Worker:   bgc1q[your-address].worker1
Password: x
```

-----

## 💰 BGC Wallet

- 🌐 **Web:** <https://bigcoin.me/wallet>
- 📱 **iOS:** Available on the App Store
- 🤖 **Android:** Coming soon

-----

## 📈 Supply Schedule

|Halving|Block Range        |Reward   |Year |
|-------|-------------------|---------|-----|
|Genesis|0 - 210,000        |50 BGC   |2026 |
|1st    |210,001 - 420,000  |25 BGC   |~2030|
|2nd    |420,001 - 630,000  |12.5 BGC |~2034|
|3rd    |630,001 - 840,000  |6.25 BGC |~2038|
|4th    |840,001 - 1,050,000|3.125 BGC|~2042|

-----

## 🤝 Community

- **Telegram:** <https://t.me/OfficialBigcoin>
- **Website:** <https://bigcoin.me>

-----

## 📄 License

Released under the MIT license. See <COPYING> for more information.

-----

*Bigcoin (BGC) — The People’s Coin — bigcoin.me*