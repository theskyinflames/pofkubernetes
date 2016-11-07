#!/bin/bash

export KUBERNETES_MASTER_IP=192.168.33.10
echo "KUBERNETES_MASTER_IP ${KUBERNETES_MASTER_IP}"

export HOST_NETWORK_INTERFACE=enp3s0

# Starting the master
echo "Starting the master ..."
cd ./master
vagrant up --provider=virtualbox > ../master.log 2>&1
echo "Master started"
cd ..

# Generate token variable
export KUBERNETES_MASTER_TOKEN=$(cat ./master.log|grep "generated token"|awk '{print $6}'|sed 's/"//g')
echo "KUBERNETES_MASTER_TOKEN ${KUBERNETES_MASTER_TOKEN}"

# Setting master's environment variables into node's initalization files
sed -i -E "s/KUBERNETES_MASTER_IP=(.*)$/KUBERNETES_MASTER_IP=$KUBERNETES_MASTER_IP/g" ./node1/initialize_node1.sh
sed -i -E "s/KUBERNETES_MASTER_TOKEN=(.*)$/KUBERNETES_MASTER_TOKEN=$KUBERNETES_MASTER_TOKEN/g" ./node1/initialize_node1.sh
sed -i -E "s/KUBERNETES_MASTER_IP=(.*)$/KUBERNETES_MASTER_IP=$KUBERNETES_MASTER_IP/g" ./node2/initialize_node2.sh
sed -i -E "s/KUBERNETES_MASTER_TOKEN=(.*)$/KUBERNETES_MASTER_TOKEN=$KUBERNETES_MASTER_TOKEN/g" ./node2/initialize_node2.sh
sed -i -E "s/KUBERNETES_MASTER_IP=(.*)$/KUBERNETES_MASTER_IP=$KUBERNETES_MASTER_IP/g" ./node3/initialize_node3.sh
sed -i -E "s/KUBERNETES_MASTER_TOKEN=(.*)$/KUBERNETES_MASTER_TOKEN=$KUBERNETES_MASTER_TOKEN/g" ./node3/initialize_node3.sh


# Adding the node 1
echo "Adding node 1 ..."
cd ./node1
vagrant up --provider=virtualbox > ../node1.log 2>&1
cd ..
echo "Node 1 added"

# Adding the node 2
echo "Adding node 2 ..."
cd ./node2
vagrant up --provider=virtualbox > ../node2.log 2>&1
cd ..
echo "Node 2 added"

# Add the node 3
echo "Adding node 3 ..."
cd ./node3
vagrant up --provider=virtualbox > ../node3.log 2>&1
cd ..
echo "Node 3 added"
