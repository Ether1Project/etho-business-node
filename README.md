# etho-upload-gateway
Etho Protocol Upload Gateway Deployment

<div class="bg-gray-dark">
<img src="https://github.com/Ether1Project/Ether-1-Branding/raw/master/PNG%20Logos/ethoProtocolBlack.png" width="200" />
</div>

# Etho Protocol Upload Gateway Deployment

Deployment Instructions/Scripting For a Local/Decentralized Upload Gateway [Etho Protocol](https://ethoprotocol.com)

## Installation/Deplopyment
```
// Clone the deployment repo
git clone https://github.com/Ether1Project/etho-upload-gateway.git

// Execute deployment script (you will need sudo credentials during deployment to create system services)
chmod +x etho-upload-gateway/deploy.sh
./etho-upload-gateway/deploy.sh
```

## Testing Deployment
```
// Check that Etho Protocol node system service is running
sudo systemctl status ethern1ode

// Check that IPFS API node system service is running
sudo systemctl status ipfs

// Check localhost access to upload API
curl -X POST http://127.0.0.1:5001/api/v0/swarm/peers

// Check localhost access to Etho Protocol RPC
curl -X POST  -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}' http://127.0.0.1:8545
```

## Upload Sample Application 
You will need to have NPM/NodeJS installed
```
sudo apt install nodejs
sudo apt install npm
```
### Installing Dependencies & Running Sample Application
```
cd etho-upload-gateway/sample
npm install
npm run start
```
