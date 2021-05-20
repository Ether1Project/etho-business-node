#!/usr/bin/env sh
[ $SUDO_USER ] && _user=$SUDO_USER || _user=`whoami`

echo "Etho Protocol RPC Setup Initiated"

echo '**************************'
echo 'Installing misc dependencies'
echo '**************************'
# install dependencies
sudo apt-get update && sudo apt-get install systemd libcap2-bin policykit-1 unzip wget -y

echo '**************************'
echo 'Removing Old Node bins'
echo '**************************'
# Remove Geth
sudo rm /usr/sbin/geth
sudo systemctl stop ether1node && sudo systemctl disable ether1node
sudo rm /etc/systemd/system/ether1node.service
# Remove IPFS
sudo rm /usr/sbin/ifps
sudo systemctl stop ipfs && sudo systemctl disable ipfs
sudo rm /etc/systemd/system/ipfs.service
# Remove ethoFS
sudo rm /usr/sbin/ethoFS
sudo systemctl stop ethoFS && sudo systemctl disable ethoFS
sudo rm /etc/systemd/system/ethoFS.service
sudo rm -r $HOME/.ipfs
sudo rm -r $HOME/.ether1

echo '**************************'
echo 'Installing Etho Protcocol Node binary'
echo '**************************'
# Download node binary
wget https://github.com/Ether1Project/Ether1/releases/download/V1.4.5/ether-1-linux-1.4.5.tar.gz
tar -xzf ether-1-linux-1.4.5.tar.gz
# Make node executable
chmod +x geth
# Remove and cleanup
rm ether-1-linux-1.4.5.tar.gz
# Move Binaries
sudo \mv geth /usr/sbin/

echo '**************************'
echo 'Initiating Etho Protocol Node'
echo '**************************'

cat > /tmp/ether1node.service << EOL
[Unit]
Description=Etho RPC Node
After=network.target
[Service]
User=$_user
Group=$_user
Type=simple
Restart=always
ExecStart=/usr/sbin/geth --syncmode=fast --cache=512 --datadir=$HOME/.ether1 -rpc --rpcapi "eth,net,web3" --rpcaddr 127.0.0.1 --rpcport 8545
[Install]
WantedBy=default.target
EOL
sudo \mv /tmp/ether1node.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable ether1node && systemctl start ether1node
sudo systemctl restart ether1node
sudo systemctl status ether1node --no-pager --full

echo '**************************'
echo 'Etho Protocol Node Setup Complete'
echo '**************************'


wget https://dist.ipfs.io/go-ipfs/v0.8.0/go-ipfs_v0.8.0_linux-amd64.tar.gz
tar -xzf go-ipfs_v0.8.0_linux-amd64.tar.gz
chmod +x go-ipfs/ipfs
rm go-ipfs_v0.8.0_linux-amd64.tar.gz
sudo \mv go-ipfs/ipfs /usr/sbin/ipfs
sudo rm -r go-ipfs

echo '****************'
echo 'Initialize IPFS'
echo '****************'

ipfs init
sleep 7

cat > /tmp/ipfs.service << EOL
[Unit]
Description=IPFS Node
After=network.target
[Service]
User=$_user
Group=$_user
Type=simple
Restart=always
ExecStart=/usr/sbin/ipfs daemon
[Install]
WantedBy=default.target
EOL

sudo \mv /tmp/ipfs.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable ipfs && systemctl start ipfs
sudo systemctl status ipfs --no-pager --full
