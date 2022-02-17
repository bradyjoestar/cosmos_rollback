#!/bin/bash

sleep 30

docker stop peer3
docker rm peer3

# build local rollback
cd ~/go/src/github.com/yihuang/cosmos-sdk/
make install

cd ~/no_go_project/github.com/wbprivate/teleport_tools/develop_devops_tools/cosmos_config_generate/

simd  rollback  --home ~/cosmos_testnet/validators/validator3/simd/
sleep 10


docker run -itd  --net cosmos-br4  --ip 172.172.1.5 --name=peer3  -p 26686:26656 -p 26687:26657 -v ~/cosmos_testnet/validators/validator3/simd/:/root/simd  -v ~/go/bin/simd:/usr/bin/simd ubuntu:20.04  simd start --home /root/simd --log_level info
