#!/bin/bash

#!/bin/bash
simd testnet init-files  --output-dir ./cosmos_testnet/validators\
 --chain-id simdwb_7001-1 \
 --keyring-backend test --node-dir-prefix validator \
--starting-ip-address 172.172.1.2 172.172.1.2 172.172.1.3 172.172.1.4
