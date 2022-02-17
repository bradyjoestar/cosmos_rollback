#!/bin/bash

rm -rf ~/cosmos_testnet
cp -r cosmos_testnet ~/

docker rm -f $(docker ps -aq)

# remove existed network
docker network rm  cosmos-br4

# create new network
docker network create --subnet=172.172.1.0/24 cosmos-br4

# start-contianer
docker run -itd  --net cosmos-br4  --ip 172.172.1.2 --name=peer0  -p 26656:26656 -p 26657:26657 -v ~/cosmos_testnet/validators/validator0/simd/:/root/simd  -v ~/go/bin/simd:/usr/bin/simd ubuntu:20.04  simd start --home /root/simd --log_level info
docker run -itd  --net cosmos-br4  --ip 172.172.1.3 --name=peer1  -p 26666:26656 -p 26667:26657 -v ~/cosmos_testnet/validators/validator1/simd/:/root/simd  -v ~/go/bin/simd:/usr/bin/simd ubuntu:20.04  simd start --home /root/simd --log_level info
docker run -itd  --net cosmos-br4  --ip 172.172.1.4 --name=peer2  -p 26676:26656 -p 26677:26657 -v ~/cosmos_testnet/validators/validator2/simd/:/root/simd  -v ~/go/bin/simd:/usr/bin/simd ubuntu:20.04  simd start --home /root/simd --log_level info
docker run -itd  --net cosmos-br4  --ip 172.172.1.5 --name=peer3  -p 26686:26656 -p 26687:26657 -v ~/cosmos_testnet/validators/validator3/simd/:/root/simd  -v ~/go/bin/simd:/usr/bin/simd ubuntu:20.04  simd start --home /root/simd --log_level info
