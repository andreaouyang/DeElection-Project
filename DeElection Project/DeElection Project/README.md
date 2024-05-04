# Election - DApp Tutorial

Learn how to build your first decentralized application (DApp) on the Ethereum Network with this comprehensive tutorial!

## Prerequisites
Make sure you have the following dependencies installed to follow along with the tutorial:
- NPM: [Node.js](https://nodejs.org)
- Truffle: [Truffle Suite](https://github.com/trufflesuite/truffle)
- Ganache: [Truffle Ganache](http://truffleframework.com/ganache/)
- Metamask: [Metamask Extension](https://metamask.io/)

## Step 1: Get the Project

## Step 2: Install Dependencies
```bash
cd election
npm install
```

## Step 3: Start Ganache
Open the Ganache GUI client to start your local blockchain instance. Refer to the free video tutorial for detailed instructions.

## Step 4: Compile & Deploy Election Smart Contract
```bash
truffle migrate --reset
```
You must migrate the Election smart contract each time you restart Ganache.

## Step 5: Configure Metamask
Refer to the free video tutorial for a full explanation of these steps:
- Unlock Metamask
- Connect Metamask to your local Ethereum blockchain provided by Ganache.
- Import an account provided by Ganache.

## Step 6: Run the Front End Application
```bash
npm run dev
```
Visit http://localhost:3000 in your browser to access the front end application.

If you encounter any issues, please consult the free video tutorial for assistance.