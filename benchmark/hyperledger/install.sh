#!/bin/bash
# installing hyperledger-fabric with docker 

cd `dirname ${BASH_SOURCE-$0}`
. env.sh

# sudo cp docker /etc/default/
# sudo service docker restart
# sudo apt-get install -y libsnappy-dev zlib1g-dev libbz2-dev
# cd $HL_DATA
# wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
# tar -zxvf go1.7.3.linux-amd64.tar.gz

# git clone https://github.com/facebook/rocksdb.git
# cd rocksdb
# git checkout v4.1
# PORTABLE=1 make shared_lib
# sudo INSTALL_PATH=/usr/local make install-shared

# cd $HL_DATA
# mkdir -p src/github.com/hyperledger
# cd src/github.com/hyperledger
# git clone https://github.com/hyperledger/fabric
# cd fabric
# git checkout e728c5c22160620e189e85be6becb7cbf75d87dc
# cp $HL_HOME/hl_core.yaml peer/core.yaml
# make peer

########################################################
###                                rewrite the commands by seafooler                              ###
########################################################
# install docker
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 sudo apt-get update
 sudo apt-get install docker-ce
 sudo usermod -a -G docker $USER
# install dev tools and compilers
sudo apt-get install -y libsnappy-dev zlib1g-dev libbz2-dev
sudo apt-get install build-essential
# install golang
cd /tmp
wget https://redirector.gvt1.com/edgedl/go/go1.7.3.linux-amd64.tar.gz
sudo tar -C /usr/local -zxvf go1.7.3.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile
echo "export GOPATH=\$HOME/go" >> /etc/profile
echo "export PATH=\$PATH:\$GOPATH/bin" >> /etc/profile
source /etc/profile
# create the directory /data/seafooler if not existed
if [ ! -d "$HL_DATA" ]; then
	sudo mkdir -p "$HL_DATA"
	sudo chmod 777 "$HL_DATA"
fi
# install rocksdb
cd $HL_DATA
git clone https://github.com/facebook/rocksdb.git
cd rocksdb
git checkout v4.1
PORTABLE=1 make shared_lib
sudo INSTALL_PATH=/usr/local make install-shared
# install fabric
cd $HL_DATA
mkdir -p src/github.com/hyperledger
cd src/github.com/hyperledger
git clone https://github.com/hyperledger/fabric
cd fabric
git checkout e728c5c22160620e189e85be6becb7cbf75d87dc
cp $HL_HOME/hl_core.yaml peer/core.yaml
. $HL_HOME/env.sh #Make sure the GOAPTH to be right
make peer