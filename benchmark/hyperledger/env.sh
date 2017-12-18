#repair the environment  variables from dinhtta's OSX to a Linux OS
HL_HOME=/home/$SUDO_USER/blockbench/benchmark/hyperledger
HOSTS=$HL_HOME/hosts
CLIENTS=$HL_HOME/clients
HL_DATA=/data/$SUDO_USER
GOPATH=$HL_DATA #set the GOPATH variable
HL_SOURCE=$HL_DATA/src/github.com/hyperledger/fabric
LOG_DIR=$HL_HOME/donothing_donothingresults_1
EXE_HOME=/users/dinhtta/anh/wangji_3/blockchain-perf/src/donothing  #need to be repaired later
BENCHMARK=ycsb

##comment these out for smallbank
#EXE_HOME=$HL_HOME/../../src/smallbank/hyperledger
#BENCHMARK=smallbank
