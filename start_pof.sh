#!/bin/bash

# Starting the master
cd ./master
vagrant up --provider=virtualbox > ../master.log 2>&1

# Generate token variable
cd ..
export KUBERNETES_MASTER_TOKEN=$(cat ./master.log|grep "generated token"|awk '{print $6}'|sed 's/"//g')
export KUBERNETES_MASTER_IP=$(cat ./master.log|grep "Master ip:"|sed -e 's/==> master: Master ip://g')
echo "KUBERNETES_MASTER_TOKEN ${KUBERNETES_MASTER_TOKEN}"
echo "KUBERNETES_MASTER_IP ${KUBERNETES_MASTER_IP}"

# Add the node 1
cd ./node1
vagrant up --provider=virtualbox > ../node1.log 2>&1
