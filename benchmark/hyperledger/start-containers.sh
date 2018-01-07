#!/bin/bash -v

cd `dirname ${BASH_SOURCE-$0}`
. env.sh

source /etc/profile


# start peers
# docker run -d --rm --ip 172.20.0.50 --net docker1 --hostname=peer0 --name peer0 seafooler/blockbench:v7
# ssh 172.20.0.50 . $HL_HOME/start-root.sh 

# docker run -d --rm --ip 172.20.0.51 --net docker1 --hostname=peer1 --name peer1 seafooler/blockbench:v7
# ssh 172.20.0.51 . $HL_HOME/start-slave.sh 172.20.0.50 1

# docker run -d --rm --ip 172.20.0.52 --net docker1 --hostname=peer2 --name peer2 seafooler/blockbench:v7
# ssh 172.20.0.52 . $HL_HOME/start-slave.sh 172.20.0.50 2

# docker run -d --rm --ip 172.20.0.53 --net docker1 --hostname=peer3 --name peer3 seafooler/blockbench:v7
# ssh 172.20.0.53 . $HL_HOME/start-slave.sh 172.20.0.50 3

# sleep 5

# start clients
docker run -d --rm --ip 172.20.0.90 --net docker1 --hostname=client0 --name client0 seafooler/blockbench:v9
echo 172.20.0.90 index 0
sleep 1
ssh -oStrictHostKeyChecking=no 172.20.0.90 $HL_HOME/start-clients.sh 32 0 4 8

docker run -d --rm --ip 172.20.0.89 --net docker1 --hostname=client1 --name client1 seafooler/blockbench:v9
echo 172.20.0.89 index 1
sleep 1
ssh -oStrictHostKeyChecking=no 172.20.0.89 $HL_HOME/start-clients.sh 32 1 4 8

