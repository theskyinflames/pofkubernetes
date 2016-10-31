#!/bin/bash

#export KUBERNETES_MASTER_IP=$(cat ./master.log|grep "Master ip:"|sed -e 's/==> master: Master ip://g')
export KUBERNETES_MASTER_IP=192.168.33.10
echo "KUBERNETES_MASTER_IP ${KUBERNETES_MASTER_IP}"

# Starting the master
echo "Starting the master ..."
cd ./master
vagrant up --provider=virtualbox > ../master.log 2>&1
echo "Master started"

# Generate token variable
cd ..
export KUBERNETES_MASTER_TOKEN=$(cat ./master.log|grep "generated token"|awk '{print $6}'|sed 's/"//g')
echo "KUBERNETES_MASTER_TOKEN ${KUBERNETES_MASTER_TOKEN}"


# Add the node 1
echo "Adding node 1 ..."
cd ./node1
vagrant up --provider=virtualbox > ../node1.log 2>&1
echo "Node 1 added"

# Add the node 2
echo "Adding node 2 ..."
cd ./node2
vagrant up --provider=virtualbox > ../node2.log 2>&1
echo "Node 2 added"

# Add the node 3
echo "Adding node 3 ..."
cd ./node3
vagrant up --provider=virtualbox > ../node3.log 2>&1
echo "Node 3 added"
