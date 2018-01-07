#repair the environment  variables from dinhtta's OSX to a Linux OS
HL_HOME=/home/seafooler/blockbench/benchmark/hyperledger
HOSTS=$HL_HOME/hosts
CLIENTS=$HL_HOME/clients
HL_DATA=/data/seafooler
GOPATH=$HL_DATA #set the GOPATH variable
HL_SOURCE=$HL_DATA/src/github.com/hyperledger/fabric
LOG_DIR=$HL_HOME/log_dir
EXE_HOME=/home/seafooler/blockbench/src/macro/kvstore
#EXE_HOME=/users/dinhtta/anh/wangji_3/blockchain-perf/src/donothing  #need to be repaired later
BENCHMARK=ycsb

##comment these out for smallbank
#EXE_HOME=$HL_HOME/../../src/smallbank/hyperledger
#BENCHMARK=smallbank
